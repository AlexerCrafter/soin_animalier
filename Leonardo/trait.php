<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Creer fiche Traitement</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="form-container">
        <h2>Creer fiche Traitement</h2>
        <?php
        include 'config.php';

        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $nom = $_POST['nom'];
            $espece = $_POST['espece'];
            $date = $_POST['date'];
            $poids_actu = $_POST['poids_actu'];
            $poids_pese = $_POST['poids_pese'];
            $type_alimentation = $_POST['type_alimentation'];
            $quantite = $_POST['quantite'];
            $traitement_actu = $_POST['traitement_actu'];
            $diff_poids = $_POST['diff_poids'];

            // Insérer un nouvel enregistrement
            $sql = "INSERT INTO Suivi (Nom, Espece, Date, Poids_Actu, Poids_Pese, Type_Alimentation, Quantite, Traitement_actu, Diff_Poids) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            $stmt = $conn->prepare($sql);
            $stmt->bind_param("sssiisiss", $nom, $espece, $date, $poids_actu, $poids_pese, $type_alimentation, $quantite, $traitement_actu, $diff_poids);

            if ($stmt->execute()) {
                echo "<p>Enregistrement sauvegardé avec succès !</p>";
            } else {
                echo "<p>Erreur : " . $stmt->error . "</p>";
            }

            $stmt->close();
        }

        $conn->close();
        ?>
        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
            <div class="form-group">
                <label for="nom">Nom</label>
                <input type="text" id="nom" name="nom" required>
            </div>
            <div class="form-group">
                <label for="espece">Espèce</label>
                <input type="text" id="espece" name="espece" required>
            </div>
            <div class="form-group">
                <label for="date">Date</label>
                <input type="date" id="date" name="date" required>
            </div>
            <div class="form-group">
                <label for="poids_actu">Poids Actuel</label>
                <input type="number" id="poids_actu" name="poids_actu" required>
            </div>
            <div class="form-group">
                <label for="poids_pese">Poids Pesé</label>
                <input type="number" id="poids_pese" name="poids_pese" required>
            </div>
            <div class="form-group">
                <label for="type_alimentation">Type d'Alimentation</label>
                <input type="text" id="type_alimentation" name="type_alimentation" required>
            </div>
            <div class="form-group">
                <label for="quantite">Quantité de repas</label>
                <input type="number" id="quantite" name="quantite" required>
            </div>
            <div class="form-group">
                <label for="traitement_actu">Traitement Actuel</label>
                <input type="text" id="traitement_actu" name="traitement_actu">
            </div>
            <div class="form-group">
                <label for="diff_poids">Différence de Poids</label>
                <input type="number" id="diff_poids" name="diff_poids">
            </div>
            <div class="form-actions">
                <button type="submit" name="submit">Soumettre</button>
                <button type="reset">Réinitialiser</button>
            </div>
        </form>
    </div>
</body>
</html>
