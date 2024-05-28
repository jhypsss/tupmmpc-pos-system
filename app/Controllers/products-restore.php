<?php 

$errors = [];

$id = $_GET['id'] ?? null;
$product = new Product();

$row = $product->first(['id'=>$id]);

if($_SERVER['REQUEST_METHOD'] == "POST" && $row)
{
	//$_POST['user_id'] = auth("id");
	$_POST['date'] = date("Y-m-d H:i:s");
	$_POST['source'] = "Products";
	$_POST['action'] = "RESTORE";

	//$product->audit_trail($row['id'], null, "Products", "DELETE");
	$product->audit_trail($row['id'], $_POST);
	$product->restore($row['id']);
  	
	/*/delete old image
	if(file_exists($row['image']))
	{
		unlink($row['image']);
	}
	*/
	redirect('admin&tab=deleted items');
	
}


require views_path('products/product-restore');

