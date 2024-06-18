<?php require views_path('partials/header');?>

	<div class="container-fluid border rounded p-4 m-2 col-lg-4 mx-auto">

		<form method="post" enctype="multipart/form-data">

			<h5 class="text-primary"><i class="fa fa-truck"></i> Update Supplier</h5>
						
			<br>
			<div class="mb-3">
			  <label for="supplierControlInput1" class="form-label">Company Name</label>
			  <input value="<?=set_value('company_name',$row['company_name'])?>" name="company_name" type="text" class="form-control <?=!empty($errors['name']) ? 'border-danger':''?>" id="supplierControlInput1" placeholder="Company Name" autocomplete="off">
			  <?php if(!empty($errors['company_name'])):?>
					<small class="text-danger"><?=$errors['company_name']?></small>
				<?php endif;?>
			</div>

			<div class="mb-3">
			  <label for="supplierControlInput2" class="form-label">Company Address</label>
			  <input value="<?=set_value('company_address',$row['company_address'])?>" name="company_address" type="text" class="form-control <?=!empty($errors['company_address']) ? 'border-danger':''?>" id="supplierControlInput2" placeholder="Company Address" autocomplete="off">
			  <?php if(!empty($errors['company_address'])):?>
					<small class="text-danger"><?=$errors['company_address']?></small>
				<?php endif;?>
			</div>

            <div class="mb-3">
			  <label for="supplierControlInput3" class="form-label">Contact Person</label>
			  <input value="<?=set_value('contact_person',$row['contact_person'])?>" name="contact_person" type="text" class="form-control <?=!empty($errors['contact_person']) ? 'border-danger':''?>" id="supplierControlInput3" placeholder="Contact Person" autocomplete="off">
			  <?php if(!empty($errors['contact_person'])):?>
					<small class="text-danger"><?=$errors['contact_person']?></small>
				<?php endif;?>
			</div>

            <div class="mb-3">
			  <label for="supplierControlInput4" class="form-label">Contact Number</label>
			  <input value="<?=set_value('contact_number',$row['contact_number'])?>" name="contact_number" type="text" class="form-control <?=!empty($errors['contact_number']) ? 'border-danger':''?>" id="supplierControlInput4" placeholder="Contact Number" autocomplete="off">
			  <?php if(!empty($errors['contact_number'])):?>
					<small class="text-danger"><?=$errors['contact_number']?></small>
				<?php endif;?>
			</div>

            <div class="mb-3">
			  <label for="supplierControlInput5" class="form-label">Email</label>
			  <input value="<?=set_value('contact_email',$row['contact_email'])?>" name="contact_email" type="text" class="form-control <?=!empty($errors['contact_email']) ? 'border-danger':''?>" id="supplierControlInput5" placeholder="Email" autocomplete="off">
			  <?php if(!empty($errors['contact_email'])):?>
					<small class="text-danger"><?=$errors['contact_email']?></small>
				<?php endif;?>
			</div>

            <div class="mb-3">
			  <label for="supplierControlInput6" class="form-label">Business Type</label>
			  <select class="form-control" id="supplierControlInput6" name="business_type" required>
                <?php if(strcmp($row['business_type'], "---") !== 0): ?>
					<option value="<?= esc($row['business_type']) ?>" hidden><?= esc($row['business_type']) ?></option>
				<?php else: ?>
					<option value="---">Select a Business Type</option>
				<?php endif; ?>

                <option>Distributor</option>
                <option>Wholesale</option>
				<option>Retails</option>
				<option>Manufacturer</option>
				<option>Vendor</option>
				<option>Service</option>
				<option>Raw Materials</option>
				<option>Commodity Supplier</option>
				<option>Trader</option>
				<option>Producers</option>
				<option>Importers</option>
              </select>
			</div>

			<button class="btn btn-danger float-end">Save</button>
			<a href="index.php?pg=admin&tab=suppliers">
				<button type="button" class="btn btn-primary">Cancel</button>
			</a>
		</form>
	</div>

<?php require views_path('partials/footer');?>