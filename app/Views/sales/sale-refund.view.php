<?php require views_path('partials/header');?>

	<div class="container-fluid border rounded p-4 m-2 col-lg-4 mx-auto">

		<?php if(!empty($row)):?>

		<form method="post" enctype="multipart/form-data">

			<h5 class="text-primary"><i class="fa fa-money-bill-wave"></i> Refund a Product</h5>
			
            <div class="mb-3">
			  <label for="saleControlInput1" class="form-label">Receipt No:</label>
			  <input disabled value="<?=set_value('receipt_no',$row['receipt_no'])?>" name="receipt_no" type="text" class="form-control" id="saleControlInput1">
			</div>

			<div class="mb-3">
			  <label for="barcodeControlInput1" class="form-label">Barcode</small></label>
			  <input disabled value="<?=set_value('barcode',$row['barcode'])?>" name="barcode" type="text" class="form-control" id="barcodeControlInput1">
			</div>

			<div class="mb-3">
			  <label for="saleControlInput1" class="form-label">Product Description</label>
			  <input disabled value="<?=set_value('description',$row['description'])?>" name="description" type="text" class="form-control" id="saleControlInput1">
			</div>
			
			<div class="input-group">
			  <span class="input-group-text">Sold (Qty):</span>
			  <input name="qty" value="<?=set_value('qty',$row['qty'])?>" type="number" class="form-control" id="soldqty" placeholder="Quantity" aria-label="Qty" autocomplete="off" disabled>
			  <span class="input-group-text">Price:</span>
			  <input name="amount" value="<?=set_value('amount',$row['amount'])?>" step="any" type="number" id="unitprice" class="form-control" placeholder="Amount" aria-label="Amount" autocomplete="off" disabled>
			</div>

			<div class="input-group mb-4">
			  <span class="input-group-text">Total Amount:</span>
			  <input name="total" value="<?=set_value('total',$row['total'])?>" step="any" type="number" class="form-control" placeholder="Total" aria-label="Total" autocomplete="off" disabled>
			</div>

			<?php if(!empty($errors['refund_qty'])):?>
				<small class="text-danger"><?=$errors['refund_qty']?></small>
			<?php endif;?>
			<div class="input-group mb-3">
			  <span class="input-group-text">Refund (Qty):</span>
			  <input name="refund_qty" type="number" class="form-control <?=!empty($errors['refund_qty']) ? 'border-danger':''?>" id="refund_qty" placeholder="Quantity" aria-label="Qty" autocomplete="off">
			  <span class="input-group-text">Amount:</span>
			  <input name="refund_amount" value="" step="any" type="number" class="form-control" id="refund_amount" placeholder="0.00" aria-label="Amount" autocomplete="off" disabled>
			</div>
			

			<div class="mb-3">
			  <label for="saleControlInput1" class="form-label">Status: </label>
			  <?php if(!empty($errors['status'])):?>
				<small class="text-danger"><?=$errors['status']?></small>
			  <?php endif;?>
			  <input name="status" type="text" class="form-control <?=!empty($errors['status']) ? 'border-danger':''?>" id="saleControlInput1" placeholder="Status" aria-label="Status" autocomplete="off">
			  
			</div>

			<div class="mb-3">
			  <label for="saleControlInput1" class="form-label">Remarks: </label>
			  <?php if(!empty($errors['remarks'])):?>
				<small class="text-danger"><?=$errors['remarks']?></small>
			  <?php endif;?>
			  <input name="remarks" type="text" class="form-control <?=!empty($errors['remarks']) ? 'border-danger':''?>" id="saleControlInput1" placeholder="Remarks" aria-label="Remarks" autocomplete="off">
			</div>
			
			<br>
			<button class="btn btn-danger float-end">Refund</button>
			<a href="index.php?pg=admin&tab=sales">
				<button type="button" class="btn btn-primary">Cancel</button>
			</a>
		</form>
		<?php else:?>
			That record was not found
			<br><br>
			<a href="index.php?pg=admin&tab=sales">
				<button type="button" class="btn btn-primary">Back to sales</button>
			</a>

		<?php endif;?>

	</div>
	<script>
        document.addEventListener('DOMContentLoaded', function() {
            const soldQtyInput = document.getElementById('soldqty');
			const unitPriceInput = document.getElementById('unitprice');
            const qtyInput = document.getElementById('refund_qty');
            const amountInput = document.getElementById('refund_amount');

            qtyInput.addEventListener('input', function() {
				const soldQty = parseFloat(soldQtyInput.value);
                let qty = parseFloat(qtyInput.value);
				const unitPrice = parseFloat(unitPriceInput.value);

				if (isNaN(qty) || qty < 0) {
                    qty = 0;
                } else if (qty > soldQty) {
                    qty = soldQty;
                }

                qtyInput.value = qty;
                if (!isNaN(qty)) {
                    const amount = qty * unitPrice;
                    amountInput.value = amount.toFixed(2); // Ensure the amount is formatted to 2 decimal places
                } else {
                    amountInput.value = '0.00';
                }
            });
        });
    </script>

<?php require views_path('partials/footer');?>