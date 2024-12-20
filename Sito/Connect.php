<?php

  session_start();
  if(!isset($_SESSION["ID_Utente"])){
    session_regenerate_id();
  }  
  function Connect()  {
    $servername = "localhost";
    $username = "sodhu";
    $password = "";
    $database = "my_sodhu";
      
      // Create connection
      $conn = new mysqli($servername, $username, $password, $database);
      
      // Check connection
      if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
      }

      return $conn;
  }
?>  
