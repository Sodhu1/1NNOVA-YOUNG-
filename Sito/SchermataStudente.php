<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        }

        body {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 250px;
            background-color: #f8f0ff;
            padding: 20px;
            display: flex;
            flex-direction: column;
            border-right: 1px solid #eee;
        }

        .profile {
            text-align: center;
            margin-bottom: 30px;
        }

        .profile-image {
            width: 80px;
            height: 80px;
            background-color: #e8e0ff;
            border-radius: 50%;
            margin: 0 auto 10px;
        }

        .menu-item {
            display: flex;
            align-items: center;
            padding: 12px;
            margin-bottom: 8px;
            border-radius: 8px;
            color: #333;
            text-decoration: none;
            transition: background-color 0.2s;
        }

        .menu-item:hover {
            background-color: #e8e0ff;
        }

        .menu-item.active {
            background-color: #e8e0ff;
        }

        .menu-item span {
            margin-left: 10px;
        }

        .main-content {
            flex-grow: 1;
            background-color: #7dd3e9;
            padding: 20px;
        }

        .company-card {
            background-color: white;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }

        .company-image {
            width: 80px;
            height: 80px;
            background-color: #f0f0f0;
            margin-right: 15px;
        }

        .company-info h3 {
            margin-bottom: 5px;
        }

        .company-info p {
            color: #666;
            margin-bottom: 10px;
        }

        .more-button {
            background-color: #f8f8f8;
            border: none;
            padding: 5px 15px;
            border-radius: 15px;
            cursor: pointer;
        }

        @media (max-width: 768px) {
            body {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                padding: 10px;
            }

            .main-content {
                padding: 10px;
            }

            .company-card {
                flex-direction: column;
                text-align: center;
            }

            .company-image {
                margin: 0 0 15px 0;
            }
        }
    </style>
</head>
<body>
    <div class="sidebar">
	<?php
      include 'Connect.php';
      $foto = $_SESSION["Foto"];
      echo '<div class="profile">
               <img class="profile-image" src=' . $foto . ' alt="Profile Picture" width="500" height="600"> 
              <p>' . $_SESSION["Nome_utente"] . '</p>
          </div>';
	?>
        
        <nav>
            <a href="#" class="menu-item active">
                📊 <span>Dashboard</span>
            </a>
            <a href="#" class="menu-item">
                📬 <span>In arrivo</span>
            </a>
            <a href="#" class="menu-item">
                💌 <span>Richieste Inviate</span>
            </a>
            <a href="#" class="menu-item">
                ❤️ <span>Preferiti</span>
            </a>
        </nav>
    </div>

    <div class="main-content">
        <?php
        	$conn = Connect();
            
            $query = "SELECT * FROM Aziende";
            $result = mysqli_query($conn,$query);
            
            if(mysqli_num_rows($result) > 0){
            	while($row = mysqli_fetch_assoc($result)){
                	echo '<div class="company-card">
                            <img class="company-image" src="'. $row['Foto'] .'" alt="Company Image">
                            <div class="company-info">
                                <h3>'. $row['Nome'] .'</h3>
                                <p>'. $row['Descrizione'] .'</p>
                                <button class="more-button">Scopri Di più</button>
                            </div>
                          </div>';
                }
            }
        ?>
    </div>
</body>
</html>
