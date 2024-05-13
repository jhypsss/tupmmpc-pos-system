<?php 

$errors = [];

$id = $_GET['id'] ?? null;
$category = new Category();

$row = $category->first(['id'=>$id]);

if($_SERVER['REQUEST_METHOD'] == "POST" && $row)
{
	$_POST['source'] = "Categories";
	$_POST['action'] = "UPDATE";

	$errors = $category->validate($_POST,$row['id']);
	if(empty($errors)){
		
		$category->audit_trail($row['id'], $_POST);
		$category->update($row['id'],$_POST);

		redirect('admin&tab=categories');
	}


}

require views_path('category/category-edit');

