University Student Portal Database System

Project Overview
This project represents the complete backend database architecture and management design for a University Student Portal, developed as part of the COMP1314 Data Management module. The system is modeled after mainstream higher education applications to smoothly manage a university’s digital infrastructure. It bridges administrative operations with student requirements, keeping track of detailed records ranging from personal enrollment statuses to ongoing club workloads and academic marks.

The implementation features a fully normalized relational schema deployed on MySQL, built-in structural auditing mechanisms, and a suite of advanced analytical views designed to yield immediate administrative insights.

Authors
Low Yee Heng Kevin — University of Southampton Malaysia   
Moo Keh Chuan Ethan — University of Southampton Malaysia

Key Architectural Features

Data Integrity via Soft Deletion: To avoid catastrophic manual errors, absolute row extraction via standard DELETE SQL commands is replaced entirely by soft-deletion. Every structural table implements custom temporal auditing columns (created_date, modified_date) along with an is_deleted integer status flag. This approach safeguards structural historical entries in phpMyAdmin while allowing real-time restoration options inside the application interface.

Cascading Integrity Chains: Foreign key configurations enforce restrictive patterns during system adjustments (ON UPDATE CASCADE / ON DELETE CASCADE), ensuring database synchronization across dependent tables like transcripts, certificates, and appointments.

Thorough Normalization Compliance: The schema is fully optimized to maximize operational consistency and eliminate data redundancy across 3 structural levels:  
1NF: Ensured by enforcing strictly atomic data values within single cells alongside distinct attribute columns and row indexes.  
2NF: Fulfilled by employing single-column artificial Primary Keys across all tracking metrics, eliminating partial dependencies.  
3NF: Satisfied by removing any transitive dependency interactions among secondary non-key elements, ensuring fields connect only directly to primary keys.

Database Schema Design

The relational system is structured around 14 distinct entities/tables meticulously mapped out to handle everyday educational tasks:  
student: Tracks deep personal metadata, credentials, emergency points of contact, and structural enrollment indicators.  
teacher: Maintains structural tracking records for faculty bodies, positional classifications, and matching system logs.  
courses: Organizes university classes, mapped syllabus designations, module weight parameters, and instructor keys.  
assignment: Monitors active coursework submissions, instructor approval ratings, and evaluation documentation pointers.  
exams: Processes rigorous test settings, seat layout placements, paper data references, and retake records.  
performance: Aggregates final assessment results to map a student's total academic progress.  
transcripts: Houses verifiable record imagery showing final completed courses.  
certificates: Archives graduation validation receipts and program complete indicators.  
appointment: Organizes calendar support links, office check-ins, and pending confirmation logs between students and teachers.  
announcement: Broadcasts real-time information streams written by instructors.  
student_club: Indexes official campus groups, tracking foundational briefs along with acting board leaders.  
extra_activity: Coordinates student club operations and associated supervision metrics.  
workshop: Registers extracurricular professional masterclasses, approval permissions, and event coordinators.  
class_time_notification: Issues real-time scheduling adjustments and exam revision reminders.

Analytics & Reporting Framework

The database engine contains complex analytics queries structured for real-time reporting. Key implemented procedures demonstrate queries optimized to address operational questions:  
Temporal Activity Metrics: Tracks communication frequency by computing live announcements distributed over any rolling 24-hour window.  
Resource Optimization Audit: Identifies organizational active outputs by aggregating new workshops created by club sectors inside a monthly interval.  
Academic Assessment Analytics: Evaluates cumulative assessment paths by combining task rankings from highest values down to zero.  
Urgent Task Management: Filters overdue and missed task profiles to isolate structural bottlenecks where students fail to complete coursework inside given deadlines.  
System Scheduling Checks: Dynamically captures upcoming evaluations happening within 7 days to support calendar update flows.

Deployment Instructions
Prerequisites
MySQL Server (v5.7 or higher recommended) / MariaDB

phpMyAdmin Console or any chosen database administration terminal interface

Initial Setup
Clone the structural backend scripts into your chosen directory workspace.

Initialize your central database architecture shell instance:


CREATE DATABASE university_student_portal;
USE university_student_portal;

Load the foundational table templates into the instance by executing the script queries outlined in section 6.1 (e.g., executing the structural CREATE TABLE commands for student, teacher, courses, etc.).  

Run the data deployment rows found within step 6.2 to populate the tables with testing student metadata, schedule events, and evaluation points.  
