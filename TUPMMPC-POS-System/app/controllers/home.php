<?php 

defined("ABSPATH") ? "":die();

if(Auth::access('cashier')){
	require views_path('home');
}
else if (Auth::access('user')){
	Auth::setMessage("Please contact the administrator <br> to assess your account");
	require views_path('auth/denied');
}
else{
	redirect('login');
}


