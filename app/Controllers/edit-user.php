<?php 

$errors = [];
$user = new User();

$id = $_GET['id'] ?? null;
$row = $user->first(['id'=>$id]);

$allRoles = new Database();
$userRoles = $allRoles->query("SELECT * FROM roles");

if(!empty($_SERVER['HTTP_REFERER']) && !strstr($_SERVER['HTTP_REFERER'], "edit-user"))
{
	$_SESSION['referer'] = $_SERVER['HTTP_REFERER'];
}

if($_SERVER['REQUEST_METHOD'] == "POST")
{
	$_POST['source'] = "Users";
	$_POST['action'] = "UPDATE";

	//make sure only admins can make other admins
	if(isset($_POST['role']) && $_POST['role'] != $row['role'])
	{
		if(Auth::get('role') != "Admin")
		{
			$_POST['role'] = $row['role'];
		}
	}

	if(!empty($_FILES['image']['name']))
	{
		$_POST['image'] = $_FILES['image'];
	}

	$errors = $user->validate($_POST, $id);
	if(empty($errors)){
		
		$folder = "uploads/user/";
		if(!file_exists($folder))
		{
			mkdir($folder,0777,true);
		}

		if(!empty($_POST['image']))
		{

			$ext = strtolower(pathinfo($_POST['image']['name'],PATHINFO_EXTENSION));

			$product = new Product();
			$destination = $folder . $product->generate_filename($ext);
			move_uploaded_file($_POST['image']['tmp_name'], $destination);
			$_POST['image'] = $destination;

			//delete old image
			if(file_exists($row['image']))
			{
				unlink($row['image']);
			}
		
		}

		if(empty($_POST['password'])){
			unset($_POST['password']);
		}else{
			$_POST['password'] = password_hash($_POST['password'], PASSWORD_DEFAULT);
		}
		$user->audit_trail($id, $_POST);
		$user->update($id,$_POST);

		redirect("profile&id=$id");
	}


}
	
if(Auth::access('Admin') || ($row && $row['id'] == Auth::get('id'))){
	require views_path('auth/edit-user');
}else{

	Auth::setMessage("Only admins can create and modify users");
	require views_path('auth/denied');
}

