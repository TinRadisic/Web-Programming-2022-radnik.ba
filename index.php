<?php
require 'vendor/autoload.php';

Flight::route('/',function() {
  echo 'Welcome to the official page of radnik.ba!';
});
$servername = "localhost:3307";
$username = "";
$password = "";
try {
  $conn = new PDO("mysql:host=$servername;dbname=radnikba", $username, $password);
  // set the PDO error mode to exception
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  echo "Connected successfully";
} catch(PDOException $e) {
  echo "Connection failed: " . $e->getMessage();
}
Flight::start();
?>
