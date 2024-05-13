<?php 

$errors = [];

if($_SERVER['REQUEST_METHOD'] == "POST")
{

	$category = new Category();

	$_POST['date'] = date("Y-m-d H:i:s");
	$_POST['user_id'] = auth("id");
	$_POST['source'] = "Categories";
	$_POST['action'] = "ADD";

	$errors = $category->validate($_POST);
	if(empty($errors)){
		
		$category->audit_trail(null, $_POST);
		$category->insert($_POST);

		redirect('admin&tab=categories');
	}


}

require views_path('category/category-new');

