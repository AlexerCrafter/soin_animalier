<?php
session_start();
include 'config.php';

// Rediriger vers la page de connexion si l'utilisateur n'est pas connecté
if (!isset($_SESSION['user_id'])) {
    header("Location: dashboard.php");
    exit();
}

$user_id = $_SESSION['user_id'];

// Gérer la soumission du formulaire pour créer un profil d'animal
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['create_animal'])) {
    $name = $_POST['name'];
    $species = $_POST['species'];
    $age = $_POST['age'];
    $weight = $_POST['weight'];
    $threshold_weight = $_POST['threshold_weight'];
    $threshold_meal_frequency = $_POST['threshold_meal_frequency'];

    $photo = '';
    if (isset($_FILES['photo']) && $_FILES['photo']['error'] == 0) {
        $upload_dir = 'uploads/'; // Changer 'uploads/' vers le répertoire correct où vos photos sont stockées
        $photo_name = basename($_FILES['photo']['name']);
        $photo_path = $upload_dir . $photo_name;
        move_uploaded_file($_FILES['photo']['tmp_name'], $photo_path);
        $photo = $photo_path;
    }

    // Insérer un nouveau profil d'animal dans la base de données
    $stmt = $conn->prepare("INSERT INTO animals (user_id, name, species, age, weight, photo, threshold_weight, threshold_meal_frequency) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param('issididd', $user_id, $name, $species, $age, $weight, $photo, $threshold_weight, $threshold_meal_frequency);
    $stmt->execute();
}

// Récupérer les animaux appartenant à l'utilisateur
$stmt = $conn->prepare("SELECT id, name, species, age, weight, photo FROM animals WHERE user_id = ?");
$stmt->bind_param('i', $user_id);
$stmt->execute();
$result = $stmt->get_result();
?>

<!DOCTYPE html>
<html>
<head>
    <title>Ajouter animal</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Ajouter un Animal</h1>

    <!-- Formulaire pour créer un profil d'animal -->
    <h2>Créer Profil Animal</h2>
    <form method="POST" enctype="multipart/form-data">
        Nom : <input type="text" name="name" required><br>
        Espèce : <input type="text" name="species" required><br>
        Âge : <input type="number" name="age" required><br>
        Poids : <input type="number" step="0.1" name="weight" required><br>
        Photo : <input type="file" name="photo" accept="image/*"><br>
        Seuil de poids : <input type="number" step="0.1" name="threshold_weight" required><br>
        Fréquence de repas seuil : <input type="number" name="threshold_meal_frequency" required><br>
        <button type="submit" name="create_animal">Créer Profil</button>
    </form>
</body>
</html>
