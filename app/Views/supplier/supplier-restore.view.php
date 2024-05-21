<?php require views_path('partials/header');?>

	<div class="container-fluid border rounded p-4 m-2 col-lg-4 mx-auto">

		<?php if(!empty($row)):?>

		<form method="post" enctype="multipart/form-data">

			<h5 class="text-primary"><i class="fa fa-truck"></i> Restore Supplier</h5>

			<div class="alert alert-success text-center">Are you sure you want to restore this Supplier?</div>

			<div class="mb-3">
			  <label for="supplierControlInput1" class="form-label">Company Name</label>
			  <input disabled value="<?=set_value('company_name',$row['company_name'])?>" name="company_name" type="text" class="form-control <?=!empty($errors['company_name']) ? 'border-danger':''?>" id="supplierControlInput1" placeholder="Company Name">
			  <?php if(!empty($errors['company_name'])):?>
					<small class="text-danger"><?=$errors['company_name']?></small>
				<?php endif;?>
			</div>

			<div class="mb-3">
			  <label for="supplierControlInput2" class="form-label">Company Address</label>
			  <input disabled value="<?=set_value('company_address',$row['company_address'])?>" name="company_address" type="text" class="form-control <?=!empty($errors['company_address']) ? 'border-danger':''?>" id="supplierControlInput2" placeholder="Company Address">
			  <?php if(!empty($errors['company_address'])):?>
					<small class="text-danger"><?=$errors['address']?></small>
				<?php endif;?>
			</div>

            <div class="mb-3">
			  <label for="supplierControlInput3" class="form-label">Contact Person</label>
			  <input disabled value="<?=set_value('contact_person',$row['contact_person'])?>" name="contact_person" type="text" class="form-control <?=!empty($errors['contact_person']) ? 'border-danger':''?>" id="supplierControlInput3" placeholder="Contact Person">
			  <?php if(!empty($errors['contact_person'])):?>
					<small class="text-danger"><?=$errors['contact_person']?></small>
				<?php endif;?>
			</div>

            <div class="mb-3">
			  <label for="supplierControlInput4" class="form-label">Contact Number</label>
			  <input disabled value="<?=set_value('contact_number',$row['contact_number'])?>" name="contact_number" type="text" class="form-control <?=!empty($errors['contact_person']) ? 'border-danger':''?>" id="supplierControlInput4" placeholder="Contact Number">
			  <?php if(!empty($errors['contact_number'])):?>
					<small class="text-danger"><?=$errors['contact_number']?></small>
				<?php endif;?>
			</div>

            <div class="mb-3">
			  <label for="supplierControlInput5" class="form-label">Email</label>
			  <input disabled value="<?=set_value('contact_email',$row['contact_email'])?>" name="contact_email" type="text" class="form-control <?=!empty($errors['contact_email']) ? 'border-danger':''?>" id="supplierControlInput5" placeholder="Email">
			  <?php if(!empty($errors['contact_email'])):?>
					<small class="text-danger"><?=$errors['email']?></small>
				<?php endif;?>
			</div>

            <div class="mb-3">
			  <label for="supplierControlInput6" class="form-label">Business Type</label>
			  <input disabled value="<?=set_value('business_type',$row['business_type'])?>" name="business_type" type="text" class="form-control <?=!empty($errors['business_type']) ? 'border-danger':''?>" id="supplierControlInput6" placeholder="Business Type">
			  <?php if(!empty($errors['business_type'])):?>
					<small class="text-danger"><?=$errors['business_type']?></small>
				<?php endif;?>
			</div>
			
			<button class="btn btn-success float-end">Restore</button>
			<a href="index.php?pg=admin&tab=suppliers">
				<button type="button" class="btn btn-primary">Cancel</button>
			</a>
		</form>
		<?php else:?>
			That Supplier was not found
			<br><br>
			<a href="index.php?pg=admin&tab=deleted items">
				<button type="button" class="btn btn-primary">Back to Deleted Items</button>
			</a>

		<?php endif;?>

	</div>

<?php require views_path('partials/footer');?>