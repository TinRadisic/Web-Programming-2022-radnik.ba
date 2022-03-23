<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once 'dao/radnikbaDao.class.php';
require_once '../vendor/autoload.php';

Flight::register('radnikbaDao', 'RadnikbaDao');

// CRUD operations for job entity

/**
* List all jobs
*/
Flight::route('GET /job', function(){
  Flight::json(Flight::radnikbaDao()->get_all());
});

/**
* List invidiual job
*/
Flight::route('GET /job/@job_id', function($job_id){
  Flight::json(Flight::radnikbaDao()->get_by_id($job_id));
});

/**
* add job
*/
Flight::route('POST /job', function(){
  Flight::json(Flight::radnikbaDao()->add(Flight::request()->data->getData()));
});

/**
* update job
*/
Flight::route('PUT /job/@job_id', function($job_id){
  $data = Flight::request()->data->getData();
  $data['job_id'] = $job_id;
  Flight::json(Flight::radnikbaDao()->update($data));
});

/**
* delete job
*/
Flight::route('DELETE /job/@job_id', function($job_id){
  Flight::radnikbaDao()->delete($job_id);
  Flight::json(["message" => "Deleted!"]);
});

Flight::start();
?>
