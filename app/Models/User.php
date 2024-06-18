<?php 


/**
 * users class
 */
class User extends Model
{
	
	protected $table = "users";
	protected $allowed_columns = [

				'userid',
				'username',
				'email',
				'password',
				'role',
				'gender',
				'image',
				'date',
				'void_code',
			];


 	public function validate($data, $id = null)
	{
		$usersdb = new Database();

		$errors = [];

			//check userid
			if(empty($data['userid']))
			{
				$errors['userid'] = "User ID is required";
			} else 
			if(!preg_match('/^TUPM-\d{2}-\d{4,5}$/', $data['userid']))
			{
				$errors['userid'] = "ID must be TUPM-XX-XXXX";
			} else {
				if(!empty($data['userid']) && !$id)
				{
					$input_userid = $data["userid"];
					$result = $usersdb->query("SELECT * FROM users WHERE userid='$input_userid'");
					if($result)
						$errors['userid'] = $input_userid." already exist!";
				}

				if(!empty($data['userid']) && !empty($id))
				{
					$input_userid = $data["userid"];
					$result = $usersdb->query("SELECT * FROM users WHERE userid='$input_userid'");
					if($result[0]['userid'] == $input_userid && $result[0]['id'] != $id)
						$errors['userid'] = $input_userid." already exist!";
				}
			}

			

			//check username
			if(empty($data['username']))
			{
				$errors['username'] = "Username is required";
			}else
			if(!preg_match('/^[a-zA-Z ]+$/', $data['username']))
			{
				$errors['username'] = "Only letters allowed in username";
			}

			//check email
			if(empty($data['email']))
			{
				$errors['email'] = "Email is required";
			}else
			if(!preg_match('/^[a-zA-Z0-9._%+-]+@tup\.edu\.ph$/', $data['email']))
			{
				$errors['email'] = "Email must be @tup.edu.ph";
			}

			if(!filter_var($data['email'],FILTER_VALIDATE_EMAIL))
			{
				$errors['email'] = "Email is not valid";
			} else {
				if(!empty($data['email']) && !$id)
				{
					$input = $data["email"];
					$result = $usersdb->query("SELECT * FROM users WHERE email='$input'");
					if($result)
						$errors['email'] = $input." already exist!";
				}
				if(!empty($data['email']) && !empty($id))
				{
					$input = $data["email"];
					$result = $usersdb->query("SELECT * FROM users WHERE email='$input'");
					if($result)
						$errors['email'] = $input." already exist!";
				}
			}

			//check password
			if(!$id){
				if(empty($data['password']))
				{
					$errors['password'] = "password is required";
				}else
				if($data['password'] !== $data['password_retype'])
				{
					$errors['password_retype'] = "Passwords do not match";
				}else
				if(strlen($data['password']) < 8)
				{
					$errors['password'] = "Password must be at least 8 characters long";
				}
			}else{

				if(!empty($data['password']))
				{
	 				if($data['password'] !== $data['password_retype'])
					{
						$errors['password_retype'] = "Passwords do not match";
					}else
					if(strlen($data['password']) < 8)
					{
						$errors['password'] = "Password must be at least 8 characters long";
					}
				}
			}

		return $errors;
	}



}