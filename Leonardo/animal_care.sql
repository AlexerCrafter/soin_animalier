-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2024 at 12:43 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `animal_care`
--

-- --------------------------------------------------------

--
-- Table structure for table `animals`
--

CREATE TABLE `animals` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `species` varchar(50) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `threshold_weight` float DEFAULT NULL,
  `threshold_meal_frequency` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `animals`
--

INSERT INTO `animals` (`id`, `user_id`, `name`, `species`, `age`, `weight`, `photo`, `threshold_weight`, `threshold_meal_frequency`) VALUES
(39, 5, 'dogo', 'dog', 3, 1.4, '0', 1.5, 13);

-- --------------------------------------------------------

--
-- Table structure for table `suivi`
--

CREATE TABLE `suivi` (
  `Id_Suivi` int(11) NOT NULL,
  `Id_Animal` int(11) DEFAULT NULL,
  `Nom` varchar(50) NOT NULL,
  `Espece` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  `Poids_Actu` int(11) NOT NULL,
  `Poids_Pese` int(11) NOT NULL,
  `Type_Alimentation` varchar(30) NOT NULL,
  `Quantite` int(11) NOT NULL,
  `Traitement_actu` varchar(100) DEFAULT NULL,
  `Diff_Poids` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suivi`
--

INSERT INTO `suivi` (`Id_Suivi`, `Id_Animal`, `Nom`, `Espece`, `Date`, `Poids_Actu`, `Poids_Pese`, `Type_Alimentation`, `Quantite`, `Traitement_actu`, `Diff_Poids`) VALUES
(1, NULL, 'dogo', 'dog', '2024-05-07', 7, 10, 'stricte', 7, '1', 5),
(2, NULL, 'h', 'dog', '2024-05-16', 11, 6, 'normal', 3, 'b', 2);

-- --------------------------------------------------------

--
-- Table structure for table `treatments`
--

CREATE TABLE `treatments` (
  `id` int(11) NOT NULL,
  `animal_id` int(11) DEFAULT NULL,
  `treatment_date` datetime DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(3, 'leo', '$2y$10$0orcmWRjg9iSDsh8DossZezIbgvWr/diBuLLsnWGhI96Qt4ZnuqVm'),
(5, 'leo2', '$2y$10$S4ZRocn0k4l2YuzvWO1PcutCnMDBMNzqbY4l39fwSJlhT0nkXj7Gm'),
(6, 'veterinaire', '$2y$10$uLwxkjDAU3fY.GbltbpqEOlcjMi6Y8BL2cPt/CiBh1fESxgug9SUe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `animals`
--
ALTER TABLE `animals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `suivi`
--
ALTER TABLE `suivi`
  ADD PRIMARY KEY (`Id_Suivi`);

--
-- Indexes for table `treatments`
--
ALTER TABLE `treatments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `animal_id` (`animal_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `animals`
--
ALTER TABLE `animals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `suivi`
--
ALTER TABLE `suivi`
  MODIFY `Id_Suivi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `treatments`
--
ALTER TABLE `treatments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `animals`
--
ALTER TABLE `animals`
  ADD CONSTRAINT `animals_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `treatments`
--
ALTER TABLE `treatments`
  ADD CONSTRAINT `treatments_ibfk_1` FOREIGN KEY (`animal_id`) REFERENCES `animals` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
