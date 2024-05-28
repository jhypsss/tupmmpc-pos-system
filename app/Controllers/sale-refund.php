<?php 

$errors = [];

$id = $_GET['id'] ?? null;
$sale = new Sale();

$row = $sale->first(['id'=>$id]);

if($_SERVER['REQUEST_METHOD'] == "POST" && $row)
{
    $_POST['source'] = "Sales";
	$_POST['action'] = "REFUND";
    $errors = $sale->validate($_POST, $row['id']);
    //$_POST['tot_Refund_amount'] = $_POST['refund_qty'] * $row['amount'];
	
    if(empty($errors)){
        $sale->audit_trail($row['id'], $_POST);
        $sale->refund($row['id'], $row, $_POST);
        redirect('admin&tab=sales');
    }
 

}


require views_path('sales/sale-refund');

