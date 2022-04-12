<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once __DIR__.'/../vendor/autoload.php';
require_once __DIR__.'/services/JobService.class.php';
require_once __DIR__.'/services/WorkerService.class.php';

Flight::register('workerService', 'WorkerService');
Flight::register('jobService', 'JobService');

Flight::map('error', function(Exception $ex){
    // Handle error
    Flight::json(['message' => $ex->getMessage()], 500);
});

require_once __DIR__.'/routes/WorkerRoutes.php';
require_once __DIR__.'/routes/JobRoutes.php';

Flight::start();
?>
