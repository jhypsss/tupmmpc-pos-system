<?php 

$errors = [];

if($_SERVER['REQUEST_METHOD'] == "POST")
{

	$supplier = new Supplier();

	$_POST['date'] = date("Y-m-d H:i:s");
	$_POST['user_id'] = auth("id");
	$_POST['source'] = "Suppliers";
	$_POST['action'] = "ADD";

	$errors = $supplier->validate($_POST);
	if(empty($errors)){
		
		$supplier->audit_trail(null, $_POST);
		$supplier->insert($_POST);

		redirect('admin&tab=suppliers');
	}


}

require views_path('supplier/supplier-new');

