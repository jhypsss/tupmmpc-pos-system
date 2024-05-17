<?php 

$errors = [];

if($_SERVER['REQUEST_METHOD'] == "POST")
{
	$user = new User();
 	if($row = $user->where(['email'=>$_POST['email']]))
 	{
  	 
 		if(password_verify($_POST['password'], $row[0]['password']))
 		{
 			authenticate($row[0]);

			if(Auth::access('Admin') || Auth::access('Supervisor')){
				redirect('admin');
			}else{
				redirect('home');
			}
 		}else
	 	{
	 		$errors['password'] = "Invalid Credentials";
	 	}
 	}else
 	{
 		$errors['email'] = $_POST['email']." does not exist.";
 	}


}

require views_path('auth/login');

