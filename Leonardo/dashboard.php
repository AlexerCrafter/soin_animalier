<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Informations sur les Animaux</title>
    <link rel="stylesheet" href="styled.css">
</head>
<body>
    <div class="container">
        <!-- Bouton 1: "Créer fiche Animal" -->
        <button onclick="window.location.href='add_animal.php';">Créer fiche Animal</button><br>

        <!-- Bouton 2: "Bouton 2" -->
        <button onclick="window.location.href='see_T.php';">Afficher Traitement</button><br>

        <!-- Bouton 3: "Bouton 3" -->
        <button onclick="window.location.href='trait.php';">Creer Traitement</button><br>

        <!-- Bouton 4: "Bouton 4" -->
        <button onclick="window.location.href='del_animal.php';">Supprimer animal</button><br>



        <div id="animal-info" class="animal-info">
            <?php
            // Inclure le fichier config.php pour la connexion à la base de données
            include 'config.php';

            // Vérifier la connexion
            if ($conn->connect_error) {
                die("La connexion a échoué : " . $conn->connect_error);
            }

            // Récupérer tous les animaux de la base de données
            $sql = "SELECT * FROM animals";
            $result = $conn->query($sql);

            // Vérifier si l'exécution de la requête a réussi
            if ($result === false) {
                die("Erreur lors de l'exécution de la requête : " . $conn->error);
            }

            // Afficher tous les animaux
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    $photo_url = $row['photo'];
                    
                    

                    // Définir une image par défaut si aucune URL de photo n'est fournie ou si elle est '0'
                    if (empty($photo_url) || $photo_url == 'uploads/0.jpeg') {
                        $photo_url = 'uploads/0.jpeg'; // Assurez-vous d'avoir cette image dans votre projet
                    }

                    echo "
                        <h2>{$row['name']}</h2>
                        <p>Espèce : {$row['species']}</p>
                        <p>Âge : {$row['age']}</p>
                        <p>Poids : {$row['weight']}</p>
                        <img src='{$photo_url}' alt='{$row['name']}'>
                        <hr>";
                }
            } else {
                echo "Aucun animal trouvé dans la base de données.";
            }

            $conn->close();
            ?>
        </div>
    </div>
</body>
</html>
