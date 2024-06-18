<?php require views_path('partials/header');?>

	<div class="container-fluid border rounded p-4 m-2 col-lg-4 mx-auto">

		<?php if(!empty($row) && !empty($item)):?>

		<form method="post" enctype="multipart/form-data">

			<h5 class="text-primary"><i class="fas fa-undo-alt"></i> Refunded Item</h5>

			<div class="alert alert-secondary text-center">What do you want to do with this item?</div>
			<img class="mx-auto d-block" src="<?=$row['image']?>" style="width:30%;">
			<div class="mb-3">
			  <label for="productControlInput1" class="form-label">Product Description</label>
			  <input disabled value="<?=set_value('description',$item[0]['description'])?>" name="description" type="text" class="form-control" id="productControlInput1" placeholder="Product Description">
			</div>
			
			<div class="mb-3">
			  <label for="barcodeControlInput1" class="form-label">Barcode <small class="text-muted">(optional)</small></label>
			  <input disabled value="<?=set_value('barcode',$item[0]['barcode'])?>" name="barcode" type="text" class="form-control" id="barcodeControlInput1" placeholder="Product barcode">
			</div>
            
            <div class="input-group mb-1">
              <span class="input-group-text">Refund Qty:</span>
			  <input disabled min="0" name="stock" value="<?=set_value('qty',$item[0]['qty'])?>" type="number" class="form-control" placeholder="Quantity" aria-label="Quantity">
			  <span class="input-group-text">Amount:</span>
			  <input disabled min="0" name="amount" value="<?=set_value('amount',$item[0]['amount'])?>" step="any" type="number" class="form-control" aria-label="Amount">
			</div>
            <div class="input-group mb-3">
              <span class="input-group-text">Total Refund Amount:</span>
			  <input disabled min="0" name="amount" value="<?=set_value('total',$item[0]['total'])?>" step="any" type="number" class="form-control" aria-label="Amount">
			</div>

            <div class="mb-3">
			  <label for="barcodeControlInput1" class="form-label">Status</label>
			  <input disabled value="<?=set_value('barcode',$item[0]['status'])?>" name="barcode" type="text" class="form-control" id="barcodeControlInput1">
			</div>
            <div class="mb-3">
			  <label for="barcodeControlInput1" class="form-label">Remarks</label>
			  <input disabled value="<?=set_value('barcode',$item[0]['remarks'])?>" name="barcode" type="text" class="form-control" id="barcodeControlInput1">
			</div>

            <div class="input mb-3">
                <label for="actionSelect" class="form-label">Action</label>
				<select name="action_taken" id="actionSelect" class="form-control">
					<option value="0">Select Action</option>
					<option value="For Re-stock">Return to Inventory (For Re-stock)</option>
					<option value="For Disposal">For Disposal</option>
				</select>
                <?php if(!empty($errors['action_taken'])):?>
					<small class="text-danger"><?=$errors['action_taken']?></small>
				<?php endif;?>
			</div>

			<button class="btn btn-danger float-end">Save</button>
			<a href="index.php?pg=admin&tab=refunded items">
				<button type="button" class="btn btn-primary">Cancel</button>
			</a>
		</form>
		<?php else:?>
			That Product was not found
			<br><br>
			<a href="index.php?pg=admin&tab=refunded items">
				<button type="button" class="btn btn-primary">Back to Refunded Items</button>
			</a>

		<?php endif;?>

	</div>

<?php require views_path('partials/footer');?>