<?php 


function show($data)
{
	echo "<pre>";
	print_r($data);
	echo "</pre>";
}

function views_path($view)
{
	if(file_exists("../app/Views/$view.view.php")){
		return "../app/Views/$view.view.php";
	}else{
		echo "view '$view' not found";
	}
}

function esc($str)
{
	return htmlspecialchars($str);
}

function redirect($page)
{
	header("Location: index.php?pg=" .$page);
	die;
}

function set_value($key,$default = "")
{

	if(!empty($_POST[$key]))
	{
		return $_POST[$key];
	}

	return $default;
}

function authenticate($row)
{

	$_SESSION['USER'] = $row;
}

function auth($column)
{
	if(!empty($_SESSION['USER'][$column])){
		return $_SESSION['USER'][$column];
	}else{
		return "Unknown";
	}
}

function crop($filename,$size = 400,$type = 'product')
{

	$ext = strtolower(pathinfo($filename,PATHINFO_EXTENSION));
	$cropped_file = str_replace(".".$ext, "_cropped.".$ext, $filename);
	//$cropped_file = preg_replace("/\.$ext$/", "_cropped.".$ext, $filename);

	//if cropped file already exists
	if(file_exists($cropped_file))
	{
		return $cropped_file;
	}

	//if file to be cropped does not exist
	if(!file_exists($filename))
	{
		if($type == "Male"){
			return 'assets/images/user_male.jpg';
		}else
		if($type == "Female"){
			return 'assets/images/user_female.jpg';
		}else{
			return 'assets/images/no_image.jpg';
		}
	}

	
	//create image resource
	switch ($ext) {
		case 'jpg':
		case 'jpeg':
			$src_image = imagecreatefromjpeg($filename);
			break;
		
		case 'gif':
			$src_image = imagecreatefromgif($filename);
			break;
		
		case 'png':
			$src_image = imagecreatefrompng($filename);
			break;
		
		default:
			return $filename;
	}

	//set cropping params

	//assign values
	$dst_x = 0;
	$dst_y = 0;
	$dst_w = (int)$size;
	$dst_h = (int)$size;

	$original_width = imagesx($src_image);
	$original_height = imagesy($src_image);

	if($original_width < $original_height)
	{
		$src_x = 0;
		$src_y = ($original_height - $original_width) / 2;
		$src_w = $original_width;
		$src_h = $original_width;

	}else{

		$src_y = 0;
		$src_x = ($original_width - $original_height) / 2;
		$src_w = $original_height;
		$src_h = $original_height;
	}
 
	$dst_image = imagecreatetruecolor((int)$size, (int)$size);
	imagecopyresampled($dst_image, $src_image, $dst_x, $dst_y, $src_x, $src_y, $dst_w, $dst_h, $src_w, $src_h);

	//save final image
	switch ($ext) {
		case 'jpg':
		case 'jpeg':
			imagejpeg($dst_image,$cropped_file,90);
			break;
		
		case 'gif':
			imagegif($dst_image,$cropped_file);
			break;
		
		case 'png':
			imagepng($dst_image,$cropped_file);
			break;
		
		default:
			return $filename;
	}

	imagedestroy($dst_image);
	imagedestroy($src_image);

	return $cropped_file;
}
/*
function get_receipt_no()
{
	$num = 1;
	$db = new Database();
	$rows = $db->query("select receipt_no from sales order by id desc limit 1");

	if(is_array($rows))
	{
		$num = (int)$rows[0]['receipt_no'] + 1;
	}
	return $num;
}
*/
function generate_receipt_no(){
	$num = 1;
	$parts2 = '';
	$userid = auth("userid");
	$parts1 = explode('-', $userid);
	$last_userid = intval($parts1[2]);

	$db = new Database();
	$rows = $db->query("select receipt_no from sales order by id desc limit 1"); //Get the last receipt no.
	if(is_array($rows))
	{
		$parts2 = explode('-', $rows[0]['receipt_no']); //explode between -
		$last_digit = $parts2[1] + 1; //example 2165-101, [0]=2165, [1]=101;
		$new_receipt_no = $last_userid."-".$last_digit;
		return $new_receipt_no;
	}else{
		$new_receipt_no = $last_userid."-".$num;
		return $new_receipt_no;
	}
	
}

function get_date($date)
{
	return date("jS M, Y",strtotime($date));
}

function get_user_by_id($id)
{
	$user = new User();
	return $user->first(['id'=>$id]);
}

function get_details($id, $source){
	if ($source == "Users"){
		$users = new User();
		return $users->first(['id'=>$id]);
	}
	else if ($source == "Categories"){
		$categories = new Category();
		return $categories->first(['id'=>$id]);
	} 
	else if ($source == "Products"){
		$products = new Product();
		return $products->first(["id"=>$id]);
	}
	else if ($source == "Suppliers"){
		$supplier = new Supplier();
		return $supplier->first(["id"=>$id]);
	}
}

function generate_daily_data($records)
{
	if(!empty($records)){
		$arr = [];
		// Check if $records is an array
		if (!is_array($records)) {
			return $arr;
		}

		for ($i=0; $i < 24; $i++) { 
			
			if(!isset($arr[$i])){
			
				$arr[$i] = 0;
			}

			foreach ($records as $row) {
				
				$hour = date('H',strtotime($row['date']));
				if($hour == $i){

					$arr[$i] += $row['total'];
				}
			}
		}

		return $arr;
	}
}

function generate_monthly_data($records)
{
	if(!empty($records)){
		$arr = [];
		$total_days = cal_days_in_month(CAL_GREGORIAN, date('m'), date('Y'));

		for ($i=1; $i <= $total_days; $i++) { 
			
			if(!isset($arr[$i])){
			
				$arr[$i] = 0;
			}

			foreach ($records as $row) {
				
				$day = date('d',strtotime($row['date']));
				if($day == $i){

					$arr[$i] += $row['total'];
				}
			}
		}

		return $arr;
	}
}

function generate_thisyear_data($records)
{
	if(!empty($records)){
		$arr = [];
		$months = ['0','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];

		for ($i=1; $i <= 12; $i++) { 
			
			if(!isset($arr[$months[$i]])){
			
				$arr[$months[$i]] = 0;
			}

			foreach ($records as $row) {
				
				$month = date('m',strtotime($row['date']));
				if($month == $i){

					$arr[$months[$i]] += $row['total'];
				}
			}
		}

		return $arr;
	}
}

function generate_yearly_data($allrecords) {
	if(!empty($allrecords)){
		$arr = [];
		
		// Get the starting and recent years from the records
		$startingYear = date('Y');
		$recentYear = date('Y');
		
		foreach ($allrecords as $row) {
			$year = date('Y', strtotime($row['date']));
			
			// Update the starting and recent years if necessary
			if ($year < $startingYear) {
				$startingYear = $year;
			}
			if ($year > $recentYear) {
				$recentYear = $year;
			}
			
			if (!isset($arr[$year])) {
				$arr[$year] = 0;
			}
			
			$arr[$year] += $row['total'];
		}
		
		$result = [];
		
		// Generate data for each year from starting year to recent year
		for ($i = $startingYear; $i <= $recentYear; $i++) {
			$result[$i] = isset($arr[$i]) ? $arr[$i] : 0;
		}
		
		return $result;
	}
}

function get_CategoryName($id){
		
	$categoryClass = new Category();
	$categoryID = $id;
	$results = $categoryClass->query("SELECT name FROM categories WHERE id=$categoryID");

	if(!empty($results))
		return $results[0]['name'];
	else
		return 'Unknown Category';
}