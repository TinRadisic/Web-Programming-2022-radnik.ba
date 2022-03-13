<?php
require 'vendor/autoload.php';

Flight::route('/',function() {
  echo 'Welcome to the official page of radnik.ba';
});

Flight::start();
?>
