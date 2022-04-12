<?php
// CRUD operations for worker entity

/**
* List all workers
*/
Flight::route('GET /worker', function(){
  Flight::json(Flight::workerService()->get_all());
});

/**
* List invidiual worker
*/
Flight::route('GET /worker/@id', function($id){
  Flight::json(Flight::workerService()->get_by_id($id));
});

/**
* add worker
*/
Flight::route('POST /worker', function(){
  Flight::json(Flight::workerService()->add(Flight::request()->data->getData()));
});

/**
* update worker
*/
Flight::route('PUT /worker/@id', function($id){
  $data = Flight::request()->data->getData();
  Flight::json(Flight::workerService()->update($id, $data));
});

/**
* delete worker
*/
Flight::route('DELETE /worker/@id', function($id){
  Flight::workerService()->delete($id);
  Flight::json(["message" => "deleted"]);
});

?>