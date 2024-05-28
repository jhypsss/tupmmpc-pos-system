<?php require views_path('partials/header');?>

	<div class="container-fluid border col-lg-4 col-md-5 mt-5 p-4 shadow-sm">
		
		<form method="post">
			<center>
				<h1><img class="mx-auto d-block" src="assets/images/TUP LOGO.png" style="width:40%;">
				<h4><?=esc(APP_NAME)?></h4>
			</center>
			<br>
		
			<div class="input-group mb-3">
			  <span class="input-group-text mx-auto" style="width:6rem" id="basic-addon1">User ID:</span>
			  <input value="<?=set_value('user')?>" name="user" type="user" class="form-control <?=!empty($errors['user']) ? 'border-danger':''?>" placeholder="Enter User ID or Email" aria-label="Username" aria-describedby="basic-addon1">
				<?php if(!empty($errors['user'])):?>
					<small class="text-danger col-12"><?=$errors['user']?></small>
				<?php endif;?>
			</div>

			<div class="input-group mb-3">
			  <span class="input-group-text mx-auto" style="width:6rem;" id="basic-addon2">Password:</span>
			  <input value="<?=set_value('password')?>" name="password" type="password" class="form-control <?=!empty($errors['password']) ? 'border-danger':''?>" placeholder="Password" aria-label="Password" aria-describedby="basic-addon2">
				<?php if(!empty($errors['password'])):?>
					<small class="text-danger col-12"><?=$errors['password']?></small>
				<?php endif;?>
			</div>

			<br>
			<div class="row px-2">
				<button class="btn btn-primary" style="font-size: 20px;">Login</button>
			</div>
		</form>
	</div>

<?php require views_path('partials/footer');?>
