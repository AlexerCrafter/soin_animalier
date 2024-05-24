<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Voir les Enregistrements de Suivi</title>
    <link rel="stylesheet" href="style.css">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="table-container">
        <h2>Enregistrements de Suivi</h2>
        <?php
        include 'config.php';

        $sql = "SELECT * FROM Suivi";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            echo "<table>";
            echo "<tr><th>ID Suivi</th><th>ID Animal</th><th>Nom</th><th>Espece</th><th>Date</th><th>Poids Actu</th><th>Poids Pesé</th><th>Type Alimentation</th><th>Quantité</th><th>Traitement Actu</th><th>Diff Poids</th></tr>";
            while ($row = $result->fetch_assoc()) {
                echo "<tr>";
                echo "<td>" . $row["Id_Suivi"] . "</td>";
                echo "<td>" . $row["Id_Animal"] . "</td>";
                echo "<td>" . $row["Nom"] . "</td>";
                echo "<td>" . $row["Espece"] . "</td>";
                echo "<td>" . $row["Date"] . "</td>";
                echo "<td>" . $row["Poids_Actu"] . "</td>";
                echo "<td>" . $row["Poids_Pese"] . "</td>";
                echo "<td>" . $row["Type_Alimentation"] . "</td>";
                echo "<td>" . $row["Quantite"] . "</td>";
                echo "<td>" . $row["Traitement_actu"] . "</td>";
                echo "<td>" . $row["Diff_Poids"] . "</td>";
                echo "</tr>";
            }
            echo "</table>";
        } else {
            echo "<p>Aucun enregistrement trouvé.</p>";
        }

        $conn->close();
        ?>
    </div>
</body>
</html>

