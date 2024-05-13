<?php 


/**
 * Audit Trail class
 */
class Audit_trail extends Model
{
	
	protected $table = "audit_trail";

	protected $allowed_columns = [
				'date',
				'user_id',
				'source',
				'action',
			];
}