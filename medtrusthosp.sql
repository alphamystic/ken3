-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 15, 2025 at 01:24 PM
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
-- Database: `medtrusthosp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` enum('Admin','Manager','Tech Support','Reception','Billing') DEFAULT 'Admin',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `uuid`, `username`, `password_hash`, `email`, `role`, `created_at`) VALUES
(1, '3eb37d55-197b-11f0-9b7a-f0d5bfb97a67', 'admin01', 'ef92b778bafe771e89245b89ecbc08a44a4e166c06659911881f383d4473e94f', 'admin@medtrust.com', 'Admin', '2025-04-15 11:23:50'),
(2, '3eb38a1c-197b-11f0-9b7a-f0d5bfb97a67', 'manager01', '21596fb32a4cf219d6bbc55a27d38e1342edb5e637632a6aa8476a378c241a2f', 'manager@medtrust.com', 'Manager', '2025-04-15 11:23:50'),
(3, '3eb38c46-197b-11f0-9b7a-f0d5bfb97a67', 'reception01', 'ab37dc0945df30fca6395958438b3190e297dfdf89d3479a889db8b91e3491bc', 'reception@medtrust.com', 'Reception', '2025-04-15 11:23:50'),
(4, '3eb38e90-197b-11f0-9b7a-f0d5bfb97a67', 'techsupport', '25673ee9fb540faff19a8d9e91aac0f1a3c4d47796ce9d662a272e4dea6e01f6', 'tech@medtrust.com', 'Tech Support', '2025-04-15 11:23:50'),
(5, '3eb39025-197b-11f0-9b7a-f0d5bfb97a67', 'billing01', 'd0979250c3e6c58287a04f8c58d5dffbff745f4d73199ab89b8910dd3dbff5f4', 'billing@medtrust.com', 'Billing', '2025-04-15 11:23:50');

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `status` enum('Pending','Confirmed','Completed','Cancelled') DEFAULT 'Pending',
  `reason` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `uuid`, `patient_id`, `doctor_id`, `appointment_date`, `appointment_time`, `status`, `reason`, `created_at`) VALUES
(1, '3e822dfa-197b-11f0-9b7a-f0d5bfb97a67', 1, 1, '2025-04-16', '10:30:00', 'Confirmed', 'Routine check-up', '2025-04-15 11:23:49'),
(2, '3e823ed8-197b-11f0-9b7a-f0d5bfb97a67', 2, 2, '2025-04-17', '14:00:00', 'Pending', 'Headache evaluation', '2025-04-15 11:23:49'),
(3, '3e824248-197b-11f0-9b7a-f0d5bfb97a67', 3, 3, '2025-04-18', '11:00:00', 'Confirmed', 'Back pain', '2025-04-15 11:23:49'),
(4, '3e82476d-197b-11f0-9b7a-f0d5bfb97a67', 4, 4, '2025-04-19', '09:00:00', 'Cancelled', 'Child vaccination', '2025-04-15 11:23:49'),
(5, '3e8249d4-197b-11f0-9b7a-f0d5bfb97a67', 5, 5, '2025-04-20', '15:00:00', 'Confirmed', 'Follow-up for cancer treatment', '2025-04-15 11:23:49');

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `payment_method` enum('Cash','Card','Online') DEFAULT NULL,
  `payment_status` enum('Unpaid','Paid','Pending') DEFAULT 'Unpaid',
  `issued_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billing`
--

