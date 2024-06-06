<?php require views_path('partials/header');?>

	<div class="container-fluid border col-lg-5 col-md-6 mt-5 p-4" >
	<?php if(!empty($row)):?>
		<form method="post">
			<center>
				<h3><i class="fa fa-user"></i> Restore User</h3>
				<div class="alert alert-success text-center">Do you want to restore this User?</div>
			</center>
			<br>

			<div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">Employee ID</label>
			 <div class="form-control"><?=esc($row['userid'])?></div>
			</div>
		 
			<div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">Username</label>
			 <div class="form-control"><?=esc($row['username'])?></div>
			</div>
			
			<div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">Email address</label>
			 <div class="form-control"><?=esc($row['email'])?></div>
			</div>

		<div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">Gender</label>
 				<div class="form-control"><?=esc($row['gender'])?></div>
			</div>

		<div class="mb-3">
			  <label for="exampleFormControlInput1" class="form-label">Role</label>
 				<div class="form-control"><?=esc($row['role'])?></div>
			</div>


			<br>
			<button class="btn btn-success float-end">Restore</button>
            <a href="index.php?pg=admin&tab=deleted items">
				<button type="button" class="btn btn-danger">Cancel</button>
			</a>
		</form>
		<?php else:?>
			That User was not found
			<br><br>
			<a href="index.php?pg=admin&tab=deleted items">
				<button type="button" class="btn btn-primary">Back to Deleted Items</button>
			</a>

		<?php endif;?>
	</div>

<?php require views_path('partials/footer');?>
