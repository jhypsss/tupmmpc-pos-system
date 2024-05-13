<?php 

require "../app/Core/config.php";
require "../app/Core/functions.php";
require "../app/Core/database.php";
require "../app/Core/model.php";

spl_autoload_register('my_function');

function my_function($classname)
{
	$filename = "../app/Models/".ucfirst($classname) . ".php";
	if(file_exists($filename)){
		require $filename;
	}
}