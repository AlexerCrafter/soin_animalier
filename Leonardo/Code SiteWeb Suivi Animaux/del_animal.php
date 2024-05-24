<?php
session_start();
include 'config.php';

// Rediriger vers la page de connexion si l'utilisateur n'est pas connecté
if (!isset($_SESSION['user_id'])) {
    header("Location: dashboard.php");
    exit();
}

$user_id = $_SESSION['user_id'];

// Gérer la suppression du profil d'animal
if (isset($_GET['delete']) && isset($_GET['id'])) {
    $animal_id = $_GET['id'];
    // S'assurer que l'animal appartient à l'utilisateur actuel avant de le supprimer
    $stmt = $conn->prepare("DELETE FROM animals WHERE id = ? AND user_id = ?");
    $stmt->bind_param('ii', $animal_id, $user_id);
    if ($stmt->execute()) {
        // Rediriger vers cette page après la suppression
        header("Location: ".$_SERVER['PHP_SELF']);
        exit();
    } else {
        echo "Erreur lors de la suppression de l'animal.";
    }
}

// Récupérer les animaux appartenant à l'utilisateur
$stmt = $conn->prepare("SELECT id, name, species, age, weight, photo FROM animals WHERE user_id = ?");
$stmt->bind_param('i', $user_id);
if ($stmt->execute()) {
    $result = $stmt->get_result();
} else {
    echo "Erreur lors de la récupération des animaux.";
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Supprimer animal</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="styledel.css">
</head>
<body>
    <!-- Formulaire pour créer un profil d'animal -->
    <h2>Supprimer l'animal</h2>
    <form method="POST" enctype="multipart/form-data">
        <!-- Vos champs de formulaire existants -->
        <!-- ... -->
    </form>

    <!-- Afficher les profils d'animaux existants avec des boutons de suppression -->
    <h2>Profils Animaux Existants</h2>
    <?php if ($result->num_rows > 0): ?>
        <?php while ($row = $result->fetch_assoc()): ?>
            <div>
                <p>Nom : <?php echo $row['name']; ?></p>
                <p>Espèce : <?php echo $row['species']; ?></p>
                <!-- Afficher d'autres détails si nécessaire -->
               
                <!-- Ajouter un bouton de suppression avec un lien pour déclencher la suppression -->
                <a href="?delete=true&id=<?php echo $row['id']; ?>" onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce profil animal ?')">Supprimer</a>
            </div>
        <?php endwhile; ?>
    <?php else: ?>
        <p>Aucun profil animal trouvé.</p>
    <?php endif; ?>
</body>
</html>

