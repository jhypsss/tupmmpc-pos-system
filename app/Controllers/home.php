<?php 

defined("ABSPATH") ? "":die();

if(Auth::access('Cashier')){
	require views_path('home');
}
else if (Auth::access('User')){
	Auth::setMessage("Please contact the administrator <br> to assess your account");
	require views_path('auth/denied');
}
else{
	redirect('login');
}


