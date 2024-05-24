# Projet : Suivi vétérinaire d’animaux domestiques

## I) Présentation du projet
* Le groupement des vétérinaires de la ville d’Argenteuil souhaite mettre en place une solution de suivi animalier pour les animaux domestiques qu’ils accueillent.
* En effet, les animaux qui arrivent à la clinique vétérinaire sont là pour des soins. Les vétérinaires souhaitent donc avoir une application qui leur permette
  à la fois d’avoir un suivi médical des animaux, mais aussi, pour ceux qui sont hébergés quelques temps après une intervention, un suivi de la fréquence et de la quantité d’alimentation.
* Pour que chaque animal puisse avoir sa propre gamelle de nourriture et que l’on puisse ainsi contrôler la fréquence de prise de nourriture, la gamelle devra s’ouvrir lors de la détection
  d’une puce rfid présente sur l’animal. Un paramétrage pourra être effectué en amont par le vétérinaire, pour éviter que l’animal ne prenne trop de repas.
* Pour que l’on puisse suivre l’évolution du poids de chaque animal, une balance connectée permettra de peser l’animal et de garder une trace pour pouvoir exploiter les données sous forme de courbes.
* Enfin pour permettre aux vétérinaires de suivre plus facilement tous les animaux, l’application devra être accessible via une interface web ou par une application mobile.
* La solution devra également intégrer une alerte pour la prise des traitements des animaux.
* Chaque fiche d’animaux inclura une photo pour reconnaitre l’animal. Pour un accès plus facile à la fiche de l’animal, l’application mobile sera en mesure de lire un QR code.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## II) Expression du besoin
* Le système devra répondre aux besoins suivants :
* Paramétrage des différents seuils (quantité maximale de repas possible).
* Prise en photo des animaux pour la création de fiches de suivi.
* Contrôle de la fréquence et de la quantité des repas, et suivi de l’évolution du poids de l’animal.
* Paramétrage des gamelles en fonction des puces rfid pour permettre à chaque animal d’avoir la sienne.
* L’ensemble des opérations de visualisation et de paramétrage devront être possible à l’aide d’un site Web dédié.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## III) Cahier des charges
* Le système sera constitué de :
    * Gamelles à ouverture automatique déclenchées par une puce RFID.
    * Balance connectée permettant de remonter les mesures vers un système centralisé.
    * Une caméra permettant de prendre en photo les animaux lors de la création de la fiche.
    * L’utilisation de la caméra du smartphone pour scanner le QR Code permettant l’accès rapide à la fiche de l’animal.
* Toutes les données seront stockées sur une base de données et seront accessible aussi bien via l’interface web que par l’application mobile.
* L’application disponible via l’interface web ou l’application mobile doit permettre :
    * De créer une fiche pour chaque animal avec la possibilité de prise de photo.
    * De fixer des seuils pour la fréquence des repas.
    * D’afficher le suivi de la fréquence et de la quantité (poids de nourriture mangé) des repas.
    * D’afficher le suivi du poids sous forme de courbes.
    * D’afficher le suivi médical (traitements déjà pris, allergies connues, vaccins reçus, …).
    * D’alerter pour la prise de traitements.
    * Pour l’application mobile, la possibilité de lire un QRCode pour accéder rapidement à la fiche de l’animal.

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Une liste de matériels et de logiciels nous sont mis à disposition
### Matériels
* Gamelle à ouverture commandée par RFID
* Badges RFID
* Camera USB
* Balance connectée pour animaux
* Raspberry Pi modèle 3

### Logiciels
* Contrôle du GPIO, SPI, I2C, Liaison Série | Librairie WiringPi : http://wiringpi.com/
* Base de données : [MySQL](https://www.mysql.com/fr)
* Gestion de base de données  [PhpMyAdmin](https://www.phpmyadmin.net/)
* [Dragino](www.dragino.com/downloads/index.php?dir=LoRa_Gateway/) | Le github de [Dragino](https://github.com/dragino/Arduino-Profile-Examples/tree/master/libraries/Dragino/examples)
* Module communicant Grove LoRa 113060006 émetteur/récepteur : [Librairie Arduino](http://wiki.seeedstudio.com/Grove_LoRa_Radio/)
* Module communicant Arduino mkr wan1300 [Librairies MKRWAN](https://www.arduinolibraries.info/libraries/mkrwan)
* Arduino MKR basé sur un TJA1048T/3 [Librairies MKRshield485](https://store.arduino.cc/arduino-genuino/arduino-genuino-mkr-family)
* [Solar Station Monitor](http://www.epsolarpv.com/en/index.php/Technical/download)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

> * Ce projet est réparti et réalisé entre 4 étudiants : __Alberto__, __Alexis__, __Marwan__ et __Leonardo__ qui auront tous différentes tâches.
> * Date de début du projet : 26/01/2024
> * Date de rendu du rapport de projet : 20/05/2024
> * Date de fin du projet : 07/06/2024
