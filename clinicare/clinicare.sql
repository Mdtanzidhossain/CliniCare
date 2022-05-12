-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2022 at 07:52 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinicare`
--

-- --------------------------------------------------------

--
-- Table structure for table `appiointment`
--

CREATE TABLE `appiointment` (
  `ticket_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `DOS` date NOT NULL,
  `clinic_id` int(11) DEFAULT NULL,
  `appiointment_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appiointment`
--

INSERT INTO `appiointment` (`ticket_id`, `patient_id`, `doc_id`, `DOS`, `clinic_id`, `appiointment_time`) VALUES
(1, 1, 5, '2021-09-02', 200, '17:00:00'),
(2, 4, 6, '2020-08-04', 203, '10:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `clinic`
--

CREATE TABLE `clinic` (
  `clinic_id` int(11) NOT NULL,
  `branch_name` varchar(30) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clinic`
--

INSERT INTO `clinic` (`clinic_id`, `branch_name`, `location_id`) VALUES
(200, 'SADAR BRANCH', 16),
(202, 'CAMPUS BRANCH', 29),
(203, 'WARI BRANCH', 34),
(212, 'GULSHAN BRANCH', 32),
(310, 'BANDOR BAZAR BRANCH', 10),
(500, 'COLLEGE ROAD BRANCH', 33);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `name` varchar(20) NOT NULL,
  `dept_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`name`, `dept_id`) VALUES
('CARDIOLOGY', 1),
('DERMATOLOGY', 2),
('GYNECOLOGY', 3),
('ORTHOPOLOGY', 4),
('NEUROLOGY', 5),
('ONCOLOGY', 6),
('UROLOGY', 7),
('MEDICINE', 8),
('oncology', 9);

-- --------------------------------------------------------

--
-- Table structure for table `division`
--

CREATE TABLE `division` (
  `name` varchar(20) NOT NULL,
  `division_id` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `division`
--

INSERT INTO `division` (`name`, `division_id`) VALUES
('BARISHAL', 'BAR'),
('chittagong', 'CHI'),
('DHAKA', 'DHA'),
('KHULNA', 'KHU'),
('MYMENSHINGH', 'MYM'),
('RAJSHAHI', 'RAJ'),
('RANGPUR', 'RAN'),
('SYLHET', 'SYL');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `name` varchar(20) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `email` varchar(20) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `qualification` varchar(20) DEFAULT NULL,
  `clinic_id` int(11) DEFAULT NULL,
  `licence_No` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `Ticket_Count_perDay` int(11) DEFAULT NULL,
  `pass` int(11) DEFAULT NULL,
  `shift_name` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`name`, `doc_id`, `email`, `phone`, `qualification`, `clinic_id`, `licence_No`, `dept_id`, `Ticket_Count_perDay`, `pass`, `shift_name`) VALUES
('Faqrul Hasan', 1, 'swawon420@gmail.com', 1758695556, 'FCPS in Oncology', 212, 565654661, 6, NULL, 145655, 'MORNING'),
('Zahirul Kabir', 4, 'zahirulkabir66@gmail', 15566523, 'PHD in Cardiology', 500, 898956445, 1, NULL, 1545652, 'EVENING'),
('Jodu Mia', 5, 'jodumia445@gmail.com', 1866565, 'PHD in Medicine', 500, 898561658, 8, NULL, 8897466, NULL),
('Faria Rahman', 6, 'faria56@gmail.com', 1758694568, 'PHD in Neurology', 202, 2147483647, 5, NULL, 14565585, 'MORNING');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `district` varchar(20) NOT NULL,
  `postalCode` int(11) NOT NULL,
  `street_Address` varchar(30) NOT NULL,
  `house_no` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `division_id` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`district`, `postalCode`, `street_Address`, `house_no`, `location_id`, `division_id`) VALUES
