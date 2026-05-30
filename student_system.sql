-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2024 at 07:22 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `announcementID` int(50) NOT NULL,
  `announcementTitle` varchar(255) NOT NULL,
  `announcementDesc` varchar(255) NOT NULL,
  `teacherID` int(50) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_date` datetime NOT NULL DEFAULT current_timestamp(),
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`announcementID`, `announcementTitle`, `announcementDesc`, `teacherID`, `created_date`, `modified_date`, `is_deleted`) VALUES
(1, 'Upcoming Exam Reminder', 'A quick reminder that our midterm exam is scheduled for Wednesday, November 8th during our regular class time. Please review the study guide posted on our class portal and come prepared with a calculator, pencils, and your student ID. I\'ll be available du', 8, '2024-10-30 08:43:15', '2024-10-30 08:43:15', 0),
(2, 'Class Cancellation', 'Unfortunately, I’m feeling unwell, so today’s class is canceled. Please use this time to catch up on last week’s readings and complete the assigned exercises in Chapter 5. I’ll be updating our course page with a recorded lecture later this week to cover t', 15, '2024-10-30 08:43:15', '2024-10-30 08:43:15', 0),
(3, 'Project Submission Reminder', 'This is a reminder that our final project is due Friday, December 1st, by 11:59 PM. Make sure to submit your work on the assignment portal. Double-check that your file format is correct, and please include your name and project title in the document.', 14, '2024-10-30 08:45:32', '2024-10-30 08:45:32', 0),
(4, 'Online Quiz Announcement', 'A quick reminder that our online quiz for Chapter 6 is now live and will remain open until Friday, October 27th at 11:59 PM. You can access it via the class portal. Remember, it’s open-book, but please work independently. Good luck, and reach out if you h', 3, '2024-10-30 08:45:32', '2024-10-30 08:45:32', 0),
(5, 'Assignment Feedback Posted', 'I’ve posted feedback for Assignment #2 on the course portal. Please take a few minutes to review it and feel free to reach out if you have any questions or need clarification. Great work overall—many of you demonstrated thoughtful insights!', 20, '2024-10-30 08:48:29', '2024-10-30 08:48:29', 0),
(6, 'End-of-Semester Final Exam Schedule', 'Our final exam is scheduled for Thursday, December 14th, from 10:00 AM to 12:00 PM in Room 205. The exam will cover Chapters 1-12, so please review your notes, past quizzes, and assignments. I\'ll hold a review session on Tuesday, December 12th, at 3:30 PM', 11, '2024-10-30 08:48:29', '2024-10-30 08:48:29', 0),
(7, 'Important Message about Grades', 'Dear Class,\r\nGrades for our recent assignments have been posted on the class portal. Please review your scores and let me know if you have any questions. If you’d like to discuss your progress in detail, feel free to visit during office hours or send me a', 2, '2024-11-01 07:15:51', '2024-11-01 07:15:51', 0),
(8, 'Upcoming event', 'A career fair day', 2, '2024-11-07 21:34:43', '2024-11-07 21:34:43', 0);

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointmentID` int(50) NOT NULL,
  `studentID` int(50) NOT NULL,
  `courseID` int(50) NOT NULL,
  `teacherID` int(50) NOT NULL,
  `purpose` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL COMMENT '(classroom, office)',
  `status` int(1) NOT NULL COMMENT '(0 = Pending, 1 = approved, 2 = rejected)',
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_date` datetime NOT NULL DEFAULT current_timestamp(),
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointmentID`, `studentID`, `courseID`, `teacherID`, `purpose`, `location`, `status`, `created_date`, `modified_date`, `is_deleted`) VALUES
(1, 2, 2, 1, 'Coursework discussion', '2R025', 1, '2024-10-29 04:57:04', '2024-10-29 04:57:04', 0),
(2, 3, 3, 2, 'Mental Advice', 'Breakout Room', 1, '2024-10-29 04:58:55', '2024-10-29 04:58:55', 0),
(3, 4, 4, 3, 'Coursework Discussion', '2R024', 2, '2024-10-29 04:59:55', '2024-10-29 04:59:55', 0),
(4, 5, 5, 4, 'Family issue', 'Pantry', 1, '2024-10-29 05:00:52', '2024-10-29 05:00:52', 0),
(7, 6, 6, 5, 'Computer setup', 'Computer Lab', 0, '2024-10-29 05:02:57', '2024-10-29 05:02:57', 0),
(8, 7, 7, 6, 'Support session', '2R014', 2, '2024-10-29 05:03:58', '2024-10-29 05:03:58', 0),
(9, 8, 8, 7, 'Programme enquiry', 'Office', 1, '2024-10-29 05:05:02', '2024-10-29 05:05:02', 0),
(10, 20, 20, 19, 'Class replacement', '2R014', 1, '2024-11-07 21:32:27', '2024-11-07 21:32:27', 0);

-- --------------------------------------------------------

--
-- Table structure for table `assignment`
--