INSERT INTO `billing` (`id`, `uuid`, `patient_id`, `appointment_id`, `amount`, `payment_method`, `payment_status`, `issued_at`) VALUES
(1, '3e86dcf5-197b-11f0-9b7a-f0d5bfb97a67', 1, 1, '150.00', 'Card', 'Paid', '2025-04-15 11:23:49'),
(2, '3e86eb31-197b-11f0-9b7a-f0d5bfb97a67', 2, 2, '200.00', 'Cash', 'Unpaid', '2025-04-15 11:23:49'),
(3, '3e86eddf-197b-11f0-9b7a-f0d5bfb97a67', 3, 3, '180.00', 'Card', 'Paid', '2025-04-15 11:23:49'),
(4, '3e86f17b-197b-11f0-9b7a-f0d5bfb97a67', 4, 4, '100.00', 'Cash', 'Paid', '2025-04-15 11:23:49'),
(5, '3e86f7e6-197b-11f0-9b7a-f0d5bfb97a67', 5, 5, '250.00', 'Cash', 'Unpaid', '2025-04-15 11:23:49');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(100) DEFAULT NULL,
  `published_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `uuid`, `title`, `content`, `author`, `published_at`) VALUES
(1, '3e8b097d-197b-11f0-9b7a-f0d5bfb97a67', '5 Tips for Heart Health', 'Stay active, eat healthy, avoid smoking...', 'Dr. Ayesha Khan', '2025-04-15 11:23:49'),
(2, '3e8b12e1-197b-11f0-9b7a-f0d5bfb97a67', 'Understanding Migraines', 'Migraine is a neurological condition...', 'Dr. Ravi Menon', '2025-04-15 11:23:49'),
(3, '3e8b148c-197b-11f0-9b7a-f0d5bfb97a67', 'Bone Strength Basics', 'Calcium and vitamin D are key...', 'Dr. Sunita Patel', '2025-04-15 11:23:49'),
(4, '3e8b154b-197b-11f0-9b7a-f0d5bfb97a67', 'Immunization in Children', 'Vaccination schedules and tips...', 'Dr. Vikram Singh', '2025-04-15 11:23:49'),
(5, '3e8b15f7-197b-11f0-9b7a-f0d5bfb97a67', 'Early Signs of Cancer', 'Recognizing symptoms can save lives...', 'Dr. Meera Das', '2025-04-15 11:23:49');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `subject` varchar(150) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `uuid`, `name`, `email`, `subject`, `message`, `submitted_at`) VALUES
(1, '3e8f9306-197b-11f0-9b7a-f0d5bfb97a67', 'Alice Brown', 'alice.brown@example.com', 'Appointment Inquiry', 'Can I get a morning slot on Friday?', '2025-04-15 11:23:49'),
(2, '3e8f9cb2-197b-11f0-9b7a-f0d5bfb97a67', 'Bob White', 'bob.white@example.com', 'Billing Question', 'What does the consultation fee cover?', '2025-04-15 11:23:49'),
(3, '3e8f9e8a-197b-11f0-9b7a-f0d5bfb97a67', 'Cindy Ray', 'cindy.ray@example.com', 'Lab Report', 'When will my test results be available?', '2025-04-15 11:23:49'),
(4, '3e8fa071-197b-11f0-9b7a-f0d5bfb97a67', 'David Green', 'david.green@example.com', 'Doctor Availability', 'Is Dr. Menon available next week?', '2025-04-15 11:23:49'),
(5, '3e8fa17c-197b-11f0-9b7a-f0d5bfb97a67', 'Emma Watts', 'emma.watts@example.com', 'Prescription Issue', 'The dosage seems incorrect.', '2025-04-15 11:23:49');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `uuid`, `name`, `description`) VALUES
(1, '3e6b4d76-197b-11f0-9b7a-f0d5bfb97a67', 'Cardiology', 'Heart-related treatments'),
(2, '3e6b5c9c-197b-11f0-9b7a-f0d5bfb97a67', 'Neurology', 'Brain and nervous system care'),
(3, '3e6b5f57-197b-11f0-9b7a-f0d5bfb97a67', 'Orthopedics', 'Bone and muscle care'),
(4, '3e6b6085-197b-11f0-9b7a-f0d5bfb97a67', 'Pediatrics', 'Child health and wellness'),
(5, '3e6b617f-197b-11f0-9b7a-f0d5bfb97a67', 'Oncology', 'Cancer treatment and research');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `photo_url` varchar(255) DEFAULT NULL,
  `availability` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `uuid`, `full_name`, `email`, `phone`, `gender`, `specialization`, `department_id`, `photo_url`, `availability`) VALUES
(1, '3e75a088-197b-11f0-9b7a-f0d5bfb97a67', 'Dr. Ayesha Khan', 'ayesha.khan@medtrust.com', '5551234567', 'Female', 'Cardiologist', 1, 'photo1.jpg', 'Mon-Fri 10am-2pm'),
(2, '3e75af0c-197b-11f0-9b7a-f0d5bfb97a67', 'Dr. Ravi Menon', 'ravi.menon@medtrust.com', '5559876543', 'Male', 'Neurologist', 2, 'photo2.jpg', 'Tue-Thu 12pm-5pm'),
(3, '3e75b1f6-197b-11f0-9b7a-f0d5bfb97a67', 'Dr. Sunita Patel', 'sunita.patel@medtrust.com', '5554567890', 'Female', 'Orthopedic Surgeon', 3, 'photo3.jpg', 'Mon-Wed 9am-1pm'),
(4, '3e75b38f-197b-11f0-9b7a-f0d5bfb97a67', 'Dr. Vikram Singh', 'vikram.singh@medtrust.com', '5558765432', 'Male', 'Pediatrician', 4, 'photo4.jpg', 'Mon-Fri 8am-12pm'),
(5, '3e75b4f3-197b-11f0-9b7a-f0d5bfb97a67', 'Dr. Meera Das', 'meera.das@medtrust.com', '5553456789', 'Female', 'Oncologist', 5, 'photo5.jpg', 'Tue-Thu 3pm-6pm');

-- --------------------------------------------------------

--
-- Table structure for table `lab_reports`
--

CREATE TABLE `lab_reports` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `test_type` varchar(100) DEFAULT NULL,
  `result` text DEFAULT NULL,
  `report_date` date DEFAULT NULL,
  `status` enum('Pending','Completed') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lab_reports`
