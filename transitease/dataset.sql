
-- Insert data into metro_companies
INSERT INTO metro_companies (company_id, name, contact_info, password)
VALUES
    (1, 'Metro Rail Dhaka', 'dhaka@metro.com', 'securepassword1'),
    (2, 'Rapid Transit Company', 'rtc@metro.com', 'securepassword2'),
    (3, 'Urban Metro Services', 'urban@metro.com', 'securepassword3'),
    (4, 'Cityline Rapid Transit', 'cityline@metro.com', 'securepassword4');

-- Insert data into metro_routes
INSERT INTO metro_routes (route_id, name, company_id)
VALUES
    (1, 'Route A', 1),
    (2, 'Route B', 2),
    (3, 'Route C', 3),
    (4, 'Route D', 4);

-- Insert data into metro_stops for Route A
INSERT INTO metro_stops (stop_id, name, route_id, stop_number)
VALUES
    (1, 'Station 1', 1, 1),
    (2, 'Station 2', 1, 2),
    (3, 'Station 3', 1, 3),
    (4, 'Station 4', 1, 4);

-- Insert data into metro_stops for Route B
INSERT INTO metro_stops (stop_id, name, route_id, stop_number)
VALUES
    (5, 'Station 5', 2, 1),
    (6, 'Station 6', 2, 2),
    (7, 'Station 7', 2, 3),
    (8, 'Station 8', 2, 4);

-- Insert data into metro_stops for Route C
INSERT INTO metro_stops (stop_id, name, route_id, stop_number)
VALUES
    (9, 'Station 1', 3, 1),
    (10, 'Station 10', 3, 2),
    (11, 'Station 4', 3, 3),
    (12, 'Station 12', 3, 4);

-- Insert data into metro_stops for Route D
INSERT INTO metro_stops (stop_id, name, route_id, stop_number)
VALUES
    (13, 'Station 5', 4, 1),
    (14, 'Station 14', 4, 2),
    (15, 'Station 15', 4, 3),
    (16, 'Station 8', 4, 4);

-- Insert data into trains for Route A
INSERT INTO trains (train_id, company_name, route_id, company_id)
VALUES
    (1, 'Metro Rail Dhaka', 1, 1),
    (2, 'Metro Rail Dhaka', 1, 1);

-- Insert data into trains for Route B
INSERT INTO trains (train_id, company_name, route_id, company_id)
VALUES
    (3, 'Rapid Transit Company', 2, 2),
    (4, 'Rapid Transit Company', 2, 2);

-- Insert data into trains for Route C
INSERT INTO trains (train_id, company_name, route_id, company_id)
VALUES
    (5, 'Urban Metro Services', 3, 3),
    (6, 'Urban Metro Services', 3, 3);

-- Insert data into trains for Route D
INSERT INTO trains (train_id, company_name, route_id, company_id)
VALUES
    (7, 'Cityline Rapid Transit', 4, 4),
    (8, 'Cityline Rapid Transit', 4, 4),
    (9, 'Cityline Rapid Transit', 4, 4);





INSERT INTO `bus_companies` (`company_id`, `name`, `contact_info`, `password`) VALUES
(1, 'Raida', 'info@raida.com', 'password1'),
(2, 'Victor Classic', 'info@victorclassic.com', 'password2'),
(3, 'Asim', 'info@asim.com', 'password3'),
(4, 'BRTC', 'info@brtc.com', 'password4'),
(5, 'Trust', 'info@trust.com', 'securepassword5');


INSERT INTO `buses` (`bus_id`, `company_id`, `route_id`, `company_name`) VALUES
(1, 1, 1, 'Raida'),
(2, 2, 2, 'Victor Classic'),
(3, 3, 3, 'Asim'),
(4, 4, 4, 'BRTC'),
(5, 4, 4, 'BRTC'),
(6, 3, 3, 'Asim'),
(7, 3, 3, 'Asim'),
(8, 5, 5, 'Trust'),
(9, 5, 5, 'Trust'),
(10, 5, 5, 'Trust'),
(11, 5, 5, 'Trust');


INSERT INTO `stops` (`stop_id`, `name`, `route_id`, `stop_number`) VALUES
(1, 'Mirpur 10', 1, 1),
(2, 'X', 1, 2),
(3, 'Farmgate', 1, 3),
(4, 'Shahbagh', 1, 4),
(5, 'Motijheel', 1, 5),
(6, 'A', 1, 6),
(7, 'B', 1, 7),
(8, 'C', 1, 8),
(9, 'D', 1, 9),
(10, 'Y', 1, 10),
(11, 'E', 1, 11),
(12, 'Uttara', 2, 1),
(13, 'X', 2, 2),
(14, 'Banani', 2, 3),
(15, 'Farmgate', 2, 4),
(16, 'Sadarghat', 2, 5),
(17, 'V', 2, 6),
(18, 'W', 2, 7),
(19, 'XX', 2, 8),
(20, 'Y', 2, 9),
(21, 'Z', 2, 10),
(22, 'Mohammadpur', 3, 1),
(23, 'X', 3, 2),
(24, 'Science Lab', 3, 3),
(25, 'Hatirjheel', 3, 4);
INSERT INTO `routes` (`route_id`, `name`, `company_id`) VALUES
(1, 'Route 1', 1),
(2, 'Route 2', 2),
(3, 'Route 3', 3),
(4, 'Route 4', 4),
(5, 'Route 5', 5);

