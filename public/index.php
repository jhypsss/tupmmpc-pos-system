<?php

session_start();

define("ABSPATH", __DIR__);

require "../app/Core/init.php";

$controller = $_GET['pg'] ?? "home";
$controller = strtolower($controller);


if(file_exists("../app/Controllers/".$controller . ".php"))
{
	require "../app/Controllers/".$controller . ".php";
}else{
	echo "

	<br>
		<center>
			<h1>Page Not Found</h1>
		</center>
	<br>
	
";
}
