-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 02, 2022 at 04:32 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `WebAcronyms`
--

-- --------------------------------------------------------

--
-- Table structure for table `Definitions`
--

CREATE TABLE `Definitions` (
  `id_acro` int(11) NOT NULL,
  `es_Definition` varchar(300) NOT NULL,
  `en_Definition` varchar(300) NOT NULL,
  `Acronym` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Definitions`
--

INSERT INTO `Definitions` (`id_acro`, `es_Definition`, `en_Definition`, `Acronym`) VALUES
(1, 'La IP es el protocolo que identifica un dispositivo dentro de una red.', 'IP protocol identifies devices inside networks', 'IP'),
(2, 'LAN o Red De Área Local es el nombre que se les da a las redes pequeñas.', 'LAN or Local Area Network is the name given to small networks.', 'LAN'),
(3, 'La red de área amplia o WAN conecta redes más pequeñas creando una red mucho más grande que puede llegar a conectar paises o continentes.', 'A wide area network or LAN connects smaller networks to create a huge one that can communicate countries or even continents.', 'WAN'),
(4, 'WLAN es una red de área local pero con la ventaja de ser inalámbrica.', 'WLAN is a local area network but with the advantage of being wireless.', 'WLAN'),
(5, 'Una red de área metropolitana o MAN es una red que conecta un municipio o varios entre sí.', 'A metropolitan area network or MAN is a network that connects a city or groups of cities.', 'MAN'),
(6, 'El protocolo de transmisión de archivos envía un archivo de un dispositivo a otro.', 'The File transmission protocol is in charge of sending files from a device to another.', 'FTP'),
(7, 'El protocolo de transferencia de hipertextos es un protocolo diseñado para le envío de paquetes de texto como HTML o CSS.', 'The hyper text transfer protocol is a protocol designed to send text packages for example HTML or CSS.', 'HTTP'),
(8, 'El protocolo ICMP se encarga de enviar mensajes de error relacionados con el protocolo IP.', 'The ICMP protocol is in charge of sending error messages that are related to the IP protocol.', 'ICMP'),
(9, 'Una red PAN o red de área personal es una red muy pequeña que conecta dispositivos cercanos al punto de acceso, esta hecha para el uso personal.', 'A PAN or personal area network is a very small network that connects devices close to the access point, is ment for personal use only.', 'PAN'),
(10, 'Red dedicada al almacenamiento de archivos.', 'Network reserved to file storage.', 'SAN'),
(11, 'Sistema de tunelado / red virtual que permite a un dispositivo conectarse a una red a la que por distancia o geografía no debería poder conectarse.', 'Tunneling system / virtual red that allows a device to connect to a network that is far from it.', 'VPN'),
(12, 'El modelo de interconexión de sistemas abiertos u OSI se representa como una pirámide y describe los niveles donde actúan los protocolos de red.', 'The Open Systems Interconnection model or OSI is pictured as as a pyramid and describes the different levels where protocols operate.', 'OSI'),
(13, 'El protocolo Quic es como el protocolo UDP, pero más seguro, es una versión mejorada creada y utilizada por Google.\r\n', 'The Quic protocol is the same as the UDP protocol, but more secure, is a upgraded version created and used by Google.', 'QUIC'),
(14, 'El protocolo de datagramas de usuario es un protocolo de envío de datos rápido, pero que no se asegura de su llegada. Es decir, no es seguro.', 'The user datagram protocol is in charge of fast sending data, but it doesn\'t ensure the arrival of the packages. So it can not be considered secure.', 'UDP'),
(15, 'El protocolo de control de transmisión o TCP es un protocolo de transporte más lento que el protocolo UDP, pero más seguro, ya que se asegura de que los datos lleguen a su destinatario.', 'The transmission control protocol or TCP is a slower transport protocol than UDP, but is safer, as it ensures data arrives to the desired destination.', 'TCP'),
(16, 'Es una versión actualizada del modelo OSI, se distinguen menos niveles diferenciados y algunos cambios.', 'It is an updated version of the OSI model, with fewer differentiated levels and some changes.', 'TCP/IP'),
(17, 'El sistema de nombre de dominio es donde se almacenan el nombre del dominio de una página y su IP.', 'The domain name server is where the domain name of a page is saved with its related IP.', 'DNS'),
(18, 'Es un protocolo y el nombre del programa que lo implementa cuya función es conectar un dispositivo a un servidor remoto de forma segura y donde la información está cifrada.', 'It is a protocol and the name of the program that implements it whose function is to connect a device to a remote server in a secure way and where the information is encrypted.', 'SSH');

-- --------------------------------------------------------

--
-- Table structure for table `ProgramText`
--

CREATE TABLE `ProgramText` (
  `id_phrase` int(3) NOT NULL,
  `es_phrase` varchar(1024) NOT NULL,
  `en_phrase` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ProgramText`
--

INSERT INTO `ProgramText` (`id_phrase`, `es_phrase`, `en_phrase`) VALUES
(1, 'Opción no válida.', 'Invalid option.'),
(3, 'Las opciones deben ser numéricas.', 'Options must be numeric.'),
(4, 'Definición:', 'Definition:'),
(5, 'Introduce el acronimo correspondiente: ', 'Enter the corresponding acronym: '),
(6, 'Debe ser un acrónimo.', 'Must be an acronym.'),
(20, 'Consigue una definición de:', 'Get a definition of:'),
(21, 'Seleciona una opcion: ', 'Select an option: '),
(70, 'Felicidades, respondiste correctamente. ', 'Congratulations, you responded correctly.'),
(71, 'Deseas continuar? (N/S): ', 'Do you wish to continue? (N/Y): '),
(80, 'Selecciona una opción:', 'Select an option from:'),
(81, '1-Definiciones', '1-Definitions'),
(82, '2-Juego', '2-Game '),
(83, 'Otro-Salir', 'Other-Exit'),
(84, 'Tu respuesta: ', 'Your response: ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Definitions`
--
ALTER TABLE `Definitions`
  ADD PRIMARY KEY (`id_acro`);

--
-- Indexes for table `ProgramText`
--
ALTER TABLE `ProgramText`
  ADD PRIMARY KEY (`id_phrase`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Definitions`
--
ALTER TABLE `Definitions`
  MODIFY `id_acro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ProgramText`
--
ALTER TABLE `ProgramText`
  MODIFY `id_phrase` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