('DHAKA', 1000, 'PALTAN GPO ', 5, 1, 'DHA'),
('DHAKA', 1351, '04', 12, 2, 'DHA'),
('DHAKA', 1206, 'DHAKA CANTONMENT', 50, 3, 'DHA'),
('DHAKA', 1100, '06', 200, 4, 'DHA'),
('CHITTAGONG', 4100, 'BANDOR ROAD', 10, 5, 'CHI'),
('CHIOTTAGONG', 4650, '03', 25, 6, 'CHI'),
('111', 17, '4377', 0, 7, 'CHI'),
('CHIOTTAGONG', 4203, 'CHOWK BAZAR ROAD', 240, 8, 'CHI'),
('SYLHET', 3360, '01', 3, 9, 'SYL'),
('SYLHET', 3310, 'BAZAR ROAD', 118, 10, 'SYL'),
('SYLHET', 3352, '01', 9, 11, 'SYL'),
('SYLHET', 3101, 'CADET COLLEGE ROAD', 96, 12, 'SYL'),
('MYMENSINGH', 2281, 'SHOHAGI STATION', 1, 13, 'MYM'),
('MYMENSINGH', 2202, 'BAU CAMPUS', 13, 14, 'MYM'),
('MYMENSINGH', 2210, '02', 5, 15, 'MYM'),
('MYMENSINGH', 2200, 'SADAR BAZAR', 22, 16, 'MYM'),
('RANGPUR', 5405, 'CARMIECAL COLLEGE ROAD', 9, 17, 'RAN'),
('RANGPUR', 5430, '03', 123, 18, 'RAN'),
('RANGPUR', 5401, 'RANGPUR UP-SHAHAR', 11, 19, 'RAN'),
('NILPHAMARI', 5301, 'SUGARMIL COLONY', 230, 20, 'RAN'),
('RAJSHAHI', 6205, 'UNIVERSITY CAMPUS', 9, 21, 'RAJ'),
('RAJSHAHI', 6202, 'RAJSHAHI CANTONMENT', 186, 22, 'RAJ'),
('PABNA', 6602, 'MERIL ROAD', 7, 23, 'RAJ'),
('SIRAJGONG', 6780, '03', 22, 24, 'RAJ'),
('BARISHAL', 8215, 'NIZAMUDDIN COLLEGE ROAD', 1, 25, 'BAR'),
('BARISHAL', 8200, 'BARISHAL SADAR', 99, 26, 'BAR'),
('PIJOJPUR', 8565, 'NATUN HATT', 9, 27, 'BAR'),
('KHULNA', 9207, 'ATRA SHILPO AREA', 220, 28, 'KHU'),
('KHULNA', 9208, 'UNIVERSITY CAMPUS', 1, 29, 'KHU'),
('KHUSTIA', 7030, 'MIRPUR BAZAR', 5, 30, 'KHU'),
('DHAKA', 1222, '07', 2, 31, 'DHA'),
('DHAKA', 1212, 'GULSHAN AVENUE', 7, 32, 'DHA'),
('CUMILLA', 3500, 'VICTORIA COLLEGE ROAD', 2, 33, 'CHI'),
('DHAKA', 1203, 'RANKIN STREET', 8, 34, 'DHA'),
('DINAJPUR', 5202, 'DINAJPUR SADAR SAROK', 3, 35, 'RAN'),
('dhaka', 1000, 'paltangpo', 77, 37, 'DHA'),
('dhaka', 1216, '512', 3, 38, 'DHA');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `first_name` varchar(20) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `DOB` date NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(25) NOT NULL,
  `NID_Birth_certific` bigint(20) DEFAULT NULL,
  `pasword` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `prescription_upload` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`first_name`, `patient_id`, `DOB`, `last_name`, `phone`, `email`, `NID_Birth_certific`, `pasword`, `location_id`, `prescription_upload`) VALUES
('Shawon', 1, '1999-10-20', 'Islam', 14563258, 'swawonislam20@gmail.com', 5448829825971445, 12525545, 34, ''),
('Taqnzid', 2, '1992-12-25', 'Hossain', 13565652, 'tanqidi223@gmail.com', 5448829825646543, 1545121, 28, ''),
('Kodu', 3, '1995-11-01', 'Mia', 175869565, 'kodumia566@gmail.com', 454485645656545451, 12555566, 26, ''),
('Pori', 4, '1992-02-12', 'Moni', 1758656561, 'pori.moni420@gmail.com', 1988882982546451121, 420420, 33, ''),
('Sabnam ', 5, '1989-11-25', 'Moni', 1858566565, 'sobnom420@yahoo.com', 46528298595323, 12588998, 20, ''),
('ammar', 6, '1999-01-01', 'ahmed', 164164, 'ammar@gmail.com', 1564564, 1266, NULL, ''),
('hello', 7, '1908-01-01', 'world', 1858585, 'hello@gmail.com', 156565, 65656, NULL, ''),
('tanzid', 8, '1999-01-01', 'Hossain', 1959608444, 'tanzid.hossain00@gmail.co', 5894671335, 1234, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `shift`
--

CREATE TABLE `shift` (
  `shift_name` varchar(8) NOT NULL,
  `clinic_id` int(11) NOT NULL,
  `doc_id` int(11) NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shift`
--

INSERT INTO `shift` (`shift_name`, `clinic_id`, `doc_id`, `start_time`, `end_time`, `ticket_id`) VALUES
('EVENING', 212, 4, '16:00:00', '22:00:00', 2),
('MORNING', 212, 5, '09:00:00', '14:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_Name` varchar(20) NOT NULL,
  `staff_id` varchar(11) NOT NULL,
  `NID` bigint(20) NOT NULL,
  `clinic_id` int(11) NOT NULL,
  `password` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_Name`, `staff_id`, `NID`, `clinic_id`, `password`) VALUES
('Nipa Shaha', 'D12', 4405307131, 202, 536221),
('Zidan Gomej', 'L03', 4403116071, 500, 431235),
('Novia Khan', 'N03', 3302114041, 200, 76352),
('Sonia Islam', 'N05', 4600133575, 212, 12345),
('Tamim Khan', 'N52', 5500333511, 310, 46352);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appiointment`
--
ALTER TABLE `appiointment`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doc_id` (`doc_id`),
  ADD KEY `clinic_id` (`clinic_id`);

--
-- Indexes for table `clinic`
--
ALTER TABLE `clinic`
  ADD PRIMARY KEY (`clinic_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `division`
--
ALTER TABLE `division`
  ADD PRIMARY KEY (`division_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doc_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `licence_No` (`licence_No`),
  ADD KEY `clinic_id` (`clinic_id`),
  ADD KEY `dept_id` (`dept_id`),
  ADD KEY `shift_name` (`shift_name`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `division_id` (`division_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `NID_Birth_certific` (`NID_Birth_certific`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `shift`
--
ALTER TABLE `shift`
  ADD PRIMARY KEY (`shift_name`),
  ADD KEY `clinic_id` (`clinic_id`),
  ADD KEY `doc_id` (`doc_id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `NID` (`NID`),
  ADD KEY `clinic_id` (`clinic_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appiointment`
--
ALTER TABLE `appiointment`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appiointment`
--
ALTER TABLE `appiointment`
  ADD CONSTRAINT `appiointment_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`),
  ADD CONSTRAINT `appiointment_ibfk_2` FOREIGN KEY (`doc_id`) REFERENCES `doctor` (`doc_id`),
  ADD CONSTRAINT `appiointment_ibfk_3` FOREIGN KEY (`clinic_id`) REFERENCES `clinic` (`clinic_id`);

--
-- Constraints for table `clinic`
--
ALTER TABLE `clinic`
  ADD CONSTRAINT `clinic_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`);

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`clinic_id`) REFERENCES `clinic` (`clinic_id`),
  ADD CONSTRAINT `doctor_ibfk_2` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`),
  ADD CONSTRAINT `doctor_ibfk_3` FOREIGN KEY (`shift_name`) REFERENCES `shift` (`shift_name`);

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`division_id`) REFERENCES `division` (`division_id`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`);

--
-- Constraints for table `shift`
--
ALTER TABLE `shift`
  ADD CONSTRAINT `shift_ibfk_1` FOREIGN KEY (`clinic_id`) REFERENCES `clinic` (`clinic_id`),
  ADD CONSTRAINT `shift_ibfk_2` FOREIGN KEY (`doc_id`) REFERENCES `doctor` (`doc_id`),
  ADD CONSTRAINT `shift_ibfk_3` FOREIGN KEY (`ticket_id`) REFERENCES `appiointment` (`ticket_id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`clinic_id`) REFERENCES `clinic` (`clinic_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
