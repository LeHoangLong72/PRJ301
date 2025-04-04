CREATE DATABASE Startup_Project_Management
go

USE Startup_Project_Management
go

CREATE TABLE tblUsers(
	Username VARCHAR(50) PRIMARY KEY,
	Name VARCHAR(100) Not null,
	Password VARCHAR(255) Not null,
	Role VARCHAR(20) Not null
)
go

CREATE TABLE tblStartupProjects(
	project_id INT Primary Key,
	project_name VARCHAR(100) Not null,
	[Description] TEXT,
	[Status] VARCHAR(20) Not null,
	estimated_launch DATE Not null
)
go

-- Chèn dữ liệu vào bảng tblUsers
INSERT INTO tblUsers (Username, Name, Password, Role) VALUES
('founder01', 'Alice Johnson', 'hashed_password_123', 'Founder'),
('teammember01', 'Bob Smith', 'hashed_password_456', 'Team Member'),
('founder02', 'Charlie Brown', 'hashed_password_789', 'Founder'),
('teammember02', 'David Williams', 'hashed_password_101', 'Team Member'),
('founder03', 'Emma Davis', 'hashed_password_202', 'Founder'),
('teammember03', 'Frank Miller', 'hashed_password_303', 'Team Member'),
('founder04', 'Grace Wilson', 'hashed_password_404', 'Founder'),
('teammember04', 'Henry Moore', 'hashed_password_505', 'Team Member'),
('founder05', 'Isabella Clark', 'hashed_password_606', 'Founder'),
('teammember05', 'Jack White', 'hashed_password_707', 'Team Member');

-- Chèn dữ liệu vào bảng tblStartupProjects
INSERT INTO tblStartupProjects (project_id, project_name, Description, Status, estimated_launch) VALUES
(1, 'AI Chatbot', 'A chatbot powered by AI to enhance customer support.', 'Development', '2025-06-15'),
(2, 'E-commerce Platform', 'A platform connecting small businesses with buyers.', 'Ideation', '2025-09-01'),
(3, 'HealthTech App', 'A mobile app for tracking fitness and health.', 'Launch', '2025-04-20'),
(4, 'Blockchain Payments', 'A blockchain-based solution for secure transactions.', 'Scaling', '2025-12-10'),
(5, 'EdTech Platform', 'An online learning platform for skill development.', 'Development', '2025-08-05'),
(6, 'Smart Home IoT', 'A system to automate and secure smart homes.', 'Ideation', '2025-10-22'),
(7, 'Green Energy Startup', 'A project focused on renewable energy solutions.', 'Launch', '2025-05-30'),
(8, 'Cybersecurity Suite', 'A security tool for businesses to protect data.', 'Scaling', '2025-11-15'),
(9, 'FinTech Lending App', 'An app that simplifies loan approvals.', 'Development', '2025-07-18'),
(10, 'Food Delivery Service', 'An innovative food delivery solution.', 'Launch', '2025-03-25');






