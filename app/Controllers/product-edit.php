<?php 

$errors = [];

$id = $_GET['id'] ?? null;
$product = new Product();

$row = $product->first(['id'=>$id]);

$categoryClass = new Category();
$list_categories = $categoryClass->query("SELECT * FROM categories WHERE if_deleted = 0 ORDER BY name");


if($_SERVER['REQUEST_METHOD'] == "POST" && $row)
{
	//$_POST['user_id'] = auth("id");
	$_POST['source'] = "Products";
	$_POST['action'] = "UPDATE";
	$_POST['barcode'] = empty($_POST['barcode']) ? $product->generate_barcode():$_POST['barcode'];

	$_POST['stock'] = $row['stock'];
	$_POST['amount'] = $row['amount'];
	/*
	if(!empty($_POST['addStock'])){
		$_POST['stock'] = $row['stock'] + $_POST['addStock'];
	}*/
	
	if(!empty($_FILES['image']['name']))
	{
		$_POST['image'] = $_FILES['image'];
	}

	$errors = $product->validate($_POST,$row['id']);
	if(empty($errors)){
		
		$folder = "uploads/products/";
		if(!file_exists($folder))
		{
			mkdir($folder,0777,true);
		}

		if(!empty($_POST['image']))
		{

			$ext = strtolower(pathinfo($_POST['image']['name'],PATHINFO_EXTENSION));

			$destination = $folder . $product->generate_filename($ext);
			move_uploaded_file($_POST['image']['tmp_name'], $destination);
			$_POST['image'] = $destination;

			//delete old image
			if(file_exists($row['image']))
			{
				unlink($row['image']);
			}
		
		}
		
		if(!empty($_POST['add_stock']) || !empty($_POST['remove_stock']) || !empty($_POST['increase_amount'])){
			if(!empty($_POST['add_stock'])){
				$_POST['newStock'] = $row['stock'] + $_POST['add_stock'];
			}
			if(!empty($_POST['remove_stock'])){
				$_POST['newStock'] = $row['stock'] - $_POST['remove_stock'];
			}
			if(!empty($_POST['increase_amount'])){
				$_POST['newAmount'] = $row['amount'] + $_POST['increase_amount'];
			}
			$product->audit_trail($row['id'], $_POST);
			$product->update_product($row['id'],$_POST);
		} else {
			$product->audit_trail($row['id'], $_POST);
			$product->update($row['id'],$_POST);
		}
		

		redirect('admin&tab=products');
	}

	


}


require views_path('products/product-edit');

