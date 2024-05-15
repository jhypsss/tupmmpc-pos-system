<?php 

$errors = [];

$id = $_GET['id'] ?? null;
$supplier = new Supplier();

$row = $supplier->first(['id'=>$id]);

if($_SERVER['REQUEST_METHOD'] == "POST" && $row)
{
	$_POST['source'] = "Suppliers";
	$_POST['action'] = "UPDATE";

	$errors = $supplier->validate($_POST,$row['id']);
	if(empty($errors)){
		
		$supplier->audit_trail($row['id'], $_POST);
		$supplier->update($row['id'],$_POST);

		redirect('admin&tab=suppliers');
	}


}

require views_path('supplier/supplier-edit');