-- Insert data into employees table
INSERT INTO `employees` (`emp_id`, `name`, `contact_info`, `position`, `company_id`, `transit_type`) VALUES
-- Metro Company Employees
(1, 'Rahim Hossain', 'rahim@metro.com', 'Manager', 1, 'Metro'),
(2, 'Karim Ahmed', 'karim@metro.com', 'Driver', 1, 'Metro'),
(3, 'Abdul Latif', 'abdul@metro.com', 'Technician', 1, 'Metro'),
(4, 'Shafik Khan', 'shafik@metro.com', 'Ticket Collector', 1, 'Metro'),
(5, 'Nur Jahan', 'nur@metro.com', 'Cleaner', 1, 'Metro'),

(6, 'Sultan Mahmud', 'sultan@metro.com', 'Manager', 2, 'Metro'),
(7, 'Jamal Uddin', 'jamal@metro.com', 'Driver', 2, 'Metro'),
(8, 'Mokbul Rahman', 'mokbul@metro.com', 'Technician', 2, 'Metro'),
(9, 'Rashed Mia', 'rashed@metro.com', 'Ticket Collector', 2, 'Metro'),
(10, 'Rehana Akhter', 'rehana@metro.com', 'Cleaner', 2, 'Metro'),

(11, 'Shahin Alam', 'shahin@metro.com', 'Manager', 3, 'Metro'),
(12, 'Sabbir Rahman', 'sabbir@metro.com', 'Driver', 3, 'Metro'),
(13, 'Rakibul Islam', 'rakibul@metro.com', 'Technician', 3, 'Metro'),
(14, 'Tariqul Hasan', 'tariqul@metro.com', 'Ticket Collector', 3, 'Metro'),
(15, 'Shila Begum', 'shila@metro.com', 'Cleaner', 3, 'Metro'),

(16, 'Hasanuzzaman', 'hasan@metro.com', 'Manager', 4, 'Metro'),
(17, 'Faisal Mahmud', 'faisal@metro.com', 'Driver', 4, 'Metro'),
(18, 'Sazzad Hossain', 'sazzad@metro.com', 'Technician', 4, 'Metro'),
(19, 'Tanvir Alam', 'tanvir@metro.com', 'Ticket Collector', 4, 'Metro'),
(20, 'Nazma Sultana', 'nazma@metro.com', 'Cleaner', 4, 'Metro'),

-- Bus Company Employees
(21, 'Riaz Hossain', 'riaz@bus.com', 'Manager', 1, 'Bus'),
(22, 'Shafayet Karim', 'shafayet@bus.com', 'Driver', 1, 'Bus'),
(23, 'Khalid Hasan', 'khalid@bus.com', 'Conductor', 1, 'Bus'),
(24, 'Shakila Jahan', 'shakila@bus.com', 'Cleaner', 1, 'Bus'),

(25, 'Mizanur Rahman', 'mizan@bus.com', 'Manager', 2, 'Bus'),
(26, 'Tanvir Hossain', 'tanvir@bus.com', 'Driver', 2, 'Bus'),
(27, 'Mahfuzur Rahman', 'mahfuzur@bus.com', 'Conductor', 2, 'Bus'),
(28, 'Rupali Akhter', 'rupali@bus.com', 'Cleaner', 2, 'Bus'),

(29, 'Nasir Ahmed', 'nasir@bus.com', 'Manager', 3, 'Bus'),
(30, 'Sohail Rana', 'sohail@bus.com', 'Driver', 3, 'Bus'),
(31, 'Asaduzzaman', 'asaduzzaman@bus.com', 'Conductor', 3, 'Bus'),
(32, 'Sumi Akhter', 'sumi@bus.com', 'Cleaner', 3, 'Bus'),

(33, 'Rubel Hossain', 'rubel@bus.com', 'Manager', 4, 'Bus'),
(34, 'Imran Kabir', 'imran@bus.com', 'Driver', 4, 'Bus'),
(35, 'Jubair Alam', 'jubair@bus.com', 'Conductor', 4, 'Bus'),
(36, 'Nusrat Jahan', 'nusrat@bus.com', 'Cleaner', 4, 'Bus'),

(37, 'Tarek Aziz', 'tarek@bus.com', 'Manager', 5, 'Bus'),
(38, 'Shahin Mia', 'shahin@bus.com', 'Driver', 5, 'Bus'),
(39, 'Anwar Hossain', 'anwar@bus.com', 'Conductor', 5, 'Bus'),
(40, 'Mim Rahman', 'mim@bus.com', 'Cleaner', 5, 'Bus');
INSERT INTO emp_salary (emp_id, salary_amount) VALUES
-- Metro Company Salaries
(1, 50000.00),
(2, 25000.00),
(3, 30000.00),
(4, 20000.00),
(5, 15000.00),
(6, 50000.00),
(7, 25000.00),
(8, 30000.00),
(9, 20000.00),
(10, 15000.00),
(11, 50000.00),
(12, 25000.00),
(13, 30000.00),
(14, 20000.00),
(15, 15000.00),
(16, 50000.00),
(17, 25000.00),
(18, 30000.00),
(19, 20000.00),
(20, 15000.00),

-- Bus Company Salaries
(21, 45000.00),
(22, 20000.00),
(23, 18000.00),
(24, 12000.00),
(25, 45000.00),
(26, 20000.00),
(27, 18000.00),
(28, 12000.00),
(29, 45000.00),
(30, 20000.00),
(31, 18000.00),
(32, 12000.00),
(33, 45000.00),
(34, 20000.00),
(35, 18000.00),
(36, 12000.00),
(37, 45000.00),
(38, 20000.00),
(39, 18000.00),
(40, 12000.00);

