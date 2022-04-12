<?php

// CRUD operations for job entity

/**
* List all jobs
*/
Flight::route('GET /job', function(){
  Flight::json(Flight::jobService()->get_all());
});

/**
* List invidiual job
*/
Flight::route('GET /job/@id', function($id){
  Flight::json(Flight::jobService()->get_by_id($id));
});

/**
* List invidiual workers for job
*/
Flight::route('GET /job/@id/worker', function($id){
  Flight::json(Flight::workerService()->get_worker_by_job_id($id));
});


/**
* add jobs
*/
Flight::route('POST /job', function(){
  Flight::json(Flight::jobService()->add(Flight::request()->data->getData()));
});

/**
* update job
*/
Flight::route('PUT /job/@id', function($id){
  $data = Flight::request()->data->getData();
  Flight::json(Flight::jobService()->update($id, $data));
});

/**
* delete job
*/
Flight::route('DELETE /job/@id', function($id){
  Flight::jobService()->delete($id);
  Flight::json(["message" => "deleted"]);
});

?>
