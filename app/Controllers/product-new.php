<?php 

$errors = [];

$categoryClass = new Category();
$list_categories = $categoryClass->query("SELECT * FROM categories WHERE if_deleted = 0 ORDER BY name");
if(!$list_categories){
	echo '<script> alert("You don\'t have any category yet. Add first!");
					window.location.href = "index.php?pg=admin&tab=categories";
		  </script>';
	
}

if($_SERVER['REQUEST_METHOD'] == "POST")
{
	$product = new Product();

	$timezone = 'Asia/Singapore';
	date_default_timezone_set($timezone);
	$_POST['date'] = date("Y-m-d H:i:s");
	$_POST['user_id'] = auth("id");
	$_POST['source'] = "Products";
	$_POST['action'] = "ADD";

	$_POST['barcode'] = empty($_POST['barcode']) ? $product->generate_barcode():$_POST['barcode'];
	/*creating barcode
		
		$numbers = '1234567890';
		
		$_POST['barcode'] = substr(str_shuffle($numbers), 0, 9);
		*/
	if(!empty($_FILES['image']['name']))
	{
		$_POST['image'] = $_FILES['image'];
	}

	$errors = $product->validate($_POST);
	if(empty($errors)){
		
		$folder = "uploads/products/";
		if(!file_exists($folder))
		{
			mkdir($folder,0777,true);
		}

		$ext = strtolower(pathinfo($_POST['image']['name'],PATHINFO_EXTENSION));

		$destination = $folder . $product->generate_filename($ext);
		move_uploaded_file($_POST['image']['tmp_name'], $destination);
		$_POST['image'] = $destination;
		
		$product->insert($_POST);
		$product->audit_trail(null, $_POST);

		redirect('admin&tab=products');
	}
}

require views_path('products/product-new');

