<?php 

$errors = [];

$id = $_GET['id'] ?? null;
$category = new Category();

$row = $category->first(['id'=>$id]);

if($_SERVER['REQUEST_METHOD'] == "POST" && $row)
{
	$_POST['date'] = date("Y-m-d H:i:s");
	$_POST['source'] = "Categories";
	$_POST['action'] = "RESTORE";

    $category->audit_trail($row['id'], $_POST);
	$category->restore($row['id']);

	redirect('admin&tab=deleted items');
}


require views_path('category/category-restore');

