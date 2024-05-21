<?php require views_path('partials/header');?>

	<div class="container-fluid border col-lg-5 col-md-6 mt-5 p-4" >
	
		<form method="post">
			<center>
				<h3><i class="fa fa-user"></i> Restore User</h3>
				<div class="alert alert-success text-center">Are you sure you want to delete this user?!</div>
			</center>
			<br>
		 
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
	</div>

<?php require views_path('partials/footer');?>
