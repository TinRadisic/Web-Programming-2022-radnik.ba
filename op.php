<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

require_once("rest/dao/radnikbaDao.class.php");

$dao = new radnikbaDao();

$op = $_REQUEST['op'];

switch ($op) {
  case 'insert':
    $job_name = $_REQUEST['job_name'];
    $job_description = $_REQUEST['job_description'];
    $dao->add($job_name, $job_description);
    break;

  case 'delete':
    $job_id = $_REQUEST['job_id'];
    $dao->delete($job_id);
    echo "DELETED $job_id";
    break;

  case 'update':
    $job_id = $_REQUEST['job_id'];
    $job_name = $_REQUEST['job_name'];
    $job_description = $_REQUEST['job_description'];
    $dao->update($job_id, $job_name, $job_description);
    echo "UPDATED $job_id";
    break;

  case 'get':
  default:
    $results = $dao->get_all();
    print_r($results);
    break;
}
?>
