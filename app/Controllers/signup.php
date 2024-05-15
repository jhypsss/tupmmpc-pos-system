<?php 

$errors = [];

if($_SERVER['REQUEST_METHOD'] == "POST")
{

	$user = new User();

	$_POST['role'] = "User";
	$_POST['date'] = date("Y-m-d H:i:s");
	$_POST['source'] = "Users";
	$_POST['action'] = "ADD";
	
	$errors = $user->validate($_POST);
	if(empty($errors)){
		
		$_POST['password'] = password_hash($_POST['password'], PASSWORD_DEFAULT);

		$user->audit_trail(null, $_POST);
		$user->insert($_POST);

		redirect('admin&tab=users');
	}
}
	
if(Auth::access('Admin')){
	require views_path('auth/signup');
}else{

	Auth::setMessage("Only admins can create users");
	require views_path('auth/denied');
}

