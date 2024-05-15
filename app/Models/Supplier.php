<?php 


/**
 * Supplier class
 */
class Supplier extends Model
{
	
	protected $table = "suppliers";

	protected $allowed_columns = [
				'company_name',
				'company_address',
				'contact_person',
				'contact_number',
				'contact_email',
				'business_type',
			];


 	public function validate($data, $id = null)
	{
		$errors = [];
			//check name
			if(empty($data['company_name']))
			{
				$errors['company_name'] = "Company name is required";
			}
			//check description
			if(empty($data['company_address']))
			{
				$errors['company_address'] = "Company Address is required";
			}
			if(empty($data['contact_person']))
			{
				$errors['contact_person'] = "Company Address is required";
			}
			if(empty($data['contact_number']))
			{
				$errors['contact_number'] = "Contact Number is required";
			}
			if(empty($data['contact_email']))
			{
				$errors['contact_email'] = "Contact Email is required";
			}
			if(empty($data['business_type']))
			{
				$errors['business_type'] = "Business Type is required";
			}

		return $errors;
	}

}