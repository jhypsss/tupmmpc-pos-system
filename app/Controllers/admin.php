<?php 

$tab = $_GET['tab'] ?? 'dashboard';

if($tab == "users")
{

	$limit = 5;
	$pager = new Pager($limit);
	$offset = $pager->offset;

	$userClass = new User();
	$users = $userClass->query("select * from users where if_deleted = 0 order by id desc limit $limit offset $offset");
	$totalUsers = $userClass->query("SELECT COUNT(*) AS total FROM users WHERE if_deleted=0;");
}

else if($tab == "categories")
{
	$categoryClass = new Category();
	$categories = $categoryClass->query("select * from categories WHERE if_deleted = 0 order by name");
	$totalCategories = $categoryClass->query("SELECT COUNT(*) AS total FROM categories WHERE if_deleted=0;");
}

else if($tab == "products")
{
	//$limit = 5;
	//$pager = new Pager($limit);
	//$offset = $pager->offset;

	$productClass = new Product();
	$products = $productClass->query("select * from products where if_deleted = 0 order by id desc");
	$totalProducts = $productClass->query("SELECT COUNT(*) AS total FROM products WHERE if_deleted=0;");
	$stocks = $productClass->query("SELECT * FROM products WHERE stock <= 10 OR stock = 0");	
}
else if($tab == "suppliers")
{
	$supplierClass = new Supplier();
	$suppliers = $supplierClass->query("select * from suppliers where if_deleted = 0 order by company_name");
	$totalSuppliers = $supplierClass->query("SELECT COUNT(*) AS total FROM suppliers WHERE if_deleted=0;");
}


else if($tab == "sales")
{
	
	$section = $_GET['s'] ?? 'table';
	$startdate = $_GET['start'] ?? null;
	$enddate = $_GET['end'] ?? null;


	$saleClass = new Sale();
	
	$limit = $_GET['limit'] ?? 20;
	$limit = (int)$limit;
	$limit = $limit < 1 ? 10 : $limit;

	$pager = new Pager($limit);
	$offset = $pager->offset;

	$query = "select * from sales order by id desc limit $limit offset $offset";
	$totalSales = $saleClass->query("SELECT COUNT(*) AS total FROM sales");

	//get today's sales total
	$year = date("Y");
	$month = date("m");
	$day = date("d");

	$query_total = "SELECT sum(total) as total FROM sales WHERE day(date) = $day && month(date) = $month && year(date) = $year";


	//if both start and end are set
 	if($startdate && $enddate)
 	{
 		
 		$query = "select * from sales where date BETWEEN '$startdate' AND '$enddate' order by id desc limit $limit offset $offset";
 		$query_total = "select sum(total) as total from sales where date BETWEEN '$startdate' AND '$enddate'";
 	
 	}else

	//if only start date is set
 	if($startdate && !$enddate)
 	{
 		$styear = date("Y",strtotime($startdate));
 		$stmonth = date("m",strtotime($startdate));
 		$stday = date("d",strtotime($startdate));
 		
 		$query = "select * from sales where date = '$startdate' order by id desc limit $limit offset $offset";
 		$query_total = "select sum(total) as total from sales where date = '$startdate' ";
 	}
	

	$sales = $saleClass->query($query);

	$st = $saleClass->query($query_total);
	
	$sales_total = 0;
	if($st){
		$sales_total = $st[0]['total'] ?? 0;
	}

	if($section == 'graph')
	{
		//read graph data
		$db = new Database();

		//query todays records
		$today = date('Y-m-d');
		$query = "SELECT total,date FROM sales WHERE DATE(date) = '$today' ";
		$today_records = $db->query($query);

		//query this months records
		$thismonth = date('m');
		$thisyear = date('Y');

		$query = "SELECT total,date FROM sales WHERE month(date) = '$thismonth' && year(date) = '$thisyear'";
		$thismonth_records = $db->query($query);

		//query this years records
		$query = "SELECT total,date FROM sales WHERE year(date) = '$thisyear'";
		$thisyear_records = $db->query($query);

		// Query all records
		$query = "SELECT total, date FROM sales";
		$all_records = $db->query($query);

	}

}

else if($tab == "audit trail")
{
	$audit_trailClass = new Audit_trail();
	$audit_trails = $audit_trailClass->query("select * from audit_trail order by id desc");
	$totalAudit = $audit_trailClass->query("SELECT COUNT(*) AS total FROM audit_trail");
}

else if($tab == "deleted items")
{
	$deleted_itemsClass = new Database();
	$deleted_items = $deleted_itemsClass->query("select * from deleted_items order by id desc");
	$totalDeleted = $deleted_itemsClass->query("SELECT COUNT(*) AS total FROM deleted_items");
}

else if($tab == "dashboard")
{

	$db = new Database();

	//Users Count
	$query = "SELECT COUNT(id) AS total FROM users WHERE if_deleted=0;";
	$myusers = $db->query($query);
	$total_users = $myusers[0]['total'];

	//Categories Count
	$query = "SELECT COUNT(id) AS total FROM categories WHERE if_deleted=0;";
	$mycategory = $db->query($query);
	$total_category = $mycategory[0]['total'];

	//Total Products
	$query = "SELECT COUNT(id) AS total FROM products WHERE if_deleted=0;";
	$myproducts = $db->query($query);
	$total_products = $myproducts[0]['total'];

	//Total Sales
	$query = "select sum(total) as total from sales";
	$mysales = $db->query($query);
	$total_sales = $mysales[0]['total'];

	//Total Suppliers
	$query = "SELECT COUNT(id) AS total FROM Suppliers WHERE if_deleted=0;";
	$mysuppliers = $db->query($query);
	$total_suppliers = $mysuppliers[0]['total'];
	
}



if(Auth::access('Admin')){
	require views_path('admin/admin');
}
else if(Auth::access('Supervisor')){
	require views_path('admin/admin');
}
else if(Auth::access('Manager')){
	require views_path('admin/admin');
}
else{
	Auth::setMessage("You don't have access to the admin page");
	require views_path('auth/denied');
}

