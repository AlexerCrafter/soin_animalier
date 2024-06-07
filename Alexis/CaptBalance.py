# Importation des bibliothèques
import time
import sys
import RPi.GPIO as GPIO
from hx711 import HX711
import mysql.connector
import SauvPoids # On import le fichier SauvPoids.py

# Définition de la fonction qui permet de quitter le programme
def cleanAndExit():
  print("Cleaning...")
  print("Bye !")
  sys.exit()

# Définition des pins d'horloge et de données
hx = HX711(5, 6)

# Définition du referenceUnit (unité de référence)
referenceUnit = 1795
hx.set_reference_unit(referenceUnit)

# On réinitialise les données précédentes
hx.reset()

# On tare la balance
hx.tare()

# On affiche que le tare est terminé et qu'on peut mettre des poids sur la balance
print("Tare effectué. Ajoutez des poids")

# Boucle infinie pour lire en boucle ce que la balance récupère comme informations
while True:
  try:
    val = hx.get_weight(5) # On récupère les données venant du channel utilisé
    print(val) # On affiche ce qui est récupéré

    hx.power_down() # Met le module en "Low Power Mode"
    hx.power_up() # Met le module en "High Power Mode"
    time.sleep(0.1) # Attente de 0.1 seconde avant de recommencer

    SauvPoids.connexion() # Ici on appel la fonction "connexion" du fichier "SauvPoids.py"
  
  except(KeyInterrupt, SystemExit):
    cleanAndExit() # Appel de la fonction pour sortir du programmme
