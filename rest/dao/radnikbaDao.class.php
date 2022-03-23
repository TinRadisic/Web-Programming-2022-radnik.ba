<?php

class radnikbaDao{

  private $conn;

  /**
  * constructor of dao class
  */
  public function __construct(){
    $servername = "localhost:3307";
    $username = "root";
    $password = "0000";
    $this->conn = new PDO("mysql:host=$servername;dbname=radnikba", $username, $password);
    // set the PDO error mode to exception
    $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  }

  /**
  * Method used to read all job objects from database
  */
  public function get_all(){
    $stmt = $this->conn->prepare("SELECT * FROM job");
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }
  /* Method used to read individual job objects from database */
  public function get_by_id($job_id){
    $stmt = $this->conn->prepare("SELECT * FROM job WHERE job_id = :job_id");
    $stmt->execute(['job_id' => $job_id]);
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
    return reset($result);
  }

  /**
  * Method used to add job to the database
  */
  public function add($jobs){
    $stmt = $this->conn->prepare("INSERT INTO job (job_name, job_description) VALUES (:job_name, :job_description)");
    $stmt->execute($jobs);
    $jobs['id'] = $this->conn->lastInsertId();
    return $jobs;
  }

  /**
  * Delete job record from the database
  */
  public function delete($job_id){
    $stmt = $this->conn->prepare("DELETE FROM job WHERE job_id=:job_id");
    $stmt->bindParam(':job_id', $job_id); // SQL injection prevention
    $stmt->execute();
  }

  /**
  * Update job record
  */
  public function update($jobs){
    $stmt = $this->conn->prepare("UPDATE job SET job_name=:job_name, job_description=:job_description WHERE job_id=:job_id");
    $stmt->execute($jobs);
    return $jobs;
  }

}

?>