CREATE TABLE `assignment` (
  `assignmentID` int(11) NOT NULL,
  `assignmentRemark` varchar(255) NOT NULL,
  `studentID` int(50) NOT NULL,
  `courseID` int(50) NOT NULL,
  `assignmentName` varchar(255) NOT NULL,
  `grades` int(10) NOT NULL COMMENT '(exp: 60, 67)',
  `status` int(1) NOT NULL COMMENT '(1 = pending, 2 = approved, 3 = rejected)',
  `assignmentDoc` varchar(255) NOT NULL,
  `submission` int(1) NOT NULL COMMENT '(1 = pending, 2 = received, 3 = overdue)',
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_date` datetime NOT NULL DEFAULT current_timestamp(),
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `assignment`
--

INSERT INTO `assignment` (`assignmentID`, `assignmentRemark`, `studentID`, `courseID`, `assignmentName`, `grades`, `status`, `assignmentDoc`, `submission`, `created_date`, `modified_date`, `is_deleted`) VALUES
(2, 'Financial analysis on current Malaysia market trend', 2, 2, 'Financial analysis practice', 71, 2, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 2, '2024-10-27 19:18:32', '2024-10-27 19:18:32', 0),
(3, 'An overall breakdown on managerial accounting analysis on given field', 3, 3, 'Managerial accounting analysis', 81, 2, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 2, '2024-10-27 19:23:36', '2024-10-27 19:23:36', 0),
(4, 'Select any given field and provide a report regarding its economic activity', 4, 4, 'Economics report', 59, 2, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 2, '2024-10-27 19:24:55', '2024-10-27 19:24:55', 0),
(5, 'Chose any given option an come up a management plan', 5, 5, 'Management report', 68, 2, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 2, '2024-10-27 19:28:44', '2024-10-27 19:28:44', 0),
(6, 'Company has requested an overall market analytic report for reference', 6, 6, 'Marketing declaration report', 0, 1, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 1, '2024-10-27 19:30:47', '2024-10-27 19:30:47', 0),
(7, 'A failed complex machine has been broke down and required inspection hence provide a report', 7, 7, 'Factory machinary inspection', 0, 1, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 1, '2024-10-27 19:33:46', '2024-10-27 19:33:46', 0),
(9, 'Conduct an experiment on thermal conduction integrity on selected material', 8, 8, 'Thermal conduction experiment', 0, 2, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 1, '2024-10-27 19:40:34', '2024-10-27 19:40:34', 0),
(10, 'Inspect the simulation of fluid tidal in a beach', 9, 9, 'Fluid Tidal Inspection', 0, 2, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 3, '2024-10-27 19:47:32', '2024-10-27 19:47:32', 0),
(11, 'Solve a given mathematic equation and write involved theory ', 10, 10, 'Pure mathematic algebra engineering', 97, 2, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 2, '2024-10-27 19:49:37', '2024-10-27 19:49:37', 0),
(12, 'Solve a given calculus and present the solution via presentation', 11, 11, 'Calculus problem solving', 0, 2, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 1, '2024-10-27 19:52:00', '2024-10-27 19:52:00', 0),
(13, 'A business analytic report based on given question to analyze current Malaysia business', 12, 12, 'Business statistic analytic report', 73, 2, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 2, '2024-10-28 04:20:19', '2024-10-28 04:20:19', 0),
(14, 'Provide a corporate finance on given statement', 13, 13, 'corporate finance report', 0, 1, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 1, '2024-10-28 04:22:31', '2024-10-28 04:22:31', 0),
(15, 'Simulate a real-time operation management with collaborate company', 14, 14, 'Operation management simulation', 0, 2, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 1, '2024-10-28 04:25:42', '2024-10-28 04:25:42', 0),
(16, 'Apply an experimentation on selected material ', 15, 15, 'Material experimentation', 51, 2, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 2, '2024-10-28 04:28:24', '2024-10-28 04:28:24', 0),
(17, 'Come up a report on atomic structure analysis', 16, 16, 'Structure analysis report', 0, 1, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 1, '2024-10-28 04:29:48', '2024-10-28 04:29:48', 0),
(18, 'Establish a collaboration with an international business in exchange program', 17, 17, 'International business collaboration', 81, 2, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 2, '2024-10-28 04:31:22', '2024-10-28 04:31:22', 0),
(19, 'Analyze past business law and identify their downaide', 18, 18, 'Business law theory analysis', 0, 2, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 3, '2024-10-28 04:33:11', '2024-10-28 04:33:11', 0),
(20, 'Implement an electrical circuit boards using transistor', 19, 19, 'Electrical circuits board implementation', 43, 2, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 2, '2024-10-28 04:35:15', '2024-10-28 04:35:15', 0),
(21, 'Simulate a situation where a company required human resource distribution recommendation', 20, 20, 'Human Resource Distribution', 76, 2, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 2, '2024-10-28 04:36:36', '2024-10-28 04:36:36', 0),
(22, 'Simulate a situation to distribute assignment to individual with compatible ability', 21, 21, 'Project Management simulation', 65, 2, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 2, '2024-10-28 04:39:45', '2024-10-28 04:39:45', 0);

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `certificateID` int(50) NOT NULL,
  `studentID` int(50) NOT NULL,
  `courseID` int(50) NOT NULL,
  `cert_image` varchar(255) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_date` datetime NOT NULL DEFAULT current_timestamp(),
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`certificateID`, `studentID`, `courseID`, `cert_image`, `created_date`, `modified_date`, `is_deleted`) VALUES
(1, 2, 2, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=wlQ7fN', '2024-10-28 07:34:55', '2024-10-28 07:34:55', 0),
(2, 3, 3, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=wlQ7fN', '2024-10-28 07:34:55', '2024-10-28 07:34:55', 0),
(3, 4, 4, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=wlQ7fN', '2024-10-28 07:37:21', '2024-10-28 07:37:21', 0),
(4, 5, 5, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=wlQ7fN', '2024-10-28 07:37:21', '2024-10-28 07:37:21', 0),
(5, 6, 6, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=wlQ7fN', '2024-10-28 07:38:16', '2024-10-28 07:38:16', 0),
(6, 7, 7, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=wlQ7fN', '2024-10-28 07:38:16', '2024-10-28 07:38:16', 0),
(7, 8, 8, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=wlQ7fN', '2024-10-28 07:39:18', '2024-10-28 07:39:18', 0),
(8, 9, 9, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=wlQ7fN', '2024-10-28 07:39:18', '2024-10-28 07:39:18', 0),
(9, 10, 10, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=wlQ7fN', '2024-10-28 07:40:38', '2024-10-28 07:40:38', 0),
(10, 11, 11, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=wlQ7fN', '2024-10-28 07:40:38', '2024-10-28 07:40:38', 0),
(11, 12, 12, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=wlQ7fN', '2024-10-28 07:41:19', '2024-10-28 07:41:19', 0),
(12, 13, 13, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=wlQ7fN', '2024-10-28 07:41:19', '2024-10-28 07:41:19', 0),
(13, 14, 14, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=wlQ7fN', '2024-10-28 07:41:53', '2024-10-28 07:41:53', 0),
(14, 15, 15, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=wlQ7fN', '2024-10-28 07:41:53', '2024-10-28 07:41:53', 0),
(15, 16, 16, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=wlQ7fN', '2024-10-28 07:43:58', '2024-10-28 07:43:58', 0),
(16, 17, 17, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=wlQ7fN', '2024-10-28 07:43:58', '2024-10-28 07:43:58', 0),
(17, 18, 18, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=wlQ7fN', '2024-10-28 07:44:45', '2024-10-28 07:44:45', 0),
(18, 19, 19, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=wlQ7fN', '2024-10-28 07:44:45', '2024-10-28 07:44:45', 0),
(19, 20, 20, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=wlQ7fN', '2024-10-28 07:45:28', '2024-10-28 07:45:28', 0),
(20, 21, 21, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=wlQ7fN', '2024-10-28 07:45:28', '2024-10-28 07:45:28', 0);

-- --------------------------------------------------------

--
-- Table structure for table `class_time_notification`
--

CREATE TABLE `class_time_notification` (
  `notificationID` int(50) NOT NULL,
  `courseID` int(50) NOT NULL,
  `notificationName` varchar(255) NOT NULL,
  `notificationDetail` varchar(255) NOT NULL,
  `timeOfNextClass` time NOT NULL,
  `dateofNextClass` date NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_date` datetime NOT NULL DEFAULT current_timestamp(),
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `class_time_notification`
--

INSERT INTO `class_time_notification` (`notificationID`, `courseID`, `notificationName`, `notificationDetail`, `timeOfNextClass`, `dateofNextClass`, `created_date`, `modified_date`, `is_deleted`) VALUES
(1, 11, 'Class replacement', 'Class replacement from public holiday', '09:30:00', '2024-10-02', '2024-10-31 05:34:00', '2024-10-31 05:34:00', 0),
(2, 12, 'Additional class', 'Additional lecturer session for exam revision', '07:30:00', '2024-10-17', '2024-10-31 05:36:15', '2024-10-31 05:36:15', 0),
(3, 6, 'Class simulation', 'Class simulation for student to experience real-time market stock', '16:00:00', '2024-10-14', '2024-10-31 05:39:02', '2024-10-31 05:39:02', 0),
(4, 18, 'Replacement class ', 'Replacement class of changing lecture session to support session', '10:00:00', '2024-10-18', '2024-10-31 05:40:09', '2024-10-31 05:40:09', 0),
(5, 3, 'Formula revision', 'Formula session for upcoming quiz session', '11:00:00', '2024-10-21', '2024-10-31 05:41:27', '2024-10-31 05:41:27', 0);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `courseID` int(50) NOT NULL,
  `courseName` varchar(255) NOT NULL,
  `Desc` varchar(255) NOT NULL,
  `creditHours` int(50) NOT NULL,
  `CourseCode` varchar(255) NOT NULL,
  `year` date NOT NULL,
  `teacherID` int(50) DEFAULT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_date` datetime NOT NULL DEFAULT current_timestamp(),
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`courseID`, `courseName`, `Desc`, `creditHours`, `CourseCode`, `year`, `teacherID`, `created_date`, `modified_date`, `is_deleted`) VALUES
(2, 'Financial Accounting', 'Introduction to financial reporting, principles, and concepts', 15, 'FA 001', '2024-10-01', 1, '2024-10-27 03:00:31', '2024-10-27 03:00:31', 0),
(3, 'Managerial Accounting', 'Focus on accounting for internal decision-making processes', 15, 'MA 001', '2023-06-01', 2, '2024-10-27 03:03:31', '2024-10-27 03:03:31', 0),
(4, 'Introduction to Economics', 'Basic principles of micro and macroeconomics', 20, 'ITE 005', '2022-10-01', 3, '2024-10-27 03:04:21', '2024-10-27 03:04:21', 0),
(5, 'Principle of Management', 'Study of organizational structures and management strategies', 12, 'POM 007', '2024-07-01', 4, '2024-10-27 03:05:20', '2024-10-27 03:05:20', 0),
(6, 'Marketing Fundamentals', 'Introduction to marketing principles, strategies, and consumer behavior', 18, 'MF 002', '2024-02-05', 5, '2024-10-27 03:06:23', '2024-10-27 03:06:23', 0),
(7, 'Engineering Mechanics', 'Fundamentals of statics and dynamics in mechanical engineering', 16, 'EM 003', '2025-01-01', 6, '2024-10-27 03:07:07', '2024-10-27 03:07:07', 0),
(8, 'Thermodynamics', 'Basic principles of thermodynamics for engineering applications', 25, 'TM 003', '2022-12-01', 7, '2024-10-27 03:07:53', '2024-10-27 03:07:53', 0),
(9, 'Fluid Mechanics', 'Introduction to fluid dynamics and its applications in engineering', 9, 'FM 012', '2024-07-05', 8, '2024-10-27 03:08:30', '2024-10-27 03:08:30', 0),
(10, 'Linear Algebra', 'Study of linear systems, matrices, and vector spaces', 15, 'LA 004', '2024-06-01', 9, '2024-10-27 03:09:10', '2024-10-27 03:09:10', 0),
(11, 'Calculus I', 'Introduction to differential and integral calculus', 14, 'C1 003', '2024-03-08', 10, '2024-10-27 03:10:03', '2024-10-27 03:10:03', 0),
(12, 'Statistics for Business', 'Application of statistical methods in business decision making', 15, 'SFB 009', '2021-12-20', 11, '2024-10-27 03:11:38', '2024-10-27 03:11:38', 0),
(13, 'Corporate Finance', 'Principles of corporate finance and capital budgeting', 18, 'CF 020', '2024-03-11', 12, '2024-10-27 03:12:18', '2024-10-27 03:12:18', 0),
(14, 'Operations Management', 'Study of production systems, logistics, and supply chain management', 20, 'OM 002', '2022-02-01', 13, '2024-10-27 03:13:22', '2024-10-27 03:13:22', 0),
(15, 'Materials Science', 'Study of material properties and their applications in engineering', 16, 'MS 008', '2024-11-01', 14, '2024-10-27 03:13:57', '2024-10-27 03:13:57', 0),
(16, 'Structural Analysis', 'Basic concepts in the analysis of structures, including beams and trusses', 15, 'SA 007', '2023-06-01', 15, '2024-10-27 03:14:30', '2024-10-27 03:14:30', 0),
(17, 'International Business', 'Exploration of global business environments and strategies', 19, 'IB 101', '2023-11-01', 16, '2024-10-27 03:15:15', '2024-10-27 03:15:15', 0),
(18, 'Business Law', 'Introduction to legal frameworks and regulations affecting businesses', 12, 'BL 007', '2023-09-10', 17, '2024-10-27 03:16:13', '2024-10-27 03:16:13', 0),
(19, 'Electrical Circuits', 'Basic analysis of electrical circuits and systems', 15, 'EC 1011', '2024-02-10', 18, '2024-10-27 03:17:10', '2024-10-27 03:17:10', 0),
(20, 'Human Resource Management', 'Study of HR functions such as recruitment, training, and compensation', 10, 'HRM 019', '2024-08-03', 19, '2024-10-27 03:18:01', '2024-10-27 03:18:01', 0),
(21, 'Project Management', 'Introduction to project management techniques and methodologies', 15, 'PM 145', '2023-12-05', 20, '2024-10-27 03:18:52', '2024-10-27 03:18:52', 0);

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `examID` int(50) NOT NULL,
  `studentID` int(50) NOT NULL,
  `courseID` int(50) NOT NULL,
  `grades` int(10) NOT NULL,
  `exam_datetime` datetime NOT NULL,
  `year` int(50) NOT NULL,
  `status` int(1) NOT NULL COMMENT '(1 = upcoming, 2 = ongoing, 3 = finished)',
  `exam_paper` varchar(255) NOT NULL,
  `student_status` int(1) NOT NULL COMMENT '(1 = first time, 2 = retake)',
  `student_seats` varchar(255) NOT NULL,
  `student_exam_no` int(50) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_date` datetime NOT NULL DEFAULT current_timestamp(),
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`examID`, `studentID`, `courseID`, `grades`, `exam_datetime`, `year`, `status`, `exam_paper`, `student_status`, `student_seats`, `student_exam_no`, `created_date`, `modified_date`, `is_deleted`) VALUES
(1, 2, 2, 0, '2024-12-10 10:00:00', 2024, 1, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1', 1, 'A001', 1, '2024-10-31 05:49:50', '2024-10-31 05:49:50', 0),
(3, 3, 3, 0, '2024-12-11 11:00:00', 2024, 2, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1', 1, 'A002', 2, '2024-10-31 05:54:48', '2024-10-31 05:54:48', 0),
(4, 4, 4, 72, '2024-12-03 13:00:00', 2023, 3, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1', 2, 'B001', 3, '2024-10-31 05:56:27', '2024-10-31 05:56:27', 0),
(5, 5, 5, 0, '2024-12-12 08:00:00', 2024, 1, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 1, 'A003', 4, '2024-10-31 05:59:18', '2024-10-31 05:59:18', 0),
(6, 6, 6, 0, '2024-12-06 13:00:00', 2024, 1, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\nhttps://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 1, 'A004', 5, '2024-10-31 06:00:46', '2024-10-31 06:00:46', 0),
(7, 7, 7, 81, '2023-12-13 14:00:00', 2023, 3, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 1, 'A101', 6, '2024-10-31 06:04:04', '2024-10-31 06:04:04', 0),
(8, 8, 8, 57, '2023-12-13 14:00:00', 2022, 3, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 2, 'Z001', 7, '2024-10-31 06:06:10', '2024-10-31 06:06:10', 0),
(9, 9, 9, 0, '2024-12-13 08:00:00', 2024, 1, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 1, 'A0009', 7, '2024-10-31 06:07:57', '2024-10-31 06:07:57', 0),
(10, 10, 10, 98, '2023-12-14 16:00:00', 2023, 3, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 1, 'C007', 8, '2024-10-31 06:09:20', '2024-10-31 06:09:20', 0),
(11, 11, 11, 0, '2024-12-17 09:00:00', 2024, 1, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\nhttps://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', 1, 'A017', 10, '2024-10-31 06:12:08', '2024-10-31 06:12:08', 0),
(12, 18, 18, 0, '2024-11-13 08:00:00', 2024, 1, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1', 1, 'A021', 11, '2024-11-07 21:54:52', '2024-11-07 21:54:52', 0);

-- --------------------------------------------------------

--
-- Table structure for table `extra_activity`
--

CREATE TABLE `extra_activity` (
  `activityID` int(50) NOT NULL,
  `activityName` varchar(255) NOT NULL,
  `studentClubID` int(50) NOT NULL,
  `teacherID` int(50) NOT NULL,
  `status` int(1) NOT NULL COMMENT '(1 = active, 2 = inactive)',
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_date` datetime NOT NULL DEFAULT current_timestamp(),
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `extra_activity`
--

INSERT INTO `extra_activity` (`activityID`, `activityName`, `studentClubID`, `teacherID`, `status`, `created_date`, `modified_date`, `is_deleted`) VALUES
(1, 'Airsoft Battle', 1, 8, 1, '2024-10-29 05:06:46', '2024-10-29 05:06:46', 0),
(2, 'Chess Competition & Training', 2, 15, 1, '2024-10-29 05:10:23', '2024-10-29 05:10:23', 0),
(3, 'Paintball meeting', 3, 14, 2, '2024-10-29 05:11:41', '2024-10-29 05:11:41', 0),
(4, 'Communist society simulation', 4, 3, 2, '2024-10-29 05:19:49', '2024-10-29 05:19:49', 0),
(5, 'Student Socialize Dinner', 5, 20, 1, '2024-10-29 05:20:24', '2024-10-29 05:20:24', 0),
(6, 'National exchange meeting', 6, 11, 2, '2024-10-29 05:21:50', '2024-10-29 05:21:50', 0),
(7, 'Idol exchange meeting', 7, 5, 2, '2024-10-29 05:22:30', '2024-10-29 05:22:30', 0),
(8, 'Local cave exploration', 8, 7, 1, '2024-10-29 05:23:13', '2024-10-29 05:23:13', 0),
(9, 'First Aid implementation simulation', 9, 2, 1, '2024-10-29 05:25:14', '2024-10-29 05:25:14', 0),
(10, 'Games meeting and discussion', 10, 18, 1, '2024-10-29 05:25:54', '2024-10-29 05:25:54', 0);

-- --------------------------------------------------------

--
-- Table structure for table `performance`
--

CREATE TABLE `performance` (
  `performanceID` int(50) NOT NULL,
  `studentID` int(50) NOT NULL,
  `courseID` int(50) NOT NULL,
  `overallGrades` varchar(10) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_date` datetime NOT NULL DEFAULT current_timestamp(),
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `performance`
--

INSERT INTO `performance` (`performanceID`, `studentID`, `courseID`, `overallGrades`, `created_date`, `modified_date`, `is_deleted`) VALUES
(1, 2, 18, '3.8', '2024-10-31 07:37:24', '2024-10-31 07:37:24', 0),
(2, 3, 11, '2.7', '2024-10-31 07:37:24', '2024-10-31 07:37:24', 0),
(3, 4, 13, '3.5', '2024-10-31 07:39:15', '2024-10-31 07:39:15', 0),
(4, 5, 19, '3.9', '2024-10-31 07:39:15', '2024-10-31 07:39:15', 0),
(5, 6, 7, '2.6', '2024-10-31 07:40:27', '2024-10-31 07:40:27', 0),
(6, 7, 2, '3.0', '2024-10-31 07:40:27', '2024-10-31 07:40:27', 0),
(7, 8, 9, '3.7', '2024-10-31 07:41:39', '2024-10-31 07:41:39', 0),
(8, 9, 20, '2.8', '2024-10-31 07:41:39', '2024-10-31 07:41:39', 0),
(9, 10, 17, '3.2', '2024-10-31 07:42:39', '2024-10-31 07:42:39', 0),
(10, 11, 4, '2.9', '2024-10-31 07:42:39', '2024-10-31 07:42:39', 0),
(11, 12, 10, '3.1', '2024-10-31 07:43:27', '2024-10-31 07:43:27', 0),
(12, 13, 3, '3.4', '2024-10-31 07:43:27', '2024-10-31 07:43:27', 0),
(13, 21, 8, '2.5', '2024-10-31 07:44:49', '2024-10-31 07:44:49', 0),
(14, 20, 16, '3.6', '2024-10-31 07:44:49', '2024-10-31 07:44:49', 0);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studentID` int(11) NOT NULL,
  `studentName` varchar(255) NOT NULL,
  `gender` varchar(20) NOT NULL COMMENT '( Male, Female)',
  `dob` date NOT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `cell_number` varchar(50) NOT NULL,
  `emergency_number` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `courseID` int(50) DEFAULT NULL,
  `year` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '(0 = active, 1 = inactive)',
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_date` datetime NOT NULL DEFAULT current_timestamp(),
  `is_deleted` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentID`, `studentName`, `gender`, `dob`, `nationality`, `email`, `password`, `cell_number`, `emergency_number`, `address`, `courseID`, `year`, `status`, `created_date`, `modified_date`, `is_deleted`) VALUES
(2, 'Moo Keh Chuan Ethan', 'Male', '2002-12-29', 'Malaysia', 'kcem1e24@soton.ac.uk', 'abcd1234', '018-3712138', '016-7502876', 'No.55, Jalan Jasa 33 , Taman Mutiara Rini', 2, 2024, 0, '2024-10-25 23:44:40', '2024-10-25 23:44:40', 0),
(3, 'Mohammed Binti Ali', 'Male', '2002-05-12', 'Malaysia', 'bam3e24@soton.ac.uk', 'fsdfgdsfg345345', '019-5463465', '017-4353454', 'No.99, Jalan Cempaka, Taman Perling', 3, 2024, 0, '2024-10-26 00:15:03', '2024-10-26 00:15:03', 0),
(4, 'Tan Wei Ming', 'Male', '2001-10-29', 'Malaysia', 'wmt5e23@soton.ac.uk', 'dsfgert345435', '016-32453246', '010-131414145', 'No.6, Jalan Merak, Taman Sutera', 4, 2023, 0, '2024-10-26 00:17:42', '2024-10-26 00:17:42', 0),
(5, 'Siti Habsah Binti Azman', 'Female', '2002-09-18', 'Malaysia', 'hbas3e24@soton.ac.uk', 'sdfgesrdty345645', '017-348759348', '014-43554365', 'No.19, Jalan Seri Pulai, Taman Pulai Indah', 5, 2024, 0, '2024-10-26 00:20:35', '2024-10-26 00:20:35', 0),
(6, 'John Williams', 'Male', '2001-12-04', 'United Kingdom', 'wj7e24@soton.ac.uk', 'gfregaerg34', '018-32423556', '019-3465365', 'No.8, Jalan Sutera, Taman Universiti', 6, 2024, 0, '2024-10-26 00:40:07', '2024-10-26 00:40:07', 0),
(7, 'Chong Zhuo Hang', 'Male', '2003-03-15', 'Malaysia', 'zhm1e23@soton.ac.uk', 'gdfger546343', '017-34325436', '012-2334532', 'No.5, Jalan Setia, Taman Ungku Tun Aminah', 7, 2023, 0, '2024-10-26 00:41:55', '2024-10-26 00:41:55', 0),
(8, 'Ainul Mardhiah Binti Nor', 'Female', '2002-12-22', 'Malaysia', 'mbna3e22@soton.ac.uk', 'sadfasdf3245345', '013-3252345', '014-34325324', 'No.60, Jalan Teratai, Taman Bukit Indah', 8, 2022, 1, '2024-10-26 00:44:33', '2024-10-26 00:44:33', 0),
(9, 'Kevin Ng Jun Jie', 'Male', '2002-06-07', 'Malaysia', 'njjk1e24@soton.ac.uk', 'csdc//4354345', '015-54363456', '019-3425342', 'No.11, Jalan Tropika, Taman Nusa Bestari', 9, 2024, 0, '2024-10-26 00:48:24', '2024-10-26 00:48:24', 0),
(10, 'Emily Zhang Wei Li', 'Female', '2001-07-15', 'China', 'zwlr8e23@soton.ac.uk', 'hjfkhj;5674', '013-43543342', '07-23453226', 'No.9, Jalan Anggerik, Taman Mount Austin', 10, 2023, 0, '2024-10-26 00:51:03', '2024-10-26 00:51:03', 0),
(11, 'Zainab Binti Abdullah', 'Female', '2001-05-29', 'Malaysia', 'baz8e24@soton.ac.uk', 'frewgerw435645', '014-4533426', '016-3453487', 'No.7, Jalan Bayu, Taman Nusajaya', 11, 2024, 0, '2024-10-26 00:53:29', '2024-10-26 00:53:29', 0),
(12, 'Hafiz Bin Ramli', 'Male', '2003-07-20', 'Malaysia', 'brh5e22@soton.ac.uk', 'erwghse45654', '016-324535234', '07-3452621', 'No.32, Jalan Seroja, Taman Johor Jaya', 12, 2022, 1, '2024-10-26 00:58:37', '2024-10-26 00:58:37', 0),
(13, 'Lily Wong Siew Li', 'Female', '2004-08-21', 'Malaysia', 'wslm1e23@soton.ac.uk', 'dwefgwq\'23432', '012-5463456', '018-23453465', 'No.49, Jalan Larkin, Taman Bukit Indah', 13, 2023, 0, '2024-10-26 01:01:20', '2024-10-26 01:01:20', 0),
(14, 'Kim Seok-jin', 'Male', '2002-02-28', 'South Korea', 'sjk9e22@soton.ac.uk', 'sdfsdgr/4535', '014-4325344', '02-34624676', 'No.15, Jalan Kempas, Taman Nusa Bestari', 14, 2022, 1, '2024-10-26 01:04:20', '2024-10-26 01:04:20', 0),
(15, 'Anjali Mehra', 'Female', '2000-11-27', 'India', 'ma6e22@soton.ac.uk', 'gfawgwert]34534', '017-3284723', '015-3244324', 'No.56, Jalan Senai, Taman Desa Tebrau', 15, 2022, 1, '2024-10-26 01:07:28', '2024-10-26 01:07:28', 0),
(16, 'Oscar Martinez', 'Male', '2001-03-20', 'Spain', 'mo9e24@soton.ac.uk', 'wgferg21\'12', '014-4363464', '07-23234328', 'No.66, Jalan Kempas, Taman Ulu Tiram', 16, 2024, 0, '2024-10-26 01:10:36', '2024-10-26 01:10:36', 0),
(17, 'Amina Abdullahi', 'Female', '2002-05-01', 'Nigeria', 'aa8e23@soton.ac.uk', 'wferwgwer\'34534', '016-35432632', '010-3453246', 'No.78, Jalan Nusa Bestari, Taman Perling', 17, 2023, 0, '2024-10-26 01:12:02', '2024-10-26 01:12:02', 0),
(18, 'Louis Dupont', 'Male', '2002-11-02', 'France', 'dl9e24@soton.ac.uk', 'dqwfwef32545', '018-34252346', '07-38476565', 'No.22, Jalan Sutera, Taman Skudai Baru', 18, 2024, 0, '2024-10-26 01:15:18', '2024-10-26 01:15:18', 0),
(19, 'Maria Silva', 'Female', '2001-04-19', 'Brazil', 'sm2e23@soton.ac.uk', 'bsber][3463', '016-437852435', '014-342534', 'No.18, Jalan Setia, Taman Ungku Tun Aminah', 19, 2023, 0, '2024-10-26 01:16:48', '2024-10-26 01:16:48', 0),
(20, 'Yuki Tanaka', 'Female', '2002-04-07', 'Japan', 'ty6e24@soton.ac.uk', 'fwegf`1`067', '014-436346', '015-34632626', 'No.24, Jalan Kebun Teh, Taman Daya', 20, 2024, 0, '2024-10-26 01:19:09', '2024-10-26 01:19:09', 0),
(21, 'Chloe Johnson', 'Female', '2001-05-12', 'Canada', 'jc3e23@soton.ac.uk', 'fwefs[]3453462', '017-32104109', '01-3942968', 'No.53, Jalan Indah, Taman Sri Skudai', 21, 2023, 0, '2024-10-26 01:20:52', '2024-10-26 01:20:52', 0);

-- --------------------------------------------------------

--
-- Table structure for table `student_club`
--

CREATE TABLE `student_club` (
  `studentClubID` int(50) NOT NULL,
  `studentClubName` varchar(255) NOT NULL,
  `studentID` int(50) NOT NULL COMMENT 'President',
  `teacherID` int(50) NOT NULL,
  `studentClubDesc` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_date` datetime NOT NULL DEFAULT current_timestamp(),
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `student_club`
--

INSERT INTO `student_club` (`studentClubID`, `studentClubName`, `studentID`, `teacherID`, `studentClubDesc`, `created_date`, `modified_date`, `is_deleted`) VALUES
(1, 'Airsoft Club', 8, 8, ' A society that promotes and engages in the sport of Airsoft.', '2024-10-27 19:20:11', '2024-10-27 19:20:11', 0),
(2, 'Chess Club', 17, 15, 'The Chess Club is a place for chess players of all standards to meet.', '2024-10-27 19:20:11', '2024-10-27 19:20:11', 0),
(3, 'Paintball Club', 15, 14, 'Want to try out something a little faster paced? We\'re here to welcome new and current players to the world of tournament and casual paintball.', '2024-10-27 19:24:27', '2024-10-27 19:24:27', 0),
(4, 'Communist Society ', 21, 3, 'If you want to involved in the fight for communism, by arming yourself with revolutionary ideas and taking them to the movement on the streets, pickets and protests, then join the Communist society!', '2024-10-27 19:24:27', '2024-10-27 19:24:27', 0),
(5, 'Socialist Students Society', 7, 20, 'We are Socialist Students Southampton, join us to learn and put into practice socialist ideas so we can: build a political alternative, organise protests, join striking workers on the pickets and discuss how how a socialist future could save us from clima', '2024-10-27 19:27:19', '2024-10-27 19:27:19', 0),
(6, 'Model United Nations', 10, 11, 'SOTONMUN is a society dedicated to those who enjoy discussing politics and international relations, as well as a wide variety of other issues that individuals are facing day-to-day.', '2024-10-27 19:27:19', '2024-10-27 19:27:19', 0),
(7, 'Taylor Swift Society', 12, 5, 'A society for people who are interested in Taylor Swift’s music and interested to meeting like-minded people, with opportunities to celebrate her music and her legacy.', '2024-10-27 19:31:15', '2024-10-27 19:31:15', 0),
(8, 'Student Scout And Guide Organisation', 6, 7, 'Southampton Student Scout and Guide Organisation is a society, interested in volunteering in the local Scouting and Guiding community, and just having fun.', '2024-10-27 19:31:15', '2024-10-27 19:31:15', 0),
(9, 'First Aid Society', 9, 2, 'What could be a more important skill than knowing how to save a life? The First Aid Society is a diverse group of students from all courses who come together and learn essential skills.', '2024-10-27 19:43:26', '2024-10-27 19:43:26', 0),
(10, 'Games Society', 14, 18, 'A relaxed society aiming to provide a place to socialize and play board, card (including MTG), tabletop war and role playing games.', '2024-10-27 19:43:26', '2024-10-27 19:43:26', 0),
(11, 'Spaceflight Society', 13, 10, 'Spaceflight Society is an engineering and outreach society, open to anyone who wants to get involved.', '2024-10-27 19:46:04', '2024-10-27 19:46:04', 0),
(12, 'Video Games & Esports Society', 18, 1, 'Welcome to SVGE, the Video Games &amp; Esports Society.', '2024-10-27 19:46:04', '2024-10-27 19:46:04', 0),
(13, 'Rock and Metal Music Society', 19, 13, 'Welcome to the Southampton University Rock and Metal Society SUSU Page.', '2024-10-27 19:50:36', '2024-10-27 19:50:36', 0),
(14, 'Piano Society', 3, 19, 'We are a friendly society for all people interested in listening to or performing piano of any genre, at any level.', '2024-10-27 19:50:36', '2024-10-27 19:50:36', 0),
(15, 'Bluetits (Netball)', 2, 4, 'Southampton\'s Medics\' netball team &amp; Medsoc\'s largest all female society - The Bluetits! Our training, matches, and socials are designed to fit around a busy medicine schedule', '2024-10-28 02:20:30', '2024-10-28 02:20:30', 0),
(16, 'Hornets Athletics', 16, 16, 'Welcome to the Southampton Medics Run Club! Whether you\'re an experienced runner or just starting, our club offers a supportive environment to stay active, relieve stress, and build lasting friendships.', '2024-10-28 02:20:30', '2024-10-28 02:20:30', 0),
(17, 'Basketball', 5, 9, 'Welcome to the Southampton University Basketball Club.', '2024-10-28 02:25:58', '2024-10-28 02:25:58', 0),
(18, 'Cheerleading - Vixens', 4, 17, 'Welcome to the Southampton Vixens Cheerleading and Dance page, we have lots of exciting opportunities for everyone! Vixens is a great opportunity to meet like-minded people whether you have Cheer and Dance experience or not.', '2024-10-28 02:25:58', '2024-10-28 02:25:58', 0),
(19, 'Skydive', 20, 6, 'A place for people of any experience level to join the world of skydiving.', '2024-10-28 02:31:58', '2024-10-28 02:31:58', 0),
(20, 'Team Southampton Motorsport', 11, 12, 'Team Southampton Motorsport is a club for all motorsport enthusiasts at the University of Southampton.', '2024-10-28 02:31:58', '2024-10-28 02:31:58', 0);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teacherID` int(11) NOT NULL,
  `teacherName` varchar(255) NOT NULL,
  `courseID` int(50) NOT NULL,
  `gender` varchar(50) NOT NULL COMMENT '(male, female)',
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `cellNumber` varchar(50) NOT NULL,
  `nationality` varchar(50) NOT NULL,
  `status` int(1) NOT NULL COMMENT '(0 = active, 1 = inactive)',
  `position` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `address` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_date` datetime NOT NULL DEFAULT current_timestamp(),
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacherID`, `teacherName`, `courseID`, `gender`, `email`, `password`, `cellNumber`, `nationality`, `status`, `position`, `dob`, `address`, `created_date`, `modified_date`, `is_deleted`) VALUES
(1, 'Dr. Zeeshan', 2, 'Male', 'zeeshan@soton.ac.uk', 'sqsaF3123', '019-32942983', 'United Kingdom', 0, 'Lecturer', '1990-06-22', '10 Downing St, Johor Bahru, Malaysia', '2024-10-27 04:04:44', '2024-10-27 04:04:44', 0),
(2, 'Dr. Safwan', 3, 'Male', 'safwan@soton.ac.uk', 'cscs\'343231', '017-2349839', 'Vietnamese', 0, 'Lecturer', '2002-05-12', '15 Jalan Skudai, Iskandar Puteri, Malaysia', '2024-10-27 04:10:17', '2024-10-27 04:10:17', 0),
(3, 'Dr. James Robertson', 4, 'Male', 'robertson@soton.ac.uk', '\';qwdiu2', '019-12454326', 'United Kingdom', 0, 'Senior lecturer', '1989-10-18', '23 Oxford Rd, Johor Bahru, Malaysia', '2024-10-27 04:12:12', '2024-10-27 04:12:12', 0),
(4, 'Ms. Amina Hussain', 5, 'Female', 'amina@soton.ac.uk', 'dqopqw[1]1', '019-3249891', 'United Kingdom', 1, 'Lecturer', '1998-11-09', '35 Jalan Sutera, Johor Bahru, Malaysia', '2024-10-27 04:13:36', '2024-10-27 04:13:36', 0),
(5, 'Dr. Oliver Green', 6, 'Male', 'oliver@soton.ac.uk', 'fwfwe3213\'\'', '013-239423249', 'Malaysia', 0, 'Associate professor', '1980-06-07', '8 Queen St, Iskandar Puteri, Malaysia', '2024-10-27 04:15:54', '2024-10-27 04:15:54', 0),
(6, 'Prof. Li Wei', 7, 'Male', 'weili@soton.ac.uk', 'qwdfew;\'.2', '015-2398743', 'United Kingdom', 0, 'Professor', '1976-11-01', '78 Jalan Nusajaya, Johor Bahru, Malaysia', '2024-10-27 04:18:10', '2024-10-27 04:18:10', 0),
(7, 'Dr. Rachel Davies', 8, 'Female', 'davies@soton.ac.uk', 'dwqddqwpo23', '014-4349328', 'United Kingdom', 0, 'Lecturer', '1995-09-12', '50 Green Rd, Johor Bahru, Malaysia', '2024-10-27 04:19:55', '2024-10-27 04:19:55', 0),
(8, 'Dr. Abdul Karim', 9, 'Male', 'karim@soton.ac.uk', 'edqwepoiup', '017-3244329', 'Malaysia', 0, 'Senior lecturer', '1999-08-07', '12 Jalan Larkin, Johor Bahru, Malaysia', '2024-10-27 04:21:52', '2024-10-27 04:21:52', 0),
(9, 'Ms. Victoria Clarke', 10, 'Female', 'clarke@soton.ac.uk', 'dewpfi234;\'', '016-2446663', 'Irish', 0, 'Lecturer', '1996-09-23', '45 Regent St, Iskandar Puteri, Malaysia', '2024-10-27 04:24:13', '2024-10-27 04:24:13', 0),
(10, 'Dr. Siti Nurhaliza', 11, 'Female', 'nurhaliza@soton.ac.uk', 'ewg[phpo[\'', '018-234598275', 'Malaysia', 0, 'Lecturer', '1980-04-12', '90 Jalan Kempas, Johor Bahru, Malaysia', '2024-10-27 04:29:39', '2024-10-27 04:29:39', 0),
(11, 'Dr. Michael O’Connor', 12, 'Male', 'oconner@soton.ac.uk', 'svd[pbsv;\'', '012-4329835', 'Irish', 0, 'Senior lecturer', '1979-01-29', '22 St. Patrick Rd, Johor Bahru, Malaysia', '2024-10-27 04:30:53', '2024-10-27 04:30:53', 0),
(12, 'Prof. Maria Lopez', 13, 'Female', 'lopez@soton.ac.uk', 'fpo325325-', '015-329487', 'Spanish', 0, 'Professor', '1987-11-01', '99 Jalan Setia, Johor Bahru, Malaysia', '2024-10-27 04:32:34', '2024-10-27 04:32:34', 0),
(13, 'Mr. Richard Tan', 14, 'Male', 'richard@soton.ac.uk', 'ferge;\'23412', '014-34987324', 'Singapore', 0, 'Lecturer', '1993-03-09', '88 Jalan Tebrau, Iskandar Puteri, Malaysia', '2024-10-27 04:41:07', '2024-10-27 04:41:07', 0),
(14, 'Dr. Anjali Mehra', 15, 'Female', 'anjali@soton.ac.uk', 'dfwefpwef;\'212', '012-345984', 'India', 0, 'Associate professor', '1997-04-15', '78 Jalan Danga Bay, Johor Bahru, Malaysia', '2024-10-27 04:44:16', '2024-10-27 04:44:16', 0),
(15, 'Dr. Ahmed Al-Sayed', 16, 'Male', 'ahmed@soton.ac.uk', 'fw;qefkpo24389', '013-439827', 'Egypt', 0, 'Senior lecturer', '1986-03-19', '32 Jalan Kangkar Pulai, Iskandar Puteri, Malaysia', '2024-10-27 04:46:01', '2024-10-27 04:46:01', 0),
(16, 'Ms. Fiona Grant', 17, 'Female', 'grant@soton.ac.uk', 'dwfw3k[p13213', '016-34983223', 'United Kingdom', 0, 'Lecturer', '1999-07-30', '14 Thames Rd, Johor Bahru, Malaysia', '2024-10-27 04:47:50', '2024-10-27 04:47:50', 0),
(17, 'Prof. Hiroshi Tanaka', 18, 'Male', 'tanaka@soton.ac.uk', 'fwd\'p;owoef;\'1', '019-23498123', 'Japan', 0, 'Professor', '1991-03-21', '77 Jalan Bukit Indah, Johor Bahru, Malaysia', '2024-10-27 04:49:18', '2024-10-27 04:49:18', 0),
(18, 'Dr. Sarah Parker', 19, 'Female', 'sarah@soton.ac.uk', 'fwejfwe;l\'12', '017-1238213', 'United Kingdom', 0, 'Lecturer', '2000-01-19', '19 High St, Iskandar Puteri, Malaysia', '2024-10-27 04:50:30', '2024-10-27 04:50:30', 0),
(19, 'Mr. Yusuf Al-Maadi', 20, 'Male', 'maadi@soton.ac.uk', 'dfwefwe\';lk234', '017-12897342', 'United Arab Emirates', 1, 'Lecturer', '1983-02-28', '101 Jalan Tun Razak, Johor Bahru, Malaysia', '2024-10-27 04:54:45', '2024-10-27 04:54:45', 0),
(20, 'Dr. Karen Wong', 21, 'Female', 'karen@soton.ac.uk', 'ewfojwke213', '019-2344987', 'Malaysia', 0, 'Senior lecturer', '1980-08-29', '66 Jalan Permas Jaya, Johor Bahru, Malaysia', '2024-10-27 04:55:55', '2024-10-27 04:55:55', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transcripts`
--

CREATE TABLE `transcripts` (
  `transcriptID` int(50) NOT NULL,
  `studentID` int(50) NOT NULL,
  `courseID` int(50) NOT NULL,
  `transcript_image` varchar(255) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_date` datetime NOT NULL DEFAULT current_timestamp(),
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `transcripts`
--

INSERT INTO `transcripts` (`transcriptID`, `studentID`, `courseID`, `transcript_image`, `created_date`, `modified_date`, `is_deleted`) VALUES
(1, 2, 2, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=bTiIGrhttps://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=bTiIGr', '2024-10-29 04:46:28', '2024-10-29 04:46:28', 0),
(3, 3, 3, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1', '2024-10-29 04:47:40', '2024-10-29 04:47:40', 0),
(4, 4, 4, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', '2024-10-29 04:48:05', '2024-10-29 04:48:05', 0),
(5, 5, 5, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', '2024-10-29 04:50:28', '2024-10-29 04:50:28', 0),
(6, 10, 10, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', '2024-10-29 04:52:23', '2024-10-29 04:52:23', 0),
(7, 12, 12, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', '2024-10-29 04:53:15', '2024-10-29 04:53:15', 0),
(8, 15, 15, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', '2024-10-29 04:53:43', '2024-10-29 04:53:43', 0),
(9, 17, 17, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', '2024-10-29 04:54:34', '2024-10-29 04:54:34', 0),
(10, 19, 19, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', '2024-10-29 04:55:30', '2024-10-29 04:55:30', 0),
(11, 20, 20, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', '2024-10-29 04:55:30', '2024-10-29 04:55:30', 0),
(12, 21, 21, 'https://sotonac-my.sharepoint.com/:i:/g/personal/kcem1e24_soton_ac_uk/EcVvYt9Y7H1Mi1aN2n3vz1QBieMLoqN8NPVZ2xu89udbUQ?e=Irr6j1\r\n', '2024-10-29 04:55:58', '2024-10-29 04:55:58', 0);

-- --------------------------------------------------------

--
-- Table structure for table `workshop`
--

CREATE TABLE `workshop` (
  `workshopID` int(50) NOT NULL,
  `workshopName` varchar(255) NOT NULL,
  `workshop_desc` varchar(255) NOT NULL,
  `studentClubID` int(50) NOT NULL,
  `workshopDate` date NOT NULL,
  `workshopTime` time NOT NULL,
  `teacherID` int(50) NOT NULL,
  `studentID` int(50) NOT NULL,
  `status` int(1) NOT NULL COMMENT '(1 = approved, 2 = rejected)',
  `created_date` datetime NOT NULL DEFAULT current_timestamp(),
  `modified_date` datetime NOT NULL DEFAULT current_timestamp(),
  `is_deleted` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `workshop`
--

INSERT INTO `workshop` (`workshopID`, `workshopName`, `workshop_desc`, `studentClubID`, `workshopDate`, `workshopTime`, `teacherID`, `studentID`, `status`, `created_date`, `modified_date`, `is_deleted`) VALUES
(1, 'Crafting Your Professional Story', 'Learn how to effectively share your personal and professional journey in a way that resonates with employers, colleagues, and networks. This workshop will help you identify key experiences, values, and goals to build a compelling professional narrative.', 4, '2024-10-31', '19:00:00', 8, 8, 1, '2024-10-31 07:26:39', '2024-10-31 07:26:39', 0),
(2, 'Peak Performance Mindset: Building Mental Toughness', 'Learn mental strategies to stay focused, overcome challenges, and improve resilience. This workshop covers visualization, goal-setting, and managing pressure—key skills for success both on and off the field.', 17, '2024-11-01', '18:00:00', 15, 17, 1, '2024-10-31 07:26:39', '2024-10-31 07:26:39', 0),
(3, 'Strength & Conditioning Essentials for Athletes', 'Gain foundational knowledge of strength and conditioning principles tailored for your sport. This session will cover exercises, injury prevention, and workout planning to help athletes build strength, endurance, and agility.', 15, '2024-11-04', '20:00:00', 14, 15, 1, '2024-10-31 07:28:47', '2024-10-31 07:28:47', 0),
(4, 'Leadership on the Field: Becoming a Strong Team Captain', 'This workshop is designed for team captains and leaders, focusing on the skills required to lead effectively. Learn how to motivate teammates, make strategic decisions, and maintain a positive team culture.', 16, '2024-11-01', '20:00:00', 3, 21, 1, '2024-10-31 07:28:47', '2024-10-31 07:28:47', 0),
(5, 'Balancing Athletics and Academics: Time Management for Student-Athletes', 'Juggling training, academics, and personal life can be challenging. This workshop shares practical tips and tools for balancing these demands, including time management, goal setting, and prioritizing well-being.', 20, '2024-11-04', '19:00:00', 20, 7, 1, '2024-10-31 07:31:07', '2024-10-31 07:31:07', 0),
(6, 'Branding Your Sports Club: Social Media and Marketing 101', 'In this hands-on session, learn how to effectively promote your club online, attract more members, and build a supportive fanbase. Covering social media strategies, storytelling, and branding, this workshop is ideal for club officers and media reps.', 18, '2024-11-05', '18:00:00', 11, 10, 1, '2024-10-31 07:31:07', '2024-10-31 07:31:07', 0),
(7, 'Test your skill on MMO', 'A MMO strategic game open fo rall individual', 12, '2024-11-14', '12:00:00', 12, 11, 2, '2024-11-07 22:01:58', '2024-11-07 22:01:58', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`announcementID`),
  ADD KEY `teacherID` (`teacherID`) USING BTREE;

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointmentID`),
  ADD KEY `studentID` (`studentID`) USING BTREE,
  ADD KEY `courseID` (`courseID`),
  ADD KEY `teacherID` (`teacherID`);

--
-- Indexes for table `assignment`
--
ALTER TABLE `assignment`
  ADD PRIMARY KEY (`assignmentID`),
  ADD KEY `studentID` (`studentID`) USING BTREE,
  ADD KEY `courseID` (`courseID`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`certificateID`),
  ADD KEY `studentID` (`studentID`) USING BTREE,
  ADD KEY `courseID` (`courseID`);

--
-- Indexes for table `class_time_notification`
--
ALTER TABLE `class_time_notification`
  ADD PRIMARY KEY (`notificationID`),
  ADD KEY `courseID` (`courseID`) USING BTREE;

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`courseID`),
  ADD KEY `teacherID` (`teacherID`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`examID`),
  ADD KEY `studentID` (`studentID`) USING BTREE,
  ADD KEY `courseID` (`courseID`);

--
-- Indexes for table `extra_activity`
--
ALTER TABLE `extra_activity`
  ADD PRIMARY KEY (`activityID`),
  ADD KEY `studentClubID` (`studentClubID`) USING BTREE,
  ADD KEY `teacherID` (`teacherID`);

--
-- Indexes for table `performance`
--
ALTER TABLE `performance`
  ADD PRIMARY KEY (`performanceID`),
  ADD KEY `studentID` (`studentID`) USING BTREE,
  ADD KEY `courseID` (`courseID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studentID`),
  ADD KEY `courseID` (`courseID`);

--
-- Indexes for table `student_club`
--
ALTER TABLE `student_club`
  ADD PRIMARY KEY (`studentClubID`),
  ADD KEY `studentID` (`studentID`) USING BTREE,
  ADD KEY `teacherID` (`teacherID`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacherID`),
  ADD KEY `courseID` (`courseID`);

--
-- Indexes for table `transcripts`
--
ALTER TABLE `transcripts`
  ADD PRIMARY KEY (`transcriptID`),
  ADD KEY `studentID` (`studentID`) USING BTREE,
  ADD KEY `courseID` (`courseID`);

--
-- Indexes for table `workshop`
--
ALTER TABLE `workshop`
  ADD PRIMARY KEY (`workshopID`),
  ADD KEY `teacherID` (`teacherID`) USING BTREE,
  ADD KEY `studentID` (`studentID`),
  ADD KEY `studentClubID` (`studentClubID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `announcementID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointmentID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `assignment`
--
ALTER TABLE `assignment`
  MODIFY `assignmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `certificateID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `class_time_notification`
--
ALTER TABLE `class_time_notification`
  MODIFY `notificationID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `courseID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `examID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `extra_activity`
--
ALTER TABLE `extra_activity`
  MODIFY `activityID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `performance`
--
ALTER TABLE `performance`
  MODIFY `performanceID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `studentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `student_club`
--
ALTER TABLE `student_club`
  MODIFY `studentClubID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `teacherID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `transcripts`
--
ALTER TABLE `transcripts`
  MODIFY `transcriptID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `workshop`
--
ALTER TABLE `workshop`
  MODIFY `workshopID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcement`
--
ALTER TABLE `announcement`
  ADD CONSTRAINT `announcement_ibfk_1` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `assignment`
--
ALTER TABLE `assignment`
  ADD CONSTRAINT `assignment_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `assignment_ibfk_2` FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `certificates_ibfk_2` FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `class_time_notification`
--
ALTER TABLE `class_time_notification`
  ADD CONSTRAINT `class_time_notification_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`),
  ADD CONSTRAINT `exams_ibfk_2` FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `extra_activity`
--
ALTER TABLE `extra_activity`
  ADD CONSTRAINT `extra_activity_ibfk_1` FOREIGN KEY (`studentClubID`) REFERENCES `student_club` (`studentClubID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `extra_activity_ibfk_2` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `performance`
--
ALTER TABLE `performance`
  ADD CONSTRAINT `performance_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `performance_ibfk_2` FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_club`
--
ALTER TABLE `student_club`
  ADD CONSTRAINT `student_club_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`),
  ADD CONSTRAINT `student_club_ibfk_2` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transcripts`
--
ALTER TABLE `transcripts`
  ADD CONSTRAINT `transcripts_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transcripts_ibfk_2` FOREIGN KEY (`courseID`) REFERENCES `courses` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `workshop`
--
ALTER TABLE `workshop`
  ADD CONSTRAINT `workshop_ibfk_1` FOREIGN KEY (`teacherID`) REFERENCES `teacher` (`teacherID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `workshop_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `workshop_ibfk_3` FOREIGN KEY (`studentClubID`) REFERENCES `student_club` (`studentClubID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