--

INSERT INTO `lab_reports` (`id`, `uuid`, `patient_id`, `appointment_id`, `test_type`, `result`, `report_date`, `status`) VALUES
(1, '3e9375a9-197b-11f0-9b7a-f0d5bfb97a67', 1, 1, 'Blood Test', 'Normal', '2025-04-16', 'Completed'),
(2, '3e9382a3-197b-11f0-9b7a-f0d5bfb97a67', 2, 2, 'MRI Scan', 'No abnormalities detected', '2025-04-17', 'Completed'),
(3, '3e938519-197b-11f0-9b7a-f0d5bfb97a67', 3, 3, 'X-Ray', 'Fracture in lower spine', '2025-04-18', 'Completed'),
(4, '3e938674-197b-11f0-9b7a-f0d5bfb97a67', 4, 4, 'Vaccination Record', 'Completed DTP series', '2025-04-19', 'Completed'),
(5, '3e9387b4-197b-11f0-9b7a-f0d5bfb97a67', 5, 5, 'CT Scan', 'Minor lymph node swelling', '2025-04-20', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `nurses`
--

CREATE TABLE `nurses` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `shift` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nurses`
--

INSERT INTO `nurses` (`id`, `uuid`, `full_name`, `email`, `phone`, `gender`, `department_id`, `shift`) VALUES
(1, '3e976c2a-197b-11f0-9b7a-f0d5bfb97a67', 'Nurse Emma Roy', 'emma.roy@medtrust.com', '5556781234', 'Female', 1, 'Day'),
(2, '3e9778ec-197b-11f0-9b7a-f0d5bfb97a67', 'Nurse Kiran Rao', 'kiran.rao@medtrust.com', '5551236789', 'Male', 2, 'Night'),
(3, '3e977b14-197b-11f0-9b7a-f0d5bfb97a67', 'Nurse Reema Shah', 'reema.shah@medtrust.com', '5558889990', 'Female', 3, 'Evening'),
(4, '3e977d6c-197b-11f0-9b7a-f0d5bfb97a67', 'Nurse Vinod Sinha', 'vinod.sinha@medtrust.com', '5557776665', 'Male', 4, 'Day'),
(5, '3e977f71-197b-11f0-9b7a-f0d5bfb97a67', 'Nurse Lisa Dsouza', 'lisa.dsouza@medtrust.com', '5555554443', 'Female', 5, 'Night');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `uuid`, `full_name`, `email`, `contact_number`, `date_of_birth`, `gender`, `address`, `created_at`) VALUES
(1, '3e7b58fb-197b-11f0-9b7a-f0d5bfb97a67', 'John Doe', 'john.doe@example.com', '9876543210', '1985-06-15', 'Male', '123 Main St', '2025-04-15 11:23:49'),
(2, '3e7b68ee-197b-11f0-9b7a-f0d5bfb97a67', 'Jane Smith', 'jane.smith@example.com', '9123456789', '1990-12-01', 'Female', '456 Oak Ave', '2025-04-15 11:23:49'),
(3, '3e7b6b86-197b-11f0-9b7a-f0d5bfb97a67', 'Carlos Gomez', 'carlos.gomez@example.com', '9001234567', '1975-09-20', 'Male', '789 Maple Rd', '2025-04-15 11:23:49'),
(4, '3e7b6e0e-197b-11f0-9b7a-f0d5bfb97a67', 'Anita Roy', 'anita.roy@example.com', '9056784321', '2002-03-12', 'Female', '321 Pine Blvd', '2025-04-15 11:23:49'),
(5, '3e7b6fb4-197b-11f0-9b7a-f0d5bfb97a67', 'Mohit Verma', 'mohit.verma@example.com', '9988776655', '1998-07-22', 'Male', '12 Hill St', '2025-04-15 11:23:49');

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `prescribed_on` date DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prescriptions`
--

INSERT INTO `prescriptions` (`id`, `uuid`, `appointment_id`, `doctor_id`, `patient_id`, `prescribed_on`, `notes`) VALUES
(1, '3e9b8593-197b-11f0-9b7a-f0d5bfb97a67', 1, 1, 1, '2025-04-16', 'Prescribed Atenolol 50mg daily'),
(2, '3e9b949e-197b-11f0-9b7a-f0d5bfb97a67', 2, 2, 2, '2025-04-17', 'Advised MRI, prescribed painkillers'),
(3, '3e9b9785-197b-11f0-9b7a-f0d5bfb97a67', 3, 3, 3, '2025-04-18', 'Advised rest and muscle relaxants'),
(4, '3e9b9b51-197b-11f0-9b7a-f0d5bfb97a67', 4, 4, 4, '2025-04-19', 'Vaccination recorded, no medicine'),
(5, '3e9b9ecc-197b-11f0-9b7a-f0d5bfb97a67', 5, 5, 5, '2025-04-20', 'Continue chemo, follow strict diet');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `uuid`, `patient_id`, `rating`, `comment`, `created_at`) VALUES
(1, '3ea0eac5-197b-11f0-9b7a-f0d5bfb97a67', 1, 5, 'Excellent care and attention.', '2025-04-15 11:23:50'),
(2, '3ea0f63c-197b-11f0-9b7a-f0d5bfb97a67', 2, 4, 'Good service, but waiting time was long.', '2025-04-15 11:23:50'),
(3, '3ea0f830-197b-11f0-9b7a-f0d5bfb97a67', 3, 5, 'Felt better after just one visit.', '2025-04-15 11:23:50'),
(4, '3ea0f937-197b-11f0-9b7a-f0d5bfb97a67', 4, 3, 'Kids section can be improved.', '2025-04-15 11:23:50'),
(5, '3ea0fa29-197b-11f0-9b7a-f0d5bfb97a67', 5, 4, 'Doctors are great, billing took time.', '2025-04-15 11:23:50');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `icon_class` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `uuid`, `name`, `description`, `department_id`, `icon_class`) VALUES
(1, '3ea5985d-197b-11f0-9b7a-f0d5bfb97a67', 'ECG', 'Electrocardiogram for heart diagnostics', 1, 'fa-heartbeat'),
(2, '3ea5a3d7-197b-11f0-9b7a-f0d5bfb97a67', 'MRI', 'Magnetic Resonance Imaging', 2, 'fa-brain'),
(3, '3ea5a5da-197b-11f0-9b7a-f0d5bfb97a67', 'Fracture Treatment', 'Bone fracture diagnosis and treatment', 3, 'fa-bone'),
(4, '3ea5a6ed-197b-11f0-9b7a-f0d5bfb97a67', 'Child Check-up', 'Routine pediatric wellness exams', 4, 'fa-baby'),
(5, '3ea5a7e2-197b-11f0-9b7a-f0d5bfb97a67', 'Chemotherapy', 'Cancer treatment with drugs', 5, 'fa-vial');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `role` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `uuid`, `full_name`, `role`, `email`, `phone`, `department_id`) VALUES
(1, '3eaaf574-197b-11f0-9b7a-f0d5bfb97a67', 'Anita Sharma', 'Receptionist', 'anita.sharma@medtrust.com', '5558899000', 1),
(2, '3eab0c0c-197b-11f0-9b7a-f0d5bfb97a67', 'David Thomas', 'Janitor', 'david.thomas@medtrust.com', '5554433221', 2),
(3, '3eab0e9d-197b-11f0-9b7a-f0d5bfb97a67', 'Priya Mehta', 'Pharmacist', 'priya.mehta@medtrust.com', '5553344556', 3),
(4, '3eab1096-197b-11f0-9b7a-f0d5bfb97a67', 'Rohit Kapoor', 'Technician', 'rohit.kapoor@medtrust.com', '5552211334', 4),
(5, '3eab1303-197b-11f0-9b7a-f0d5bfb97a67', 'Sana Iqbal', 'Lab Assistant', 'sana.iqbal@medtrust.com', '5556677889', 5);

