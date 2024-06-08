<?php

/**
 * model class
 */
class Model extends Database
{

	protected $allowed_columns = [];
	protected $table = [];

	protected function get_allowed_columns($data)
	{
 
 		if(!empty($this->allowed_columns)){
 			
			foreach ($data as $key => $value) {
				// code...
				if(!in_array($key, $this->allowed_columns))
				{
					unset($data[$key]);
				}
			}
		}

		return $data;
 	}

	//insert query
	public function insert($data)
	{
		// Insert into db
		$clean_array = $this->get_allowed_columns($data);
		$keys = array_keys($clean_array);
		
		$query = "INSERT INTO $this->table ";
		$query .= "(".implode(",", $keys) .") VALUES ";
		$query .= "(:".implode(",:", $keys) .")";
	
		$db = new Database;
		$db->query($query, $clean_array);
	}
	
	//update query
	public function update($id, $data)
	{
		$clean_array = $this->get_allowed_columns($data);
		$keys = array_keys($clean_array);
		
		$query = "UPDATE $this->table SET ";
	
		foreach ($keys as $column) {
			$query .= $column . "=:".$column .",";
		}
	
		$query = trim($query, ",");
		$query .= " WHERE id = :id";
		$clean_array['id'] = $id;
		
		$db = new Database;
		$db->query($query, $clean_array);
	}

	//update product
	public function update_product($id, $data){
		$user_id = auth("id");
		$db = new Database;
		$catergory_id = $data['category_id'];
		
		
		$date = $data['date_modified'];
		if(!empty($data['add_stock'])){
			$newStock = $data['newStock'];
			$addStock = $data['add_stock'];
			$db->query("INSERT INTO stock_inventory (product_id, category_id, stock_in, date_updated) VALUES ($id, $catergory_id, $addStock, '$date')");
			$db->query("UPDATE products SET stock=$newStock, date_modified='$date' WHERE id=$id");
		}
		if(!empty($data['remove_stock'])){
		    $removeStock = $data['remove_stock'];
			$query = "INSERT INTO removed_stocks (product_id, removed_qty, status, remarks, user_id, date) VALUES (:product_id, :removed_qty, :status, :remarks, :user_id, :date)";
			$params = array(
				'product_id' => $id,
				'removed_qty'=> $data['remove_stock'],
				'status'=> $data['status'],
				'remarks'=> $data['remarks'],
				'user_id'=> $user_id,
				'date'=> $date,
			);
			$db->query($query, $params);

			$newStock = $data['newStock'];
			$db->query("INSERT INTO stock_inventory (product_id, category_id, stock_out, date_updated) VALUES ($id, $catergory_id, $removeStock, '$date')");
			$db->query("UPDATE products SET stock=$newStock, date_modified='$date' WHERE id=$id");
		}
		if(!empty($data['increase_amount'])){
			$newAmount = $data['newAmount'];
			$db->query("UPDATE products SET amount=$newAmount, date_modified='$date' WHERE id=$id");
		}
	}

	public function restore($id){
		$user_id = auth("id");
		$source = $_POST['source'];
		$clean_array['id'] = $id;
		$timezone = 'Asia/Singapore';
    	date_default_timezone_set($timezone);
    	$_POST['date_modified'] = date("Y-m-d H:i:s");
    	$date = date('Y-m-d H:i:s');
		
		$db = new Database;
		//Update deleted to false
		$query = "UPDATE $this->table SET if_deleted = 0 WHERE id = :id";
		$db = new Database;
		$db->query($query, $clean_array);

		//record it in restored_items table
		$query2 = "INSERT INTO restored_items (restored_id, from_table, user_id, date_restored) VALUES (:deleted_id, :from_table, :user_id, :date)";
		$params = array(
			'deleted_id' => $id,
			'from_table' => $source,
			'user_id' => $user_id,
			'date' => $date
		);
		$db->query($query2, $params);

		//remove it in deleted_items table
		//$db->query("DELETE FROM deleted_items WHERE deleted_id = $id");
		$db->query("UPDATE deleted_items SET if_restored = 1 WHERE deleted_id = $id");
	}

	public function refund($id, $row, $data){
		$timezone = 'Asia/Singapore';
		date_default_timezone_set($timezone);
		$date = date("Y-m-d H:i:s");
		$user_id = auth("id");
		$saleqty = $row['qty']; //item sold qty
		$saleamount = $row['amount']; //price per item
		$refundqty = $data['refund_qty'];
		$total_refundedAmount = $refundqty * $saleamount;

		$db = new Database;
		if ($saleqty >= $refundqty){
			if($saleqty == $refundqty){ //if all item are refund, remove from sale
				$db->query("DELETE FROM sales WHERE id = $id");
			} else {
				$newQty = $saleqty - $refundqty;
				$newTotal = $newQty * $saleamount;
				$db->query("UPDATE sales SET qty='$newQty', total='$newTotal' WHERE id = $id");
			}
			$query2 = "INSERT INTO refunded_items (product_id,barcode,receipt_no,description,category_id,qty,amount,total,user_id,status,remarks,date) 
							VALUES (:product_id,:barcode,:receipt_no,:description,:category_id,:qty,:amount,:total,:user_id,:status,:remarks,:date)";
				$params = array(
					'product_id' => $row['product_id'],
					'barcode' => $row['barcode'],
					'receipt_no' => $row['receipt_no'],
					'description'=> $row['description'],
					'category_id'=> $row['category_id'],
					'qty'=> $refundqty,
					'amount'=> $row['amount'],
					'total'=> $total_refundedAmount,
					'user_id'=> $user_id,
					'status'	=> $data['status'],
					'remarks'=> $data['remarks'],
					'date'=> $date,
				);
			$db->query($query2, $params);
		}
	}
	
	//delete query
	public function delete_item($id)
	{
		/*/ Old delete query
		$query = "DELETE FROM $this->table WHERE id = :id LIMIT 1";
		$clean_array['id'] = $id;
		*/
		//Delete Function
		$timezone = 'Asia/Singapore';
		date_default_timezone_set($timezone);
		$_POST['date_modified'] = date("Y-m-d H:i:s");
		$date = date('Y-m-d H:i:s');
		$user_id = auth("id");
		$source = $_POST['source'];
		$clean_array['id'] = $id;
		
		$db = new Database;
		//Soft Delete
		$query = "UPDATE $this->table SET if_deleted = 1 WHERE id = :id";


		$db->query($query, $clean_array);
		//Record it in database
		$query2 = "INSERT INTO deleted_items (deleted_id, from_table, user_id, date_deleted) VALUES (:deleted_id, :from_table, :user_id, :date)";
		$params = array(
			'deleted_id' => $id,
			'from_table' => $source,
			'user_id' => $user_id,
			'date'=> $date,
		);
		$db->query($query2, $params);
		
	}
	

	public function where($data,$limit = 10,$offset = 0,$order = "desc",$order_column = "id")
	{

		$keys = array_keys($data);
		
		$query = "select * from $this->table where if_deleted=0 AND ";

		foreach ($keys as $key) {
			// code...
			$query .= "$key = :$key && ";
		}

		$query = trim($query,"&& ");
		$query .= " order by $order_column $order limit $limit offset $offset";

		$db = new Database;
		return $db->query($query,$data);	

	}

	//public function getAll($limit = 10,$offset = 0,$order = "desc",$order_column = "id")
	public function getAll($order = "desc",$order_column)
	{
		//$query = "select * from $this->table order by $order_column $order limit $limit offset $offset";
		$query = "select * from $this->table where if_deleted = 0 order by $order_column $order";
		$db = new Database;
		return $db->query($query);	
	}

	public function first($data)
	{

		$keys = array_keys($data);
		
		$query = "select * from $this->table where ";

		foreach ($keys as $key) {
			// code...
			$query .= "$key = :$key && ";
		}

		$query = trim($query,"&& ");

		$db = new Database;
		if($res = $db->query($query,$data))
		{
			return $res[0];
		}

		return false;	

	}

	//audit trail queries
	public function audit_trail($id, $data){
		//initialization
		$timezone = 'Asia/Singapore';
		date_default_timezone_set($timezone);

		$date = date('Y-m-d H:i:s');
		$username = auth("id");
		$source = $data['source'];
		$action = $data['action']; 

		//actions
		if (strcmp($action, "ADD") == 0){
			if (strcmp($source, "Users") == 0){
				// Get the details
				$newUserID = isset($data['userid']) ? $data['userid'] : 'Unknown User ID';
				$newUsername = isset($data['username']) ? $data['username'] : 'Unknown Username';
				$userEmail = isset($data['email']) ? $data['email'] : 'Unknown Email';
				$userGender = isset($data['gender']) ? $data['gender'] : 'Unknown Gender';
				$userRole = isset($data['role']) ? $data['role'] : 'Unknown Role';

				$details = "NEW USER: $newUserID \nName: $newUsername \nEmail: $userEmail \nGender: $userGender \nRole: $userRole";
			}
			else if (strcmp($source, "Categories") == 0){
				// Get the details
				$categoryName = isset($data['name']) ? $data['name'] : 'Unknown Name';
				$categoryDescription = isset($data['description']) ? $data['description'] : 'Unknown Description';

				$details = "NEW CATEGORY: $categoryName \nDescription: $categoryDescription";
			}
			else if(strcmp($source, "Products") == 0){
				// Get the details
				$productBarcode = isset($data['barcode']) ? $data['barcode'] : 'Unknown Barcode';
				$productName = isset($data['description']) ? $data['description'] : 'Unknown Product';
				$productStock = isset($data['stock']) ? $data['stock'] : 'Unknown Stock';
				$productPrice = isset($data['amount']) ? $data['amount'] : 'Unknown Price';
				$productCategory = isset($data['category_id']) ? $data['category_id'] : 'Unknown Category';
				$productCategoryName = get_CategoryName($productCategory);

				$details = "NEW ITEM: $productBarcode\nProduct: $productName \nQty: $productStock \nPrice: $productPrice \nCategory: $productCategoryName";
			}
			else if(strcmp($source, "Suppliers") == 0){
				// Get the details
				$companyName = isset($data['company_name']) ? $data['company_name'] : 'Unknown Company Name';
				$companyAddress = isset($data['company_address']) ? $data['company_address'] : 'Unknown Company Address';
				
				$details = "NEW SUPPLIER: $companyName \nCompany Address: $companyAddress";
			}
		}

		else if (strcmp($action, "UPDATE") == 0){
			if (strcmp($source, "Users") == 0){
				$user = new User();
				$row = $user->first(['id'=>$id]);
				// Get the Old Details
				$oldUserID = $row['userid'];
				$oldUsername = $row['username'];
				$oldEmail = $row['email'];
				$oldPassword = $row['password'];
				$oldGender = $row['gender'];
				$oldRole = $row['role'];
				$oldImage = $row['image'];

				// Get the new details
				$newUserID = isset($data['userid']) ? $data['userid'] : 'Unknown User ID';
				$newUsername = isset($data['username']) ? $data['username'] : 'Unknown User';
				$userEmail = isset($data['email']) ? $data['email'] : 'Unknown Email';
				$userPassword = isset($data['password']) ? $data['password'] : $oldPassword;
				$userGender = isset($data['gender']) ? $data['gender'] : 'Unknown Gender';
				$userRole = isset($data['role']) ? $data['role'] : 'Unknown Role';
				$userImage = isset($data['image']) ? $data['image'] : 'Unknown Image';

				$details = "UPDATED USER: $newUserID";
				if (strcmp($oldUserID, $newUserID) !== 0){
					$details .= "\nUsername: $oldUserID → $newUserID";
				}
				if (strcmp($oldUsername, $newUsername) !== 0){
					$details .= "\nUsername: $oldUsername → $newUsername";
				}
				if (strcmp($oldEmail, $userEmail) !== 0){
					$details .= "\nEmail: $oldEmail → $userEmail";
				}
				if (strcmp($userPassword, "Unknown Password") !== 0){
					if (strcmp($oldPassword, $userPassword) !== 0){
						$details .= "\nPassword: Modified";
					}
				}
				if (strcmp($oldGender, $userGender) !== 0){
					$details .= "\nGender: $oldGender → $userGender";
				}
				if (strcmp($oldRole, $userRole) !== 0){
					$details .= "\nRole: $oldRole → $userRole";
				}
				if (strcmp($userImage, "Unknown Image") !== 0){
					if (strcmp($oldImage, $userImage) !== 0){
						$details .= "\nUser Image: User Image Updated";
					}
				}
			}
			else if (strcmp($source, "Categories") == 0){
				$category = new Category();
				$row = $category->first(['id'=>$id]);

				// Get the old details
				$oldname = $row['name'];
				$olddescription = $row['description'];

				// Get the new details
				$categoryName = isset($data['name']) ? $data['name'] : 'Unknown Name';
				$categoryDescription = isset($data['description']) ? $data['description'] : 'Unknown Description';

				// Insert into audit trail
				// Compare changes in Details
				$details = "UPDATED CATEGORY: $categoryName";
				if (strcmp($oldname, $categoryName) !== 0){
					$details .= "\nCategory Name: $oldname → $categoryName";
				}
				if (strcmp($olddescription, $categoryDescription) !== 0){
					$details .= "\nDescription: $olddescription → $categoryDescription";
				}
			}

			else if(strcmp($source, "Products") == 0){
				//For Audit Trail
				$product = new Product();
				$row = $product->first(['id'=>$id]);

				// Get the old details
				$oldbarcode = $row['barcode'];
				$oldproductName = $row['description'];
				$oldstock = $row['stock'];
				$oldprice = $row['amount'];
				$oldimage = $row['image'];
				$oldcategory = $row['category_id'];
				$oldcategoryName = get_CategoryName($oldcategory);

				//Get the new details
				$productBarcode = isset($data['barcode']) ? $data['barcode'] : 'Unknown Barcode';
				$productName = isset($data['description']) ? $data['description'] : 'Unknown Product';

				$add_stock = isset($data['add_stock']) ? $data['add_stock'] : 'Unknown Qty';
				$remove_stock = isset($data['remove_stock']) ? $data['remove_stock'] : 'Unknown Qty';
				$newStock = isset($data['newStock']) ? $data['newStock'] : null;
				$increase_amount = isset($data['increase_amount']) ? $data['increase_amount'] : 'Unknown Amount';
				$newAmount = isset($data['newAmount']) ? $data['newAmount'] : null;
				
				$productStock = isset($data['stock']) ? $data['stock'] : 'Unknown Stock';
				$productPrice = isset($data['amount']) ? $data['amount'] : 'Unknown Price';
				$productImage = isset($data['image']) ? $data['image'] : 'Unknown Image';
				$productCategory = isset($data['category_id']) ? $data['category_id'] : 'Unknown Category';
				$productCategoryName = get_CategoryName($productCategory);
				
				// Insert into audit trail
				//Compare changes in Details
				$details = "UPDATED ITEM: $productBarcode";
				if (strcmp($oldbarcode, $productBarcode) !== 0){
					$details .= "\nBarcode: $oldbarcode → $productBarcode";
				}
				if (strcmp($oldproductName, $productName) !== 0){
					$details .= "\nProduct Name: $oldproductName → $productName";
				}
				if ($newStock != null){
					if($oldstock < $newStock) {
						$details .= "\nCurrent Stock Increased: $oldstock → $newStock(+$add_stock)";
					} else if ($oldstock > $newStock) {
						$details .= "\nCurrent Stock Decreased: $oldstock → $newStock(-$remove_stock)";
					}
				}
				if ($increase_amount != null){
					if($oldprice < $newAmount) {
						$details .= "\nPrice Increased: $oldprice → $newAmount(+$increase_amount)";
					}
				}
				if (strcmp($oldcategoryName, $productCategoryName) !== 0){
					$details .= "\nCategory: $oldcategoryName → $productCategoryName";
				}
				if (strcmp($productImage, "Unknown Image") != 0){
					if (strcmp($oldimage, $productImage) !== 0){
						$details .= "\nProduct Image: Product Image Updated";
					}
				}
			}

			else if(strcmp($source, "Suppliers") == 0){
				//For Audit Trail
				$supplier = new Supplier();
				$row = $supplier->first(['id'=>$id]);

				// Get the old details
				$oldCompany = $row['company_name'];
				$oldAddress = $row['company_address'];
				$oldContactPerson = $row['contact_person'];
				$oldContactNumber = $row['contact_number'];
				$oldContactEmail = $row['contact_email'];
				$oldBusinessType = $row['business_type'];

				//Get the new details
				$supplierCompany = isset($data['company_name']) ? $data['company_name'] : 'Unknown Company Name';
				$supplierAddress = isset($data['company_address']) ? $data['company_address'] : 'Unknown Company Address';
				$supplierContactPerson = isset($data['contact_person']) ? $data['contact_person'] : 'Unknown Contact Person';
				$supplierContactNumber = isset($data['contact_number']) ? $data['contact_number'] : 'Unknown Contact Number';
				$supplierContactEmail = isset($data['contact_email']) ? $data['contact_email'] : 'Unknown Contact Email';
				$supplierBusinessType = isset($data['business_type']) ? $data['business_type'] : 'Unknown Business Type';
				
				// Insert into audit trail
				//Compare changes in Details
				$details = "UPDATED SUPPLIER: $supplierCompany";
				if (strcmp($oldCompany, $supplierCompany) !== 0){
					$details .= "\nCompany Name: $oldCompany → $supplierCompany";
				}
				if (strcmp($oldAddress, $supplierAddress) !== 0){
					$details .= "\nCompany Address: $oldAddress → $supplierAddress";
				}
				if (strcmp($oldContactPerson, $supplierContactPerson) !== 0){
					$details .= "\nContact Person: $oldContactPerson → $supplierContactPerson";
				}
				if (strcmp($oldContactNumber, $supplierContactNumber) !== 0){
					$details .= "\nContact Number: $oldContactNumber → $supplierContactNumber";
				}
				if (strcmp($oldContactEmail, $supplierContactEmail) !== 0){
					$details .= "\nContact Email: $oldContactEmail → $supplierContactEmail";
				}
				if (strcmp($oldBusinessType, $supplierBusinessType) !== 0){
					$details .= "\nBusiness Type: $oldBusinessType → $supplierBusinessType";
				}
			}
		}

		else if(strcmp($action, "DELETE") == 0){
			if (strcmp($source, "Users") == 0){
				$user = new User();
				$row = $user->first(['id'=>$id]);
				$deletedUserID = $row['userid'];
				$deletedUser = $row['username'];
				$userEmail = $row['email'];
				$userGender = $row['gender'];
				$userRole = $row['role'];
				$details = "DELETED USER: $deletedUserID\n Name: $deletedUser \nEmail: $userEmail \nGender: $userGender \nRole: $userRole";
			}
			else if (strcmp($source, "Categories") == 0){
				$category = new Category();
				$row = $category->first(['id'=>$id]);
				$categoryName = $row['name'];
				$details = "DELETED CATEGORY: $categoryName";
			}
			else if (strcmp($source, "Products") == 0){
				$product = new Product();
				$row = $product->first(['id'=>$id]);
				$productBarcode = $row['barcode'];
				$productName = $row['description'];
				$productStock = $row['stock'];
				$productPrice = $row['amount'];
				$productCategory = $row['category_id'];
				$productCategoryName = get_CategoryName($productCategory);

				$details = "DELETED ITEM: $productBarcode \nProduct Name: $productName \nQty: $productStock \nPrice: $productPrice\n Category: $productCategoryName";
			}
			else if (strcmp($source, "Suppliers") == 0){
				$supplier = new Supplier();
				$row = $supplier->first(['id'=>$id]);
				$companyName = $row['company_name'];
				$details = "DELETED SUPPLIER: $companyName";
			}
		}
		else if(strcmp($action, "RESTORE") == 0){
			if (strcmp($source, "Users") == 0){
				$user = new User();
				$row = $user->first(['id'=>$id]);
				$restoreUserID = $row['userid'];
				$restoreUsername = $row['username'];
				$userEmail = $row['email'];
				$userGender = $row['gender'];
				$userRole = $row['role'];
				$details = "RESTORED USER: $restoreUserID \nName: $restoreUsername \nEmail: $userEmail \nGender: $userGender \nRole: $userRole";
			}
			else if (strcmp($source, "Categories") == 0){
				$category = new Category();
				$row = $category->first(['id'=>$id]);
				$categoryName = $row['name'];
				$details = "RESTORED CATEGORY: $categoryName";
			}
			else if (strcmp($source, "Products") == 0){
				$product = new Product();
				$row = $product->first(['id'=>$id]);
				$productBarcode = $row['barcode'];
				$productName = $row['description'];
				$productStock = $row['stock'];
				$productPrice = $row['amount'];
				$productCategory = $row['category_id'];
				$productCategoryName = get_CategoryName($productCategory);

				$details = "RESTORED ITEM: $productBarcode \nProduct Name: $productName \nQty: $productStock \nPrice: $productPrice\n Category: $productCategoryName";
			}
			else if (strcmp($source, "Suppliers") == 0){
				$supplier = new Supplier();
				$row = $supplier->first(['id'=>$id]);
				$companyName = $row['company_name'];
				$details = "RESTORED SUPPLIER: $companyName";
			}
		} else if(strcmp($action, "REFUND") == 0){
			if (strcmp($source, "Sales") == 0){
				$saleClass = new Sale();
				$sale_row = $saleClass->first(["id"=>$id]);
				
				$saleReceipt = $sale_row["receipt_no"];
				$saleBarcode = $sale_row["barcode"];
				$saleProductName = $sale_row["description"];
				$product_price = $sale_row["amount"];
				$product_sold = $sale_row["qty"];
				$sale_total = $sale_row["total"];
				$refund_qty = $data["refund_qty"];
				$total_amount = $refund_qty * $product_price;
				$status = $data["status"];
				$remarks = $data["remarks"];

				$details = "REFUNDED ITEM: $saleBarcode\nReceipt No: $saleReceipt\nProduct Name: $saleProductName\nProduct Price: $product_price\nProduct Sold: $product_sold (₱$sale_total)\nRefund Qty: $refund_qty\nTotal Amount Refund: ₱$total_amount\nStatus: $status\nRemarks: $remarks";
			}
		}
		// Insert to Audit Trail
		$this->insert_Audit_trail($date, $username, $source, $action, $details);
	}
	
	//insert audit
	public function insert_Audit_trail($date, $username, $source, $action, $details)
	{
		$query = "INSERT INTO audit_trail (user_id, source, action, details, date) VALUES (:username, :source, :action, :details, :date)";
		$params = array(
			'username' => $username,
			'source' => $source,
			'action' => $action,
			'details' => $details,
			'date' => $date,
		);

		$db = new Database;
		$db->query($query, $params);
	}


	

}


