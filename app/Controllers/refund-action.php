<?php 

$errors = [];

$id = $_GET['id'] ?? null;
$product = new Product();

$row = $product->first(['id'=>$id]);

$db = new Database;
$item = $db->query("SELECT * FROM refunded_items WHERE product_id = $id");

if($_SERVER['REQUEST_METHOD'] == "POST" && $row)
{
	$timezone = 'Asia/Singapore';
	date_default_timezone_set($timezone);
	$_POST['date_modified'] = date("Y-m-d H:i:s");
	$_POST['source'] = "Refunded Items";
    $_POST['item_qty'] = $item[0]['qty'];

    $user_id = auth("id");
    $action = $_POST['action_taken'];

    $refund_qty = $item[0]['qty'];
    $category_id = $item[0]['category_id'];

    if($action == 0){
        $errors['action_taken'] = "Select an action to save"; 
    }

    if ($action == 'For Re-stock'){
        $_POST['action'] = "RESTOCK"; //for audit
        $db->query("UPDATE products SET stock=stock+$refund_qty, date_modified = NOW() WHERE id = $id"); //update item in products
        $db->query("INSERT INTO stock_inventory (product_id, category_id, stock_in, date_updated) VALUES ($id, $category_id, $refund_qty, NOW())");
        $db->query("UPDATE refunded_items SET action_taken = '$action', by_user_id = $user_id, date_completed = NOW() WHERE product_id=$id");
        
        $product->audit_trail($row['id'], $_POST);
        redirect('admin&tab=refunded items');
    } else if ($action == 'For Disposal'){
        $_POST['action'] = "FOR DISPOSAL"; //for audit
        $_POST['status'] = $item[0]['status'];
        $_POST['remarks'] = $item[0]['remarks'];

        $db->query("INSERT INTO stock_inventory (product_id, category_id, stock_out, date_updated) VALUES ($id, $category_id, $refund_qty, NOW())");
        $db->query("UPDATE refunded_items SET action_taken = '$action', by_user_id = $user_id, date_completed = NOW() WHERE product_id=$id");
        
        $product->audit_trail($row['id'], $_POST);
        redirect('admin&tab=refunded items');
    }
}

require views_path('admin/refund-action');