import mysql.connector
import datetime

# Création de la fonction qui nous permet de se connecter à la base de données et d'effectuer des actions
def connexion():
  db = mysql.connector.connect(
    host = "localhost",
    user = "root@localhost",
    password = "",
    database = "Soin_Animal")
  cursor = db.cursor()

  # On insert le poids qui a été pesé
  cursor.execute(""" INSERT INTO 'Soin_Animal.Suivi.Poids_Pese' VALUES (?); """)
  de.commit()

  # On récupère la Date, le Poids pesé et le Poids actuel
  cursor.execute(""" SELECT Suivi.Date, Suivi.Poids_Pese, Suivi.Poids_Actu FROM Soin_Animal.Animal; """)
  db.commit()

  # On ferme la base de données
  db.close()
