<?php 

$errors = [];

$id = $_GET['id'] ?? null;
$supplier = new Supplier();

$row = $supplier->first(['id'=>$id]);

if($_SERVER['REQUEST_METHOD'] == "POST" && $row)
{
	$_POST['date'] = date("Y-m-d H:i:s");
	$_POST['source'] = "Suppliers";
	$_POST['action'] = "DELETE";

	$supplier->audit_trail($row['id'], $_POST);
	$supplier->delete($row['id']);
  	
	redirect('admin&tab=suppliers');
}


require views_path('supplier/supplier-delete');

