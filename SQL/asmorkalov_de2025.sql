CREATE DATABASE IF NOT EXISTS `asmorkalov_de2025` DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
USE asmorkalov_de2025;

CREATE TABLE `Floor` (
`FloorId` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
`Title` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `Category` (
`CategoryId` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
`Title` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `Status` (
`StatusId` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
`Title` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `Room` (
`RoomId` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
`FloorId` int(11) DEFAULT NULL,
`Number` int(11) DEFAULT NULL,
`CategoryId` int(11) DEFAULT NULL,
`StatusId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `Guest` (
`GuestId` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
`LastName` varchar(50) DEFAULT NULL,
`FirstName` varchar(50) DEFAULT NULL,
`MiddleName` varchar(50) DEFAULT NULL,
`RoomId` int(11) DEFAULT NULL,
`EnterData` varchar(50) DEFAULT NULL,
`ExitData` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `Role`(
`RoleId` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
`Title` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `User` (
`UserId` int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
`Login` varchar(50) DEFAULT NULL,
`Password` varchar(50) DEFAULT NULL,
`RoleId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Ограничения внешнего ключа
 
ALTER TABLE `Room`
  ADD FOREIGN KEY (`FloorId`) REFERENCES `Floor` (`FloorId`),
  ADD FOREIGN KEY (`CategoryId`) REFERENCES `Category` (`CategoryId`),
  ADD FOREIGN KEY (`StatusId`) REFERENCES `Status` (`StatusId`);
  
ALTER TABLE `Guest`
  ADD FOREIGN KEY (`RoomId`) REFERENCES `Room` (`RoomId`);
  
ALTER TABLE `User`
  ADD FOREIGN KEY (`RoleId`) REFERENCES `Role` (`RoleId`);