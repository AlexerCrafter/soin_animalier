<?php
session_start();
include 'config.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $stmt = $conn->prepare("SELECT id, password FROM users WHERE username = ?");
    $stmt->bind_param('s', $username);
    $stmt->execute();
    $stmt->store_result();
    if ($stmt->num_rows > 0) {
        $stmt->bind_result($id, $hashed_password);
        $stmt->fetch();
        if (password_verify($password, $hashed_password)) {
            $_SESSION['user_id'] = $id;
            header("Location: dashboard.php");
            exit();
        } else {
            $error_message = "Identifiants invalides.";
        }
    } else {
        $error_message = "Identifiants invalides.";
    }
}
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            background-image: url('background.jpg');
            background-size: cover; /* Ajuste la taille de l'image de fond */
            background-position: center; /* Centre l'image de fond */
        }
        form {
            max-width: 350px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }
        button[type="submit"] {
            width: 100%;
            background: #007bff;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        button[type="submit"]:hover {
            background: #0056b3;
        }
        .error {
            color: red;
            margin-bottom: 10px;
        }
        h2 {
            text-align: center;
        }
    </style>
</head>
<body>
    <form method="POST">
        <?php if (isset($error_message)) { ?>
            <div class="error"><?php echo $error_message; ?></div>
        <?php } ?>
        <h2>Connexion</h2>
        <label for="username">Nom d'utilisateur :</label>
        <input type="text" name="username" required><br>
        <label for="password">Mot de passe :</label>
        <input type="password" name="password" required><br>
        <button type="submit">Se connecter</button>
    </form>
</body>
</html>
