
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2025 at 04:18 AM
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
-- Database: `proyecto_sena`
--

-- --------------------------------------------------------

--
-- Table structure for table `asignacion`
--

CREATE TABLE `asignacion` (
  `Id_asignacion` int(11) NOT NULL,
  `Id_reporte_asignacion` int(11) DEFAULT NULL,
  `Id_tecnico_asignacion` int(11) DEFAULT NULL,
  `Fecha_asignacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `Id_categoria` int(11) NOT NULL,
  `Nombre_categoria` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `departamento`
--

CREATE TABLE `departamento` (
  `Id_departamento` int(11) NOT NULL,
  `Nombre_departamento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estado_reporte`
--

CREATE TABLE `estado_reporte` (
  `Id_estado` int(11) NOT NULL,
  `Descripcion_estado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `historial`
--

CREATE TABLE `historial` (
  `Id_historial` int(11) NOT NULL,
  `Id_reporte_historial` int(11) DEFAULT NULL,
  `Estado_anterior` varchar(100) DEFAULT NULL,
  `Estado_nuevo` varchar(100) DEFAULT NULL,
  `Fecha_cambio` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notificacion`
--

CREATE TABLE `notificacion` (
  `Id_notificacion` int(11) NOT NULL,
  `Id_reporte_notificacion` int(11) DEFAULT NULL,
  `Id_usuario_notificacion` int(11) DEFAULT NULL,
  `Mensaje_notificacion` text NOT NULL,
  `Fecha_Notificacion` datetime DEFAULT current_timestamp(),
  `EstadoLeido_notificacion` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prioridad_reporte`
--

CREATE TABLE `prioridad_reporte` (
  `Id_prioridad` int(11) NOT NULL,
  `Descripcion_prioridad` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reporte`
--

CREATE TABLE `reporte` (
  `Id_reporte` int(11) NOT NULL,
  `Id_usuario_reporte` int(11) DEFAULT NULL,
  `Id_categoria_reporte` int(11) DEFAULT NULL,
  `Id_prioridad_reporte` int(11) DEFAULT NULL,
  `Id_estado_reporte` int(11) DEFAULT NULL,
  `Id_ubicacion_reporte` int(11) DEFAULT NULL,
  `Id_notificacion_reporte` int(11) DEFAULT NULL,
  `Id_asignacion_reporte` int(11) DEFAULT NULL,
  `Descripcion_reporte` text NOT NULL,
  `Fechacreacion_reporte` datetime DEFAULT current_timestamp(),
  `Fechacierre_reporte` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tecnico`
--

CREATE TABLE `tecnico` (
  `Id_tecnico` int(11) NOT NULL,
  `Nombres_Tecnico` varchar(100) NOT NULL,
  `Apellidos_Tecnico` varchar(100) NOT NULL,
  `Id_tipodocumento_Tecnico` int(11) DEFAULT NULL,
  `Numerodocumento_Tecnico` varchar(50) NOT NULL,
  `Correo_Tecnico` varchar(100) NOT NULL,
  `Id_departamento_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `Id_tipoDocumento` int(11) NOT NULL,
  `Descripcion_documento` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ubicacion`
--

CREATE TABLE `ubicacion` (
  `Id_ubicacion` int(11) NOT NULL,
  `Descripcion_ubicacion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `Id_usuario` int(11) NOT NULL,
  `Nombres_usuario` varchar(100) NOT NULL,
  `Apellidos_usuario` varchar(100) NOT NULL,
  `Id_tipodocumento_usuario` int(11) DEFAULT NULL,
  `Numerodocumento_usuario` varchar(50) NOT NULL,
  `Correo_usuario` varchar(100) NOT NULL,
  `Numerodereportes_usuario` int(11) DEFAULT NULL,
  `clave_usuario` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asignacion`
--
ALTER TABLE `asignacion`
  ADD PRIMARY KEY (`Id_asignacion`),
  ADD KEY `FK_Id_reporte_asignacion` (`Id_reporte_asignacion`),
  ADD KEY `FK_Id_tecnico_asignacion` (`Id_tecnico_asignacion`);

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`Id_categoria`);

--
-- Indexes for table `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`Id_departamento`);

--
-- Indexes for table `estado_reporte`
--
ALTER TABLE `estado_reporte`
  ADD PRIMARY KEY (`Id_estado`);

--
-- Indexes for table `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`Id_historial`),
  ADD KEY `FK_Id_reporte_historial` (`Id_reporte_historial`);

--
-- Indexes for table `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`Id_notificacion`),
  ADD KEY `FK_Id_reporte_notificacion` (`Id_reporte_notificacion`),
  ADD KEY `FK_Id_usuario_notificacion` (`Id_usuario_notificacion`);

--
-- Indexes for table `prioridad_reporte`
--
ALTER TABLE `prioridad_reporte`
  ADD PRIMARY KEY (`Id_prioridad`);

--
-- Indexes for table `reporte`
--
ALTER TABLE `reporte`
  ADD PRIMARY KEY (`Id_reporte`),
  ADD KEY `FK_Id_usuario_reporte` (`Id_usuario_reporte`),
  ADD KEY `FK_Id_categoria_reporte` (`Id_categoria_reporte`),
  ADD KEY `FK_Id_prioridad_reporte` (`Id_prioridad_reporte`),
  ADD KEY `FK_Id_estado_reporte` (`Id_estado_reporte`),
  ADD KEY `FK_Id_ubicacion_reporte` (`Id_ubicacion_reporte`),
  ADD KEY `FK_Id_notificacion_reporte` (`Id_notificacion_reporte`),
  ADD KEY `FK_Id_asignacion_reporte` (`Id_asignacion_reporte`);

--
-- Indexes for table `tecnico`
--
ALTER TABLE `tecnico`
  ADD PRIMARY KEY (`Id_tecnico`),
  ADD KEY `FK_Id_tipodocumento_tecnico` (`Id_tipodocumento_Tecnico`),
  ADD KEY `FK_Id_departamento_usuario` (`Id_departamento_usuario`);

--
-- Indexes for table `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`Id_tipoDocumento`);

--
-- Indexes for table `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`Id_ubicacion`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_usuario`),
  ADD KEY `Id_tipodocumento_usuario` (`Id_tipodocumento_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asignacion`
--
ALTER TABLE `asignacion`
  MODIFY `Id_asignacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `Id_categoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departamento`
--
ALTER TABLE `departamento`
  MODIFY `Id_departamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estado_reporte`
--
ALTER TABLE `estado_reporte`
  MODIFY `Id_estado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `historial`
--
ALTER TABLE `historial`
  MODIFY `Id_historial` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `Id_notificacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prioridad_reporte`
--
ALTER TABLE `prioridad_reporte`
  MODIFY `Id_prioridad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reporte`
--
ALTER TABLE `reporte`
  MODIFY `Id_reporte` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tecnico`
--
ALTER TABLE `tecnico`
  MODIFY `Id_tecnico` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `Id_tipoDocumento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `Id_ubicacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `asignacion`
--
ALTER TABLE `asignacion`
  ADD CONSTRAINT `FK_Id_reporte_asignacion` FOREIGN KEY (`Id_reporte_asignacion`) REFERENCES `reporte` (`Id_reporte`),
  ADD CONSTRAINT `FK_Id_tecnico_asignacion` FOREIGN KEY (`Id_tecnico_asignacion`) REFERENCES `tecnico` (`Id_tecnico`),
  ADD CONSTRAINT `asignacion_ibfk_1` FOREIGN KEY (`Id_reporte_asignacion`) REFERENCES `reporte` (`Id_reporte`),
  ADD CONSTRAINT `asignacion_ibfk_2` FOREIGN KEY (`Id_tecnico_asignacion`) REFERENCES `tecnico` (`Id_tecnico`);

--
-- Constraints for table `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `FK_Id_reporte_historial` FOREIGN KEY (`Id_reporte_historial`) REFERENCES `reporte` (`Id_reporte`),
  ADD CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`Id_reporte_historial`) REFERENCES `reporte` (`Id_reporte`);

--
-- Constraints for table `notificacion`
--
ALTER TABLE `notificacion`
  ADD CONSTRAINT `FK_Id_reporte_notificacion` FOREIGN KEY (`Id_reporte_notificacion`) REFERENCES `reporte` (`Id_reporte`),
  ADD CONSTRAINT `FK_Id_usuario_notificacion` FOREIGN KEY (`Id_usuario_notificacion`) REFERENCES `usuario` (`Id_usuario`),
  ADD CONSTRAINT `notificacion_ibfk_1` FOREIGN KEY (`Id_reporte_notificacion`) REFERENCES `reporte` (`Id_reporte`),
  ADD CONSTRAINT `notificacion_ibfk_2` FOREIGN KEY (`Id_usuario_notificacion`) REFERENCES `usuario` (`Id_usuario`);

--
-- Constraints for table `reporte`
--
ALTER TABLE `reporte`
  ADD CONSTRAINT `FK_Id_asignacion_reporte` FOREIGN KEY (`Id_asignacion_reporte`) REFERENCES `asignacion` (`Id_asignacion`),
  ADD CONSTRAINT `FK_Id_categoria_reporte` FOREIGN KEY (`Id_categoria_reporte`) REFERENCES `categoria` (`Id_categoria`),
  ADD CONSTRAINT `FK_Id_estado_reporte` FOREIGN KEY (`Id_estado_reporte`) REFERENCES `estado_reporte` (`Id_estado`),
  ADD CONSTRAINT `FK_Id_notificacion_reporte` FOREIGN KEY (`Id_notificacion_reporte`) REFERENCES `notificacion` (`Id_notificacion`),
  ADD CONSTRAINT `FK_Id_prioridad_reporte` FOREIGN KEY (`Id_prioridad_reporte`) REFERENCES `prioridad_reporte` (`Id_prioridad`),
  ADD CONSTRAINT `FK_Id_ubicacion_reporte` FOREIGN KEY (`Id_ubicacion_reporte`) REFERENCES `ubicacion` (`Id_ubicacion`),
  ADD CONSTRAINT `FK_Id_usuario_reporte` FOREIGN KEY (`Id_usuario_reporte`) REFERENCES `usuario` (`Id_usuario`),
  ADD CONSTRAINT `reporte_ibfk_1` FOREIGN KEY (`Id_usuario_reporte`) REFERENCES `usuario` (`Id_usuario`),
  ADD CONSTRAINT `reporte_ibfk_2` FOREIGN KEY (`Id_categoria_reporte`) REFERENCES `categoria` (`Id_categoria`),
  ADD CONSTRAINT `reporte_ibfk_3` FOREIGN KEY (`Id_prioridad_reporte`) REFERENCES `prioridad_reporte` (`Id_prioridad`),
  ADD CONSTRAINT `reporte_ibfk_4` FOREIGN KEY (`Id_estado_reporte`) REFERENCES `estado_reporte` (`Id_estado`),
  ADD CONSTRAINT `reporte_ibfk_5` FOREIGN KEY (`Id_ubicacion_reporte`) REFERENCES `ubicacion` (`Id_ubicacion`);

--
-- Constraints for table `tecnico`
--
ALTER TABLE `tecnico`
  ADD CONSTRAINT `FK_Id_departamento_usuario` FOREIGN KEY (`Id_departamento_usuario`) REFERENCES `departamento` (`Id_departamento`),
  ADD CONSTRAINT `FK_Id_tipodocumento_tecnico` FOREIGN KEY (`Id_tipodocumento_Tecnico`) REFERENCES `tipo_documento` (`Id_tipoDocumento`),
  ADD CONSTRAINT `tecnico_ibfk_1` FOREIGN KEY (`Id_tipodocumento_Tecnico`) REFERENCES `tipo_documento` (`Id_tipoDocumento`),
  ADD CONSTRAINT `tecnico_ibfk_2` FOREIGN KEY (`Id_departamento_usuario`) REFERENCES `departamento` (`Id_departamento`);

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`Id_tipodocumento_usuario`) REFERENCES `tipo_documento` (`Id_tipoDocumento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;