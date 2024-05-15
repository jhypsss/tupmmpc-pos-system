<?php

/**
 * model class
 */
class Model extends Database
{
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
		$clean_array = $this->get_allowed_columns($data, $this->table);
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
		$clean_array = $this->get_allowed_columns($data, $this->table);
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
	
	//delete query
	public function delete($id)
	{
		/*/ Old delete query
		$query = "DELETE FROM $this->table WHERE id = :id LIMIT 1";
		$clean_array['id'] = $id;
		*/
		//Delete Function
		$user_id = auth("id");
		$source = $_POST['source'];
		$clean_array['id'] = $id;
		
		$query = "UPDATE $this->table SET if_deleted = 1 WHERE id = :id";
		
		$db = new Database;
		$db->query($query, $clean_array);

		$query2 = "INSERT INTO deleted_items (deleted_id, from_table, user_id) VALUES (:deleted_id, :from_table, :user_id)";
		$params = array(
			'deleted_id' => $id,
			'from_table' => $source,
			'user_id' => $user_id,
		);
		$db2 = new Database;
		$db2->query($query2, $params);
		
	}
	

	public function where($data,$limit = 10,$offset = 0,$order = "desc",$order_column = "id")
	{

		$keys = array_keys($data);
		
		$query = "select * from $this->table where ";

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
	public function getAll($offset = 0,$order = "desc",$order_column = "id")
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
		$username = auth("id");
		$source = $data['source'];
		$action = $data['action']; 

		//actions
		if (strcmp($action, "ADD") == 0){
			if (strcmp($source, "Users") == 0){
				// Get the details
				$newUsername = isset($data['username']) ? $data['username'] : 'Unknown User';
				$userEmail = isset($data['email']) ? $data['email'] : 'Unknown Email';
				$userGender = isset($data['gender']) ? $data['gender'] : 'Unknown Gender';
				$userRole = isset($data['role']) ? $data['role'] : 'Unknown Role';

				$details = "NEW USER: $newUsername \nEmail: $userEmail \nGender: $userGender \nRole: $userRole";
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
				$productCategory = isset($data['category']) ? $data['category'] : 'Unknown Category';

				$details = "NEW ITEM: $productBarcode\nProduct: $productName \nQty: $productStock \nPrice: $productPrice \nCategory: $productCategory";
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
				$oldUsername = $row['username'];
				$oldEmail = $row['email'];
				$oldPassword = $row['password'];
				$oldGender = $row['gender'];
				$oldRole = $row['role'];
				$oldImage = $row['image'];

				// Get the new details
				$newUsername = isset($data['username']) ? $data['username'] : 'Unknown User';
				$userEmail = isset($data['email']) ? $data['email'] : 'Unknown Email';
				$userPassword = isset($data['password']) ? $data['password'] : 'Unknown Password';
				$userGender = isset($data['gender']) ? $data['gender'] : 'Unknown Gender';
				$userRole = isset($data['role']) ? $data['role'] : 'Unknown Role';
				//dd($userRole);
				$userImage = isset($data['image']) ? $data['image'] : 'Unknown Image';

				$details = "UPDATED USER: $newUsername";
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
						$details .= "\nUser Image: User Image Changed";
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
				$oldcategory = $row['category'];

				//Get the new details
				$productBarcode = isset($data['barcode']) ? $data['barcode'] : 'Unknown Barcode';
				$productName = isset($data['description']) ? $data['description'] : 'Unknown Product';
				$addStock = isset($data['addStock']) ? $data['addStock'] : 'Unknown Qty';
				$productStock = isset($data['stock']) ? $data['stock'] : 'Unknown Stock';
				$productPrice = isset($data['amount']) ? $data['amount'] : 'Unknown Price';
				$productImage = isset($data['image']) ? $data['image'] : 'Unknown Image';
				$productCategory = isset($data['category']) ? $data['category'] : 'Unknown Category';
				
				// Insert into audit trail
				//Compare changes in Details
				$details = "UPDATED ITEM: $productBarcode";
				if (strcmp($oldbarcode, $productBarcode) !== 0){
					$details .= "\nBarcode: $oldbarcode → $productBarcode";
				}
				if (strcmp($oldproductName, $productName) !== 0){
					$details .= "\nProduct Name: $oldproductName → $productName";
				}
				if (strcmp($oldstock, $productStock) !== 0){
					$details .= "\nCurrent Stock: $oldstock + $addStock = $productStock";
				}
				if (strcmp($oldprice, $productPrice) !== 0){
					$details .= "\nPrice: $oldprice → $productPrice";
				}
				if (strcmp($oldcategory, $productCategory) !== 0){
					$details .= "\nCategory: $oldcategory → $productCategory";
				}
				if (strcmp($productImage, "Unknown Image") != 0){
					if (strcmp($oldimage, $productImage) !== 0){
						$details .= "\nProduct Image: Modified";
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
				$deletedUser = $row['username'];
				$userEmail = $row['email'];
				$userGender = $row['gender'];
				$userRole = $row['role'];
				$details = "DELETED USER: $deletedUser \nEmail: $userEmail \nGender: $userGender \nRole: $userRole";
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
				$productCategory = $row['category'];

				$details = "DELETED ITEM: $productBarcode \nProduct Name: $productName \nQty: $productStock \nPrice: $productPrice\n Category: $productCategory";
			}
			else if (strcmp($source, "Suppliers") == 0){
				$supllier = new Supplier();
				$row = $supllier->first(['id'=>$id]);
				$companyName = $row['company_name'];
				$details = "DELETED SUPPLIER: $companyName";
			}
		}
		// Insert to Audit Trail
		$this->insert_Audit_trail($username, $source, $action, $details);
	}

	//insert audit
	public function insert_Audit_trail($username, $source, $action, $details)
	{
		$query = "INSERT INTO audit_trail (user_id, source, action, details) VALUES (:username, :source, :action, :details)";
		$params = array(
			'username' => $username,
			'source' => $source,
			'action' => $action,
			'details' => $details
		);

		$db = new Database;
		$db->query($query, $params);
	}


	

}


