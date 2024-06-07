<?php 

$tab = $_GET['tab'] ?? 'dashboard';

if($tab == "users")
{

	//$limit = 5;
	//$pager = new Pager($limit);
	//$offset = $pager->offset;

	$userClass = new User();
	//$users = $userClass->query("select * from users where if_deleted = 0 order by id desc limit $limit offset $offset");
	$users = $userClass->query("select * from users where if_deleted = 0");
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
	$section = $_GET['s'] ?? 'table';
	$productClass = new Product();
	$products = $productClass->query("select * from products where if_deleted = 0 order by id desc");
	$totalProducts = $productClass->query("SELECT COUNT(*) AS total FROM products WHERE if_deleted=0;");
	$stocks = $productClass->query("SELECT * FROM products WHERE stock <= 10 OR stock = 0");

	if($section == "inventory"){
		$inventorydb = new Database();
		$from_Date = $_GET['from_date'] ?? null;
		$to_Date = $_GET['to_date'] ?? null;

		if($from_Date && $to_Date){ //searched
			if ($from_Date == $to_Date)
				$TimePeriod = "Date: ".date('M j, Y', strtotime($from_Date));
			else 
				$TimePeriod = "Time Period from: ".date('M j, Y', strtotime($from_Date))." to: ". date("M j, Y", strtotime($to_Date));
			
			$StocksPerCategories = $inventorydb->query("SELECT stock_inventory.category_id, categories.name, SUM(stock_inventory.stock_in) AS stock_in_qty, 
															SUM(stock_inventory.stock_out) AS stock_out_qty FROM stock_inventory 
														LEFT JOIN categories ON categories.id = stock_inventory.category_id 
														WHERE date(stock_inventory.date_updated) = BETWEEN '$from_Date' AND '$to_Date' 
														GROUP BY stock_inventory.category_id 
														ORDER BY categories.name;");
			$StocksInventory = $inventorydb->query("SELECT products.barcode, products.description, SUM(stock_inventory.stock_in) AS stock_in_qty, 
															SUM(stock_inventory.stock_out) AS stock_out_qty, products.stock, stock_inventory.date_updated 
													FROM products 
													LEFT JOIN stock_inventory ON products.id = stock_inventory.product_id 
													WHERE date(stock_inventory.date_updated) BETWEEN '$from_Date' AND '$to_Date' 
													GROUP BY products.id 
													ORDER BY products.description;");
		} else { //Today's Sales
			$TimePeriod = "Date: ".date("M j, Y");

			$StocksPerCategories = $inventorydb->query("SELECT stock_inventory.category_id, categories.name, SUM(stock_inventory.stock_in) AS stock_in_qty, 
															SUM(stock_inventory.stock_out) AS stock_out_qty FROM stock_inventory 
														LEFT JOIN categories ON categories.id = stock_inventory.category_id 
														WHERE date(stock_inventory.date_updated) = CURRENT_DATE 
														GROUP BY stock_inventory.category_id 
														ORDER BY categories.name;");
			$StocksInventory = $inventorydb->query("SELECT products.barcode, products.description, SUM(stock_inventory.stock_in) AS stock_in_qty, 
															SUM(stock_inventory.stock_out) AS stock_out_qty, products.stock, stock_inventory.date_updated 
													FROM stock_inventory 
													LEFT JOIN products ON products.id = stock_inventory.product_id 
													WHERE date(stock_inventory.date_updated) = CURRENT_DATE
													GROUP BY products.id 
													ORDER BY products.description;");
			
		}

	}
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

	$query = "select * from sales order by id desc";
	$totalSales = $saleClass->query("SELECT COUNT(*) AS total FROM sales");

	//get today's sales total
	$year = date("Y");
	$month = date("m");
	$day = date("d");

	$query_total = "SELECT sum(total) as total FROM sales WHERE day(date) = $day && month(date) = $month && year(date) = $year";
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

	else if($section == "generate"){
		$salesClass = new Sale();
		$from_Date = $_GET['from_date'] ?? null;
		$to_Date = $_GET['to_date'] ?? null;

		if($from_Date && $to_Date){ //searched
			if ($from_Date == $to_Date)
				$TimePeriod = "Date: ".date('M j, Y', strtotime($from_Date));
			else 
				$TimePeriod = "Time Period: ".date('M j, Y', strtotime($from_Date))." - ". date("M j, Y", strtotime($to_Date));
			
			$SalesPerCategories = $salesClass->query("SELECT category_id, SUM(qty) AS gross_qty, SUM(total) AS gross_sales FROM sales WHERE date(date) BETWEEN '$from_Date' AND '$to_Date' GROUP BY category_id ORDER BY category_id;");
			$SalesPerProducts = $salesClass->query("SELECT barcode, description, amount, SUM(qty) AS gross_qty, SUM(total) AS gross_sales FROM sales WHERE date(date) BETWEEN '$from_Date' AND '$to_Date' GROUP BY description ORDER BY description;");
			$TotalSales = $salesClass->query("SELECT SUM(qty) AS total_grossqty, SUM(total) AS total_grosssales FROM sales WHERE date(date) BETWEEN '$from_Date' AND '$to_Date'");

		} else { //Today's Sales
			$TimePeriod = "Date: ".date("M j, Y");
			$SalesPerCategories = $salesClass->query("SELECT category_id, SUM(qty) AS gross_qty, SUM(total) AS gross_sales FROM sales WHERE date(date) = CURRENT_DATE() GROUP BY category_id ORDER BY category_id;");
			$SalesPerProducts = $salesClass->query("SELECT barcode, description, amount, SUM(qty) AS gross_qty, SUM(total) AS gross_sales FROM sales WHERE date(date) = CURRENT_DATE() GROUP BY description ORDER BY description;");
			$TotalSales = $salesClass->query("SELECT SUM(qty) AS total_grossqty, SUM(total) AS total_grosssales FROM sales WHERE date(date) = CURRENT_DATE();");
		}

	}

}

else if($tab == "removed stocks"){
	$removed_db = new Database();
	$lists = $removed_db->query("SELECT * FROM removed_stocks order by id desc");
}

else if($tab == "refunded items"){
	$refund_db = new Database();
	$refunded_items = $refund_db->query("SELECT * FROM refunded_items order by id desc");
}

else if($tab == "audit trail")
{
	$audit_trailClass = new Audit_trail();
	$audit_trails = $audit_trailClass->query("select * from audit_trail order by id desc");
	$totalAudit = $audit_trailClass->query("SELECT COUNT(*) AS total FROM audit_trail");
}

else if($tab == "deleted items")
{
	$deleted_db = new Database();
	$deleted_items = $deleted_db->query("SELECT * from deleted_items where if_restored = 0 order by id desc");
	$totalDeleted = $deleted_db->query("SELECT COUNT(*) AS total FROM deleted_items");
}
else if($tab == "restored items")
{
	$restored_db = new Database();
	$restored_items = $restored_db->query("select * from restored_items order by id desc");
	//$totalDeleted = $restored_db->query("SELECT COUNT(*) AS total FROM deleted_items");
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
	$query = "SELECT COUNT(id) AS total FROM suppliers WHERE if_deleted=0;";
	$mysuppliers = $db->query($query);
	$total_suppliers = $mysuppliers[0]['total'];
	
}



if(Auth::access('Admin') || Auth::access('Supervisor') || Auth::access('Manager')){
	require views_path('admin/admin');
}
else{
	Auth::setMessage("You don't have access to the admin page");
	require views_path('auth/denied');
}

