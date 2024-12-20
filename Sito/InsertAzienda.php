<?php
    include "Connect.php";

	$conn = Connect();
    
    if(!$conn){
    echo 'connessione non riuscita';
    }
    
    $Nome = $_POST['nome'];
    $Descrizione = $_POST['descrizione'];
    $Indirizzo = $_POST['indirizzo'];
    $Email = $_POST['email'];
    $password = $_POST['password'];

    // Prepared Statement
    $stmt = mysqli_prepare($conn, "INSERT INTO Aziende (Nome,Indirizzo,Descrizione,Email,Password) 
    VALUES(?,?,?,?,?)");
    mysqli_stmt_bind_param($stmt, "sssss",$Nome,$Indirizzo,$Descrizione,$Email,hash('sha512', $password));
    mysqli_stmt_execute($stmt);
    
    header("location: SchermataAziende.php");

    mysqli_stmt_close($stmt);
    mysqli_close($conn);
?>
