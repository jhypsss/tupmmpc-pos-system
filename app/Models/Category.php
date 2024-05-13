<?php 


/**
 * Category class
 */
class Category extends Model
{
	
	protected $table = "categories";

	protected $allowed_columns = [
				'name',
				'description',
			];


 	public function validate($data, $id = null)
	{
		$errors = [];
			//check name
			if(empty($data['name']))
			{
				$errors['name'] = "Category name is required";
			}
			//check description
			if(empty($data['description']))
			{
				$errors['description'] = "Category description is required";
			}

		return $errors;
	}

}