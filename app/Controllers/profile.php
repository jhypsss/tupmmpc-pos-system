<?php 

$errors = [];
$user = new User();

$id = $_GET['id'] ?? Auth::get('id');
$row = $user->first(['id'=>$id]);

require views_path('auth/profile');