<?php require views_path('partials/header');?>

	<div class="container-fluid border rounded p-4 m-2 col-lg-4 mx-auto">

		<form method="post" enctype="multipart/form-data">

			<h5 class="text-primary"><i class="fa fa-hamburger"></i> Add Product</h5>			
			<div class="mb-3">
			  <label for="formFile" class="form-label">Product Image</label>
			  <input name="image" class="form-control <?=!empty($errors['image']) ? 'border-danger':''?>" type="file" id="formFile">
			  <?php if(!empty($errors['image'])):?>
					<small class="text-danger"><?=$errors['image']?></small>
				<?php endif;?>
			</div>
			<br>
			<div class="mb-3">
			  <label for="productControlInput1" class="form-label">Product Description</label>
			  <input name="description" value="<?php echo $_POST['description'] ?? ''; ?>" type="text" class="form-control <?=!empty($errors['description']) ? 'border-danger':''?>" id="productControlInput1" placeholder="Product Description" autocomplete="off">
			  <?php if(!empty($errors['description'])):?>
					<small class="text-danger"><?=$errors['description']?></small>
				<?php endif;?>
			</div>

			<div class="mb-3">
				<label for="category_id" class="form-label">Category</label>
				<select name="category_id" class="form-select <?= !empty($errors['category_id']) ? 'border-danger' : '' ?>" id="category_id" required>
					<option value="0">Select a Category</option>
					<?php foreach ($list_categories as $list_category):?>
						<option value="<?=$list_category['id']?>"> <?=$list_category['name']?> </option>
					<?php endforeach;?>

				</select>
				<?php if (!empty($errors['category_id'])): ?>
					<small class="text-danger"><?= $errors['category_id'] ?></small>
				<?php endif; ?>
			</div>

			
			<div class="mb-3">
			  <label for="barcodeControlInput1" class="form-label">Barcode <small class="text-muted">(Auto Generated Barcode)</small></label>
			  <input name="barcode" type="text" class="form-control <?=!empty($errors['barcode']) ? 'border-danger':''?>" id="barcodeControlInput1" placeholder="(Insert optional)" autocomplete="off">
			  <?php if(!empty($errors['barcode'])):?>
					<small class="text-danger"><?=$errors['barcode']?></small>
				<?php endif;?>
			</div>

			<div class="input-group mb-3">
			  <input hidden min="0" name="stock" value="0" type="number" class="form-control <?=!empty($errors['stock']) ? 'border-danger':''?>" placeholder="Quantity" aria-label="Quantity" autocomplete="off">
			  <span class="input-group-text">Amount:</span>
			  <input min="0" name="amount" value="<?php echo $_POST['amount'] ?? ''; ?>" step="any" type="number" class="form-control <?=!empty($errors['amount']) ? 'border-danger':''?>" placeholder="0.00" aria-label="Amount" autocomplete="off">
			</div>
				<?php if(!empty($errors['stock'])):?>
					<small class="text-danger"><?=$errors['stock']?></small>
				<?php endif;?>
				<?php if(!empty($errors['amount'])):?>
					<small class="text-danger"><?=$errors['amount']?></small>
				<?php endif;?>
			<br>
			<button class="btn btn-danger float-end">Save</button>
			<a href="index.php?pg=admin&tab=products">
				<button type="button" class="btn btn-primary">Cancel</button>
			</a>
		</form>
	</div>

<?php require views_path('partials/footer');?>