<?php
    include "Connect.php";

	$conn = Connect();
    
    if(!$conn){
    echo 'connessione non riuscita';
    }
    
    $tab = $_POST['utente'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Prepared Statement
    $stmt = mysqli_prepare($conn, "SELECT * FROM $tab WHERE Email = ? AND Password = ?");
    mysqli_stmt_bind_param($stmt, "ss", $email, hash('sha512', $password));
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);	

    if(mysqli_num_rows( $result ) > 0){
        $utente = mysqli_fetch_assoc( $result );
        echo "login effettuato con successo";
    }else{
        die("utente non trovato");
    }

    $_SESSION["ID_utente"] = $utente["ID"];
    $_SESSION["Nome_utente"] = $utente["Nome"];
    $_SESSION["Foto"] = $utente["Foto"];

    if ($tab == "Studenti"){
    	header('location: SchermataStudente.php');
    }
    
    if ($tab == "Aziende"){
    	header('location: SchermataAziende.php');
    }
    
    if ($tab == "Tutor"){
    	header('location: SchermataTutor.php');
    }
    
    if ($tab == "Scuole"){
    	header('location: SchermataScuola.php');
    }
    
    mysqli_stmt_close($stmt);
    mysqli_close($conn);
?>
