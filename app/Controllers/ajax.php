<?php 

defined("ABSPATH") ? "":die();

//capture ajax data
$raw_data = file_get_contents("php://input");
if(!empty($raw_data))
{

	$OBJ = json_decode($raw_data,true);
	if(is_array($OBJ))
	{
		if($OBJ['data_type'] == "search")
		{

			$productClass = new Product();

			if(!empty($OBJ['text']))
			{
				//search
				$input = $OBJ['text'];
				if (preg_match('/^\d+$/', $input) || preg_match('/^\d{13}$/', $input)){
					$barcode = $OBJ['text'];
					$query = "SELECT * FROM products WHERE barcode = :barcode AND if_deleted = 0 order by views desc";
					$rows = $productClass->query($query,['barcode'=>$barcode]);
				} else {
					$text = "%".$OBJ['text']."%";
					$query = "SELECT * FROM products WHERE description like :find AND if_deleted = 0 order by views desc";
					$rows = $productClass->query($query,['find'=>$text]);
				}

				//$barcode = $OBJ['text'];
				//$text = "%".$OBJ['text']."%";
				//$query = "SELECT * FROM products WHERE (description like :find || barcode = :barcode) AND if_deleted = 0 order by views desc";
				//$rows = $productClass->query($query,['find'=>$text,'barcode'=>$barcode]);
			}else{
				//get all
				$query = "SELECT * FROM products WHERE if_deleted = 0 ORDER BY views desc";
				$rows = $productClass->query($query);
			}
			
			if($rows){
				foreach ($rows as $key => $row) {
					
					$rows[$key]['description'] = strtoupper($row['description']);
					$rows[$key]['image'] = crop($row['image']);
				}

				$info['data_type'] = "search";
				$info['data'] = $rows;
				
				echo json_encode($info);
			}

		}
		else
		if($OBJ['data_type'] == "checkout")
		{
			$timezone = 'Asia/Manila';
			date_default_timezone_set($timezone);

			$date = date('Y-m-d H:i:s');

			$data 		= $OBJ['text'];
			$receipt_no 	= generate_receipt_no();
			$user_id 	= auth("id");
			//$payment_method = $OBJ['payment_status'];
			//$payment_reference = $OBJ['payment_reference'];
			$db = new Database();

			//read from database
			foreach ($data as $row) {
				
				$arr = [];
				$arr['id'] = $row['id'];
				$query = "select * from products where id = :id limit 1";
				$check = $db->query($query,$arr);

				if(is_array($check))
				{
					$check = $check[0];

					//save to database
					$arr = [];
					$arr['product_id']  = $row['id'];
					$arr['barcode'] 	= $check['barcode'];
					$arr['description'] = $check['description'];
					$arr['category_id'] = $check['category_id'];
					$arr['amount'] 		= $check['amount'];
					$arr['qty'] 		= $row['qty'];
					$arr['total'] 		= $row['qty'] * $check['amount'];
					$arr['receipt_no'] 	= $receipt_no;
					$arr['date'] 		= $date;
					$arr['user_id'] 	= $user_id;
					//$arr['payment_method'] 	= $payment_method . ' '.$payment_reference ;

					//$query = "insert into sales (barcode,receipt_no,description,category_id,qty,amount,total,date,user_id,payment_method) values (:barcode,:receipt_no,:description,:category_id,:qty,:amount,:total,:date,:user_id,:payment_method)";
					$query = "INSERT into sales (product_id,barcode,receipt_no,description,category_id,qty,amount,total,date,user_id) 
									values (:product_id,:barcode,:receipt_no,:description,:category_id,:qty,:amount,:total,:date,:user_id)";
					$db->query($query,$arr);

					//add view count for this product
					$query = "UPDATE products set views = views + 1 where id = :id limit 1";
					$db->query($query,['id'=>$check['id']]);

					//subtract quantity for this product
					$query = "UPDATE products SET stock = stock - :qty WHERE id = :id LIMIT 1";
    				$db->query($query, ['id' => $check['id'], 'qty' => $row['qty']]);
				}

			}

			$info['data_type'] = "print_checkout";
			$info['receipt_no'] = $receipt_no;
			$info['date'] = $date;
			//$info['data'] = "items saved successfully!";
			
				
			echo json_encode($info);
		}

	}

}



