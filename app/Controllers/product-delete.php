<?php 

$errors = [];

$id = $_GET['id'] ?? null;
$product = new Product();

$row = $product->first(['id'=>$id]);

if($_SERVER['REQUEST_METHOD'] == "POST" && $row)
{
	$timezone = 'Asia/Singapore';
	date_default_timezone_set($timezone);
	$_POST['date_modified'] = date("Y-m-d H:i:s");
	$_POST['source'] = "Products";
	$_POST['action'] = "DELETE";

	$db = new Database();
	$result = $db->query("SELECT stock FROM products WHERE id = $id");
	if ($result[0]['stock'] == 0){
		$product->audit_trail($row['id'], $_POST);
		$product->delete_item($row['id']);
		redirect('admin&tab=products');
	} else {
		echo '<script>alert("You can only delete a product if the stock is 0");</script>';
	}
	/*/delete old image
	if(file_exists($row['image']))
	{
		unlink($row['image']);
	}
	*/
}


require views_path('products/product-delete');

