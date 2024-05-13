<nav class="navbar navbar-expand-lg navbar-light bg-light" style="min-width:350px">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="index.php?pg=home" style="font-family:Verdana; font-weight:bold;">
			<img src="assets/images/logo.png" style="width:100%;max-width:50px;margin:0 10px;" >
			<?=esc(APP_NAME)?>
		</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="index.php?pg=home">Point of sale</a>
	        </li>
	        
	        <?php if(Auth::access('supervisor')):?>
				<?php 
				$role = Auth::get('role');
				if ($role=='admin' || $role=='supervisor' ){?>
					<li class="nav-item">
						<a class="nav-link" href="index.php?pg=admin">Admin Panel</a>
				  	</li>
			<?php } 	
				 ?>
		        
		    <?php endif;?>

	        <?php if(Auth::access('admin')):?>
		        <li class="nav-item">
		          <a class="nav-link" href="index.php?pg=signup">Create User</a>
		        </li>
		    <?php endif;?>

		    <?php if(!Auth::logged_in()):?>
		        <li class="nav-item">
		          <a class="nav-link" href="index.php?pg=login">Log In</a>
		        </li>
	        <?php else:?>

		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		            Hi, <?=auth('username')?> (<?=Auth::get('role')?>)
		          </a>
		          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
		            <li><a class="dropdown-item" href="index.php?pg=profile">Profile</a></li>
		            <li><a class="dropdown-item" href="index.php?pg=edit-user&id=<?=Auth::get('id')?>">Profile-Settings</a></li>
		            <li><hr class="dropdown-divider"></li>
		            <li><a class="dropdown-item" href="index.php?pg=logout">Log Out</a></li>
		          </ul>
		        </li>
	    	 <?php endif;?>

	      </ul>
	    </div>
	  </div>
	</nav>