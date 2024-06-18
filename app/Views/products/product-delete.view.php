<?php require views_path('partials/header');?>

	<div class="container-fluid border rounded p-4 m-2 col-lg-4 mx-auto">

		<?php if(!empty($row)):?>

		<form method="post" enctype="multipart/form-data">

			<h5 class="text-primary"><i class="fa fa-hamburger"></i> Delete Product</h5>

			<div class="alert alert-danger text-center">Are you sure you want to delete this product??!!</div>

			<div class="mb-3">
			  <label for="productControlInput1" class="form-label">Product Description</label>
			  <input disabled value="<?=set_value('description',$row['description'])?>" name="Description" type="text" class="form-control <?=!empty($errors['description']) ? 'border-danger':''?>" id="productControlInput1" placeholder="Product Description">
			  <?php if(!empty($errors['description'])):?>
					<small class="text-danger"><?=$errors['description']?></small>
				<?php endif;?>
			</div>
			
			<div class="mb-3">
			  <label for="barcodeControlInput1" class="form-label">Barcode <small class="text-muted">(optional)</small></label>
			  <input disabled value="<?=set_value('barcode',$row['barcode'])?>" name="barcode" type="text" class="form-control <?=!empty($errors['barcode']) ? 'border-danger':''?>" id="barcodeControlInput1" placeholder="Product barcode">
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

			
			<br>
			<img class="mx-auto d-block" src="<?=$row['image']?>" style="width:80%;">
			<br>
			<button class="btn btn-danger float-end">Delete</button>
			<a href="index.php?pg=admin&tab=products">
				<button type="button" class="btn btn-primary">Cancel</button>
			</a>
		</form>
		<?php else:?>
			That product was not found
			<br><br>
			<a href="index.php?pg=admin&tab=products">
				<button type="button" class="btn btn-primary">Back to Products</button>
			</a>

		<?php endif;?>

	</div>

<?php require views_path('partials/footer');?>