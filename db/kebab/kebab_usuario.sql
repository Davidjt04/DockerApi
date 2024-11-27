-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: kebab
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `foto` longtext NOT NULL,
  `contrasenia` varchar(45) NOT NULL,
  `direccion` varchar(80) NOT NULL,
  `monedero` int NOT NULL,
  `tlf` varchar(9) NOT NULL,
  `carrito` json DEFAULT NULL,
  `ubicacion` varchar(45) DEFAULT NULL,
  `correoElectronico` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Juan Pérez','foto.jpg','contrasenia123','Calle Falsa 123',100,'987654321','{\"fecha\": \"2024-11-14\", \"total\": 709.96, \"estado\": \"en proceso\", \"cliente\": {\"correo\": \"ana.garcia@example.com\", \"nombre\": \"Ana García\", \"telefono\": \"123456789\", \"direccion\": \"Avenida Siempre Viva 742, Ciudad, País\"}, \"pedido_id\": 2024, \"productos\": [{\"nombre\": \"Televisor 50 pulgadas\", \"cantidad\": 1, \"producto_id\": 101, \"precio_unitario\": 499.99}, {\"nombre\": \"Soundbar\", \"cantidad\": 1, \"producto_id\": 102, \"precio_unitario\": 129.99}, {\"nombre\": \"Soporte de pared\", \"cantidad\": 2, \"producto_id\": 103, \"precio_unitario\": 39.99}]}','Ciudad, País','juan.perez@example.com');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-26 19:08:26
