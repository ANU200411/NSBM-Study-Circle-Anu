CREATE DATABASE IF NOT EXISTS studycircle;
USE studycircle;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    points INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS subjects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(10) NOT NULL,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS materials (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    subject VARCHAR(50) NOT NULL,
    description TEXT,
    tags VARCHAR(100),
    file_name VARCHAR(100) NOT NULL,
    file_type VARCHAR(10) NOT NULL,
    semester INT DEFAULT 1,
    uploaded_by VARCHAR(50) DEFAULT 'Student',
    rating DECIMAL(2,1) DEFAULT 0,
    status VARCHAR(10) DEFAULT 'pending'
);

CREATE TABLE IF NOT EXISTS questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    subject VARCHAR(50) NOT NULL,
    asked_by VARCHAR(50),
    answers INT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS study_groups (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(80) NOT NULL,
    subject VARCHAR(50),
    members INT DEFAULT 0
);

INSERT INTO subjects (code, name) VALUES
('SE', 'Software Engineering'),
('DB', 'Database Systems'),
('WEB', 'Web Development'),
('NET', 'Networking');

INSERT INTO users (name, email, points) VALUES
('Kasun R.', 'kasun@example.com', 2100),
('Nimali P.', 'nimali@example.com', 1800),
('Ishara W.', 'ishara@example.com', 1200);

INSERT INTO materials (title, subject, file_name, file_type, semester, uploaded_by, rating, status) VALUES
('SQL Joins Cheat Sheet', 'Database Systems', 'sql_joins.pdf', 'PDF', 2, 'Nimali P.', 4.9, 'approved'),
('PHP & MySQL CRUD Guide', 'Web Development', 'php_crud.pdf', 'PDF', 2, 'Kasun R.', 4.8, 'approved'),
('Software Design Patterns', 'Software Engineering', 'design_patterns.pptx', 'PPTX', 3, 'Tharindu S.', 4.6, 'approved'),
('OSI Model Summary', 'Networking', 'osi_model.docx', 'DOCX', 1, 'Ishara W.', 4.5, 'approved');

INSERT INTO questions (title, subject, asked_by, answers) VALUES
('What is the difference between 2NF and 3NF?', 'Database Systems', 'Nimali P.', 6),
('How do I prevent SQL injection in PHP?', 'Web Development', 'Kasun R.', 4),
('Explain subnetting with an example', 'Networking', 'Ishara W.', 9);

INSERT INTO study_groups (name, subject, members) VALUES
('Web Dev Group', 'Web Development', 32),
('Database Revision', 'Database Systems', 18);
