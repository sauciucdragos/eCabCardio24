CREATE TABLE `user` (
  `user_id` INT PRIMARY KEY AUTO_INCREMENT,
  `username` VARCHAR(100) UNIQUE,
  `password` VARCHAR(250),
  `lastName` VARCHAR(100),
  `firstName` VARCHAR(100),
  `email` VARCHAR(100) UNIQUE,
  `phoneNumber` VARCHAR(15)
);

CREATE TABLE `county` (
  `county_id` INT PRIMARY KEY AUTO_INCREMENT,
  `county` VARCHAR(50)
);

CREATE TABLE `city` (
  `city_id` INT PRIMARY KEY AUTO_INCREMENT,
  `city` VARCHAR(100),
  `county_id` INT,
  FOREIGN KEY (`county_id`) REFERENCES `county`(`county_id`)
);

CREATE TABLE `patient` (
  `patient_id` INT PRIMARY KEY AUTO_INCREMENT,
  `firstName` VARCHAR(100),
  `lastName` VARCHAR(100),
  `dateOfBirth` DATE,
  `county_id` INT,
  `city_id` INT,
  `address` VARCHAR(250),
  `occupation` VARCHAR(100),
  `workplace` VARCHAR(100),
  `phoneNumber` VARCHAR(15) NOT NULL,
  `email` VARCHAR(100),
  `CNP` VARCHAR(20) UNIQUE NOT NULL,
  `maritalStatus` VARCHAR(50),
  FOREIGN KEY (`county_id`) REFERENCES `county`(`county_id`),
  FOREIGN KEY (`city_id`) REFERENCES `city`(`city_id`)
);

CREATE TABLE `consultationSheet` (
  `consultationSheet_id` INT PRIMARY KEY AUTO_INCREMENT,
  `antecedentePersonaleFiziologice` TEXT,
  `antecedentePersonalePatologice` TEXT,
  `antecedenteHeredoColaterale` TEXT,
  `conditiiDeMediu` TEXT,
  `stareaPrezenta` TEXT,
  `aparatCirculator` TEXT,
  `exameneLocaleSiComplementare` TEXT,
  `antecedentePersonale` TEXT,
  `motiveleConsultului` TEXT,
  `observatii` TEXT,
  `diagnostic` TEXT NOT NULL,
  `recomandari` TEXT,
  `tratament` TEXT NOT NULL,
  `patient_id` INT,
  `user_id` INT,
  `consultationDate` DATE,
  FOREIGN KEY (`patient_id`) REFERENCES `patient`(`patient_id`),
  FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`)
);

CREATE TABLE `examinare` (
  `examinare_id` INT PRIMARY KEY AUTO_INCREMENT,
  `price` DECIMAL(10,2),
  `descriereExaminare` VARCHAR(250)
);

CREATE TABLE `examinare_consultationSheet` (
  `examinare_consultationSheet_id` INT PRIMARY KEY AUTO_INCREMENT,
  `examinare_id` INT,
  `consultationSheet_id` INT,
  FOREIGN KEY (`examinare_id`) REFERENCES `examinare`(`examinare_id`),
  FOREIGN KEY (`consultationSheet_id`) REFERENCES `consultationSheet`(`consultationSheet_id`)
);

CREATE TABLE `invoice` (
  `invoice_id` INT PRIMARY KEY AUTO_INCREMENT,
  `consultationSheet_id` INT,
  `total` DECIMAL(10,2),
  `invoiceDate` DATE,
  FOREIGN KEY (`consultationSheet_id`) REFERENCES `consultationSheet`(`consultationSheet_id`)
);

CREATE TABLE `folder` (
  `folder_id` INT PRIMARY KEY AUTO_INCREMENT,
  `folder` VARCHAR(100),
  `path` VARCHAR(250),
  `examinare_id` INT,
  FOREIGN KEY (`examinare_id`) REFERENCES `examinare`(`examinare_id`)
);
