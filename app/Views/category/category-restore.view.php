<?php require views_path('partials/header');?>

	<div class="container-fluid border rounded p-4 m-2 col-lg-4 mx-auto">

		<?php if(!empty($row)):?>

		<form method="post" enctype="multipart/form-data">

			<h5 class="text-primary"><i class="fa fa-table"></i> Restore Category</h5>

			<div class="alert alert-success text-center">Are you sure you want to restore this Category?</div>

			<div class="mb-3">
			  <label for="categoryControlInput1" class="form-label">Category Name</label>
			  <input disabled value="<?=set_value('name',$row['name'])?>" name="name" type="text" class="form-control <?=!empty($errors['name']) ? 'border-danger':''?>" id="categoryControlInput1" placeholder="Category Name">
			  <?php if(!empty($errors['name'])):?>
					<small class="text-danger"><?=$errors['name']?></small>
				<?php endif;?>
			</div>

			<div class="mb-3">
			  <label for="categoryControlInput2" class="form-label">Description</label>
			  <input disabled value="<?=set_value('description',$row['description'])?>" name="description" type="text" class="form-control <?=!empty($errors['description']) ? 'border-danger':''?>" id="categoryControlInput2" placeholder="Description">
			  <?php if(!empty($errors['description'])):?>
					<small class="text-danger"><?=$errors['description']?></small>
				<?php endif;?>
			</div>
			
			<button class="btn btn-success float-end">Restore</button>
			<a href="index.php?pg=admin&tab=deleted items">
				<button type="button" class="btn btn-primary">Cancel</button>
			</a>
		</form>
		<?php else:?>
			That Category was not found
			<br><br>
			<a href="index.php?pg=admin&tab=deleted items">
				<button type="button" class="btn btn-primary">Back to Deleted Items</button>
			</a>

		<?php endif;?>

	</div>

<?php require views_path('partials/footer');?>