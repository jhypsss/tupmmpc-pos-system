<?php require views_path('partials/header');?>

	<div class="container-fluid border rounded p-4 m-2 col-lg-4 mx-auto">

		<?php if(!empty($row)):?>

		<form method="post" enctype="multipart/form-data">

			<h5 class="text-primary"><i class="fa fa-hamburger"></i> Edit Product</h5>
		
			<div class="mb-3">
			  <label for="formFile" class="form-label">Product Image</label>
			  <input name="image" class="form-control <?=!empty($errors['image']) ? 'border-danger':''?>" type="file" id="formFile">
			  <?php if(!empty($errors['image'])):?>
					<small class="text-danger"><?=$errors['image']?></small>
				<?php endif;?>
			</div>
			<img class="mx-auto d-block" src="<?=$row['image']?>" style="width:80%;">
			<br>
			<div class="mb-3">
			  <label for="productControlInput1" class="form-label">Product description</label>
			  <input value="<?=set_value('description',$row['description'])?>" name="description" type="text" class="form-control <?=!empty($errors['description']) ? 'border-danger':''?>" id="productControlInput1" placeholder="Product description">
			  <?php if(!empty($errors['description'])):?>
					<small class="text-danger"><?=$errors['description']?></small>
				<?php endif;?>
			</div>

			<div class="mb-3">
			<label for="Category" class="form-label">Category</label>
			<select name="category" class="form-select <?= !empty($errors['category']) ? 'border-danger' : '' ?>" id="Category">
				

				<?php if(strcmp($row['category'], "---") !== 0): ?>
					<option value="<?= esc($row['category']) ?>"><?= esc($row['category']) ?></option>
				<?php else: ?>
					<option value="---">Select a Category</option>
				<?php endif; ?>
				
				
				<?php 
				    $allCategories = new Database();
					$list_categories = $allCategories->query("SELECT * FROM categories ORDER BY name");
				?>
					<?php foreach ($list_categories as $list_category):?>
						<option value="<?=$list_category['name']?>"> <?=$list_category['name']?> </option>
					<?php endforeach;?>
			</select>
			<?php if (!empty($errors['category'])): ?>
				<small class="text-danger"><?= $errors['category'] ?></small>
			<?php endif; ?>
		</div>


			
			<div class="mb-3">
			  <label for="barcodeControlInput1" class="form-label">Barcode <small class="text-muted">(Optional)</small></label>
			  <input value="<?=set_value('barcode',$row['barcode'])?>" name="barcode" type="text" class="form-control <?=!empty($errors['barcode']) ? 'border-danger':''?>" id="barcodeControlInput1" placeholder="Product barcode">
			  <?php if(!empty($errors['barcode'])):?>
					<small class="text-danger"><?=$errors['barcode']?></small>
				<?php endif;?>
			</div>
			
			<label for="stockControlInput1" class="form-label"><small class="text-muted">Current Stock: <?=set_value('stock',$row['stock'])?></small></label>
			<div class="input-group mb-3">
			  <span class="input-group-text">Add Stock:</span>
			  <input name="addStock" value="" type="number" class="form-control <?=!empty($errors['stock']) ? 'border-danger':''?>" id="stockControlInput1" placeholder="Quantity" aria-label="Quantity">
			  <span class="input-group-text">Amount:</span>
			  <input name="amount" value="<?=set_value('amount',$row['amount'])?>" step="any" type="number" class="form-control <?=!empty($errors['amount']) ? 'border-danger':''?>" placeholder="Amount" aria-label="Amount">
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
		<?php else:?>
			That product was not found
			<br><br>
			<a href="index.php?pg=admin&tab=products">
				<button type="button" class="btn btn-primary">Back to products</button>
			</a>

		<?php endif;?>

	</div>

<?php require views_path('partials/footer');?>