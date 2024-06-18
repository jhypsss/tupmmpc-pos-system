<?php


/**
 * authentication class
 */
class Auth
{
	
	public static function get($column)
	{
		if(!empty($_SESSION['USER'][$column])){
			return $_SESSION['USER'][$column];
		}

		return "Unknown";
	}

	public static function logged_in()
	{

		if(!empty($_SESSION['USER'])){

			$db = new Database();
			if($db->query("select * from users where email = :email limit 1",['email'=>$_SESSION['USER']['email']]))
			{
				if(!isset($_SESSION['login_success'])){
					echo "<script>alert('Login successful!');</script>";
					$_SESSION['login_success'] = true; // Set the session variable
				}
				return true;
			}
		}

		return false;
	}

	public static function access($role)
	{
		$access['Admin'] 		= ['Admin'];
		$access['Manager'] 		= ['Admin','Manager'];
		$access['Supervisor'] 	= ['Admin','Manager','Supervisor'];
		$access['Cashier'] 		= ['Admin','Supervisor','Manager','Cashier'];
		$access['User'] 		= ['Admin','Supervisor','Manager','Cashier','User'];

		$myrole = self::get('role');
		if(in_array($myrole, $access[$role]))
		{
			return true;
		}

		return false;
	}

	public static function setMessage($message)
	{
		$_SESSION['MESSAGE'] = $message;
	}

	public static function getMessage()
	{
		if(!empty($_SESSION['MESSAGE'])){

			$message = $_SESSION['MESSAGE'];
			unset($_SESSION['MESSAGE']);
			return $message;
		}
	}

	

}
