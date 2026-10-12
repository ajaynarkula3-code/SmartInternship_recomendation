-- ========================================================
-- Smart Internship Eligibility & Recommendation System
-- MySQL Database Creation & Setup Script
-- ========================================================

CREATE DATABASE IF NOT EXISTS internship_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE internship_db;

-- Note: Hibernate JPA will automatically create and update
-- all tables on application startup when spring.jpa.hibernate.ddl-auto=update.
--
-- The application automatically seeds default accounts, sample students,
-- rich internships across 7 domains, and demonstration applications.
--
-- Default Credentials:
-- 1. Admin: admin@smartintern.com / admin123
-- 2. HR Recruiter: hr@google.com / hr123
-- 3. HR Recruiter: hr@microsoft.com / hr123
-- 4. Student (Java Dev, 8.8 CGPA): rahul@gmail.com / student123
-- 5. Student (AI/ML, 7.5 CGPA): priya@gmail.com / student123
-- 6. Student (Web Dev, 6.9 CGPA): amit@gmail.com / student123
-- 7. Student (Cloud/DevOps, 8.4 CGPA): ananya@gmail.com / student123
-- 8. Student (Cybersecurity, 9.2 CGPA): vikram@gmail.com / student123
