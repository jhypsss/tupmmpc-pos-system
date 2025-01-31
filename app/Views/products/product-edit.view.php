<?php require views_path('partials/header');?>

	<div class="container-fluid border rounded p-4 m-2 col-lg-4 mx-auto">

		<?php if(!empty($row)):?>

		<form method="post" enctype="multipart/form-data">

			<h5 class="text-primary"><i class="fa fa-hamburger"></i> Update Product</h5>
		
			<div class="mb-3">
			  <label for="formFile" class="form-label">Product Image</label>
			  <input name="image" class="form-control <?=!empty($errors['image']) ? 'border-danger':''?>" type="file" id="formFile">
			  <?php if(!empty($errors['image'])):?>
					<small class="text-danger"><?=$errors['image']?></small>
				<?php endif;?>
			</div>
			<img class="mx-auto d-block" src="<?=$row['image']?>" style="width:40%;">
			<br>
			<div class="mb-3">
			  <label for="productControlInput1" class="form-label">Product Description</label>
			  <input value="<?=set_value('description',$row['description'])?>" name="description" type="text" class="form-control <?=!empty($errors['description']) ? 'border-danger':''?>" id="productControlInput1" placeholder="Product Description" autocomplete="off">
			  <?php if(!empty($errors['description'])):?>
					<small class="text-danger"><?=$errors['description']?></small>
				<?php endif;?>
			</div>

			<div class="mb-3">
				<label for="Category" class="form-label">Category</label>
				<select name="category_id" class="form-select <?= !empty($errors['category_id']) ? 'border-danger' : '' ?>" id="Category">
					<option value="0" disabled>Select Category</option>
					<?php foreach ($list_categories as $list_category):
							if($list_category['id'] == $row['category_id']): ?>
							<option value="<?=$list_category['id'] ?>" selected><?= $list_category['name'] ?></option>
						<?php else: ?>
							<option value="<?=$list_category['id']?>"> <?=$list_category['name']?> </option>
						<?php endif; ?>
					<?php endforeach;?>

				</select>
				<?php if (!empty($errors['category'])): ?>
					<small class="text-danger"><?= $errors['category'] ?></small>
				<?php endif; ?>
			</div>
			<div class="mb-3">
			  <label for="barcodeControlInput1" class="form-label">Barcode <small class="text-muted">(Optional)</small></label>
			  <input value="<?=set_value('barcode',$row['barcode'])?>" name="barcode" type="text" class="form-control <?=!empty($errors['barcode']) ? 'border-danger':''?>" id="barcodeControlInput1" placeholder="Product barcode" autocomplete="off">
			  <?php if(!empty($errors['barcode'])):?>
					<small class="text-danger"><?=$errors['barcode']?></small>
				<?php endif;?>
			</div>

			<div class="input-group mb-3">
			  <span class="input-group-text">Current Stock: </span>
			  <input disabled name="stock" value="<?=set_value('stock',$row['stock'])?>" type="number" class="form-control <?=!empty($errors['stock']) ? 'border-danger':''?>" id="stock" placeholder="Quantity" aria-label="Quantity" autocomplete="off">
			  <span class="input-group-text">Amount:</span>
			  <input disabled name="amount" value="<?=set_value('amount',$row['amount'])?>" step="any" type="number" class="form-control <?=!empty($errors['amount']) ? 'border-danger':''?>" placeholder="Amount" aria-label="Amount" autocomplete="off">
			</div>

			<div class="input-group mb-3">
				<select name="" id="actionSelect" class="form-select">
					<option value="">Select Action</option>
					<option value="add_stock">Add Stock</option>
					<option value="remove_stock">Remove Stock</option>
					<option value="increase_amount">Increase Amount</option>
				</select>
			</div>

			<div class="mb-3" id="add_stock">
				<div class="input-group mb-3">
					<span class="input-group-text">Add Stock: </span>
					<input disabled name="add_stock" value="" type="number" class="form-control" placeholder="Quantity" aria-label="Quantity" autocomplete="off" required>
				</div>
			</div>
			
			<div class="mb-3" id="remove_stock">
				<div class="input-group mb-2">
					<span class="input-group-text">Remove Stock: </span>
					<input disabled name="remove_stock" value="" type="number" class="form-control" placeholder="Quantity" aria-label="Quantity" autocomplete="off" required>
				</div>
				<input disabled required name="status" type="text" class="form-control mb-2" placeholder="Status" autocomplete="off">
				<input disabled required name="remarks" type="text" class="form-control mb-2" placeholder="Remarks" autocomplete="off">
			</div>

			<div class="mb-3" id="increase_amount">
				<div class="input-group mb-3" >
					<span class="input-group-text">Increase Amount: </span>
					<input disabled name="increase_amount" value="" type="number" class="form-control" placeholder="0.00" aria-label="Quantity" autocomplete="off" required>
				</div>
			</div>
				
			<button class="btn btn-danger float-end">Save</button>
			<a href="index.php?pg=admin&tab=products">
				<button type="button" class="btn btn-primary">Cancel</button>
			</a>
		</form>
		<?php else:?>
			That Product was not found
			<br><br>
			<a href="index.php?pg=admin&tab=products">
				<button type="button" class="btn btn-primary">Back to products</button>
			</a>

		<?php endif;?>

	</div>

<?php require views_path('partials/footer');?>

<script>
	// Hide all divs first
	document.getElementById('add_stock').style.display = 'none';
	document.getElementById('remove_stock').style.display = 'none';
	document.getElementById('increase_amount').style.display = 'none';

	document.getElementById('actionSelect').addEventListener('change', function() {
        var selectedAction = this.value;
        
        // Hide all divs first
		document.getElementById('add_stock').style.display = 'none';
        document.getElementById('remove_stock').style.display = 'none';
        document.getElementById('increase_amount').style.display = 'none';
        
        document.querySelectorAll('#add_stock input').forEach(input => input.disabled = true);
        document.querySelectorAll('#remove_stock input').forEach(input => input.disabled = true);
        document.querySelectorAll('#increase_amount input').forEach(input => input.disabled = true);
        
        // Show the selected div and enable its inputs, if any action is selected
        if (selectedAction) {
			var stock = "<?=esc($row['stock'])?>";
            var selectedDiv = document.getElementById(selectedAction);
            selectedDiv.style.display = 'block';
            selectedDiv.querySelectorAll('input').forEach(input => {
                input.disabled = false;

                input.addEventListener('input', function() {
                    if (this.name === 'remove_stock') {
                        if (parseInt(this.value) < 0) {
                            this.value = 0;
                        } else if (parseInt(this.value) > stock) {
                            this.value = stock;
                        }
                    } else {
                        if (parseInt(this.value) < 0) {
                            this.value = 0;
                        }
                    }
                });
            });
        }
    });
</script>
