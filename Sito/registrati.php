<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduConnect - Registrazione</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #a8e6f1;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background-color: #ffffff;
            padding: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            color: #1a4b8e;
            font-size: 1.5rem;
            font-weight: bold;
            text-decoration: none;
        }

        .main-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 2rem;
        }

        .registration-card {
            background-color: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
        }

        .registration-card h1 {
            color: #1a4b8e;
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .step {
            display: none;
        }

        .step.active {
            display: block;
        }

        .form-group {
            margin-bottom: 1rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #333;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
        }

        .button {
            width: 100%;
            padding: 0.75rem;
            background-color: #1a4b8e;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            margin-top: 1rem;
        }

        .button:hover {
            background-color: #153d73;
        }

        .step-indicator {
            display: flex;
            justify-content: center;
            margin-bottom: 2rem;
        }

        .step-dot {
            width: 12px;
            height: 12px;
            background-color: #ddd;
            border-radius: 50%;
            margin: 0 5px;
        }

        .step-dot.active {
            background-color: #1a4b8e;
        }

        .buttons-container {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
        }

        .back-button {
            background-color: #6c757d;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <a href="#" class="logo">EduConnect</a>
    </nav>
    
    <div class="main-container">
        <div class="registration-card">
            <h1>Registrazione</h1>
            
            <div class="step-indicator">
                <div class="step-dot active"></div>
                <div class="step-dot"></div>
                <div class="step-dot"></div>
            </div>

            <form action="InsertAzienda.php" method="POST" id="registrationForm">
                <!-- Step 1: Selezione tipo utente -->
                <div class="step active" id="step1">
                    <div class="form-group">
                        <label for="userType">Seleziona il tipo di utente</label>
                        <select id="userType" name="userType" required>
                            <option value="">Seleziona...</option>
                            <option value="student">Studente</option>
                            <option value="school">Scuola</option>
                            <option value="company">Azienda</option>
                        </select>
                    </div>
                    <button type="button" class="button" onclick="nextStep(1)">Avanti</button>
                </div>

                <!-- Step 2: Dati personali -->
                <div class="step" id="step2">
                    <div id="studentFields" style="display: none;">
                        <div class="form-group">
                            <label for="nome">Nome</label>
                            <input type="text" id="nome" name="nome">
                        </div>
                        <div class="form-group">
                            <label for="cognome">Cognome</label>
                            <input type="text" id="cognome" name="cognome">
                        </div>
                        <div class="form-group">
                            <label for="email">EMail</label>
                            <input type="text" id="email" name="email">
                        </div>
                        <div class="form-group">
                            <label for="citta">Città</label>
                            <select id="citta" name="citta" >
                                <option value="">Seleziona prima la provincia...</option>
                                <?php
                                	include 'Connect.php';
                                    
                                    $conn = Connect();
                                    
                                    $query = "SELECT * FROM Provincie";
                                    $result = mysqli_query($conn, $query);
                                    
                                    if(mysqli_num_rows($result) > 0){
                                    	while($row = mysqli_fetch_assoc($result)){
                                        	echo "<option name=" . $row["citta"] . ">" . $row["citta"] . "</option>";
                                        }
                                    }
                                ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="course">Corso di studi</label>
                            <input type="text" id="course" name="course">
                        </div>
                    </div>

                    <div id="teacherFields" style="display: none;">
                        <div class="form-group">
                            <label for="subject">Materia di insegnamento</label>
                            <input type="text" id="subject" name="subject">
                        </div>
                        <div class="form-group">
                            <label for="experience">Anni di esperienza</label>
                            <input type="number" id="experience" name="experience">
                        </div>
                    </div>

                    <div id="companyFields" style="display: none;">
                        <div class="form-group">
                            <label for="companyName">Nome azienda</label>
                            <input type="text" id="companyName" name="nome">
                        </div>
                        <div class="form-group">
                            <label for="descrizione">Descrizione</label>
                            <input type="text" id="descrizione" name="descrizione">
                        </div>
                        <div class="form-group">
                            <label for="indirizzo">Indirizzo</label>
                            <input type="text" id="indirizzo" name="indirizzo">
                        </div>
                    </div>

                    <div class="buttons-container">
                        <button type="button" class="button back-button" onclick="prevStep(2)">Indietro</button>
                        <button type="button" class="button" onclick="nextStep(2)">Avanti</button>
                    </div>
                </div>

                <!-- Step 3: Dati account -->
                <div class="step" id="step3">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Conferma Password</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" required>
                    </div>
                    <div class="buttons-container">
                        <button type="button" class="button back-button" onclick="prevStep(3)">Indietro</button>
                        <button type="submit" class="button">Registrati</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script>
        let currentStep = 1;
        const form = document.getElementById('registrationForm');
        const userTypeSelect = document.getElementById('userType');

        userTypeSelect.addEventListener('change', function() {
            // Nascondi tutti i campi specifici
            document.getElementById('studentFields').style.display = 'none';
            document.getElementById('teacherFields').style.display = 'none';
            document.getElementById('companyFields').style.display = 'none';

            // Mostra i campi relativi al tipo di utente selezionato
            if (this.value === 'student') {
                document.getElementById('studentFields').style.display = 'block';
            } else if (this.value === 'teacher') {
                document.getElementById('teacherFields').style.display = 'block';
            } else if (this.value === 'company') {
                document.getElementById('companyFields').style.display = 'block';
            }
        });

        function nextStep(step) {
            if (step === 1 && !userTypeSelect.value) {
                alert('Seleziona il tipo di utente per continuare');
                return;
            }

            document.querySelector(`#step${step}`).classList.remove('active');
            document.querySelector(`#step${step + 1}`).classList.add('active');
            document.querySelectorAll('.step-dot')[step].classList.add('active');
            currentStep = step + 1;
        }

        function prevStep(step) {
            document.querySelector(`#step${step}`).classList.remove('active');
            document.querySelector(`#step${step - 1}`).classList.add('active');
            document.querySelectorAll('.step-dot')[step - 1].classList.remove('active');
            currentStep = step - 1;
        }

        form.addEventListener('submit', function(e) {
            
            // Validazione password
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;

            if (password !== confirmPassword) {
                alert('Le password non coincidono');
                return;
            }

            // Qui puoi aggiungere la logica per inviare i dati al server
            console.log('Form inviato con successo!');
            alert('Registrazione completata con successo!');
        });
    </script>
</body>
</html>