-- --------------------------------------------------------

--
-- Table structure for table `wards`
--

CREATE TABLE `wards` (
  `id` int(11) NOT NULL,
  `uuid` char(36) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `type` enum('General','Private','ICU','Maternity','Oncology','Pediatrics') DEFAULT NULL,
  `total_beds` int(11) DEFAULT NULL,
  `available_beds` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wards`
--

INSERT INTO `wards` (`id`, `uuid`, `name`, `type`, `total_beds`, `available_beds`) VALUES
(1, '3eaf47e7-197b-11f0-9b7a-f0d5bfb97a67', 'General Ward A', 'General', 20, 5),
(2, '3eaf5266-197b-11f0-9b7a-f0d5bfb97a67', 'ICU Unit 1', 'ICU', 10, 2),
(3, '3eaf5430-197b-11f0-9b7a-f0d5bfb97a67', 'Private Room 101', 'Private', 1, 1),
(4, '3eaf55c8-197b-11f0-9b7a-f0d5bfb97a67', 'Pediatric Ward', 'Pediatrics', 15, 8),
(5, '3eaf56be-197b-11f0-9b7a-f0d5bfb97a67', 'Oncology Wing', 'Oncology', 12, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `lab_reports`
--
ALTER TABLE `lab_reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `nurses`
--
ALTER TABLE `nurses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `appointment_id` (`appointment_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `wards`
--
ALTER TABLE `wards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uuid` (`uuid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lab_reports`
--
ALTER TABLE `lab_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `nurses`
--
ALTER TABLE `nurses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `wards`
--
ALTER TABLE `wards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`);

--
-- Constraints for table `billing`
--
ALTER TABLE `billing`
  ADD CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  ADD CONSTRAINT `billing_ibfk_2` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`);

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Constraints for table `lab_reports`
--
ALTER TABLE `lab_reports`
  ADD CONSTRAINT `lab_reports_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`),
  ADD CONSTRAINT `lab_reports_ibfk_2` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`);

--
-- Constraints for table `nurses`
--
ALTER TABLE `nurses`
  ADD CONSTRAINT `nurses_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Constraints for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`),
  ADD CONSTRAINT `prescriptions_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `prescriptions_ibfk_3` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`);

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
