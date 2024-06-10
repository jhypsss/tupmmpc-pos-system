<?php 

$errors = [];

if($_SERVER['REQUEST_METHOD'] == "POST")
{
	$user = new User();
 	if($row = $user->where(['userid'=>$_POST['user']]))
 	{
  	 
 		if(password_verify($_POST['password'], $row[0]['password']))
 		{
 			authenticate($row[0]);

			if(Auth::access('Admin') || Auth::access('Supervisor') || Auth::access('Manager')){
				redirect('admin');
			}else{
				redirect('home');
			}
 		}else
	 	{
	 		$errors['password'] = "Invalid Credentials";
	 	}
 	}
	else if($row = $user->where(['email'=>$_POST['user']]))
	{
	  
		if(password_verify($_POST['password'], $row[0]['password']))
		{
			authenticate($row[0]);

		   if(Auth::access('Admin') || Auth::access('Supervisor') || Auth::access('Manager')){
			   redirect('admin');
		   }else{
			   redirect('home');
		   }
		}else
		{
			$errors['password'] = "Invalid Credentials";
		}
	}
	
	
	
	else
 	{
 		$errors['user'] = $_POST['user']." does not exist.";
 	}


}

require views_path('auth/login');

