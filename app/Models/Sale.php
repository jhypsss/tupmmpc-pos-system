<?php 


/**
 * sales class
 */
class Sale extends Model
{
	
	protected $table = "sales";

	protected $allowed_columns = [
				'product_id',
				'barcode',
				'receipt_no',
				'user_id',
				'description',
				'category_id',
				'qty',
				'amount',
				'total',
				'date',
				'refund_qty',
				'status',
				'remarks'
			];


 	public function validate($data, $id = null)
	{
		$errors = [];
			//check refund_qty
			if(empty($data['refund_qty']))
			{
				$errors['refund_qty'] = "Refund (Qty) is required";
			}else
			if(!preg_match('/^[0-9]+$/', $data['refund_qty']))
			{
				$errors['refund_qty'] = "Refund (Qty) must be a number";
			}
			//check status and remarks
			if(empty($data['status']))
			{
				$errors['status'] = "Sale status is required";
			}else
			if(!preg_match('/[a-zA-Z0-9 _\-\&\(\)]+/', $data['status']))
			{
				$errors['status'] = "Only letters allowed in status";
			}
			if(empty($data['remarks']))
			{
				$errors['remarks'] = "Sale remarks is required";
			}else
			if(!preg_match('/[a-zA-Z0-9 _\-\&\(\)]+/', $data['remarks']))
			{
				$errors['remarks'] = "Only letters allowed in remarks";
			}
			
		return $errors;
	}
 

}