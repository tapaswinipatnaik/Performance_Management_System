SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `department_list` (
  `id` int(30) NOT NULL,
  `department` varchar(200) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `department_list` (`id`, `department`, `description`) VALUES
(1, 'IT Department', 'Information Technology Department'),
(2, 'Sample  Departement', 'Sample Only');

CREATE TABLE `designation_list` (
  `id` int(30) NOT NULL,
  `designation` varchar(200) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `designation_list` (`id`, `designation`, `description`) VALUES
(1, 'Sr. Programmer', 'Senior Programmer'),
(2, 'Jr. Programmer', 'Junior Programmer'),
(3, 'Project Manager', 'Project Manager'),
(4, 'QA/QC Analyst', 'Quality Assurance and Quality Control Analyst');


CREATE TABLE `employee_list` (
  `id` int(30) NOT NULL,
  `employee_id` varchar(50) NOT NULL UNIQUE,
  `firstname` varchar(200) NOT NULL,
  `middlename` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL UNIQUE,
  `password` text NOT NULL,
  `department_id` int(30) NOT NULL,
  `designation_id` int(30) NOT NULL,
  `evaluator_id` int(30) NOT NULL,
  `avatar` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `employee_list` (`id`, `employee_id`, `firstname`, `middlename`, `lastname`, `email`, `password`, `department_id`, `designation_id`, `evaluator_id`, `avatar`, `date_created`) VALUES
(1, 'VTS2025227', 'Tapaswini', '', 'Patnaik', 'tapu@gmail.com', '1254737c076cf867dc53d60a0364f38e', 1, 2, 1, '1607134500_avatar.jpg', '2020-12-05 10:15:38'),
(2, 'VTS2025226', 'J', '', 'Manasa', 'manasa@gmail.com', 'a88df23ac492e6e2782df6586a0c645f', 1, 2, 1, 'no-image-available.png', '2021-03-02 13:52:48');


CREATE TABLE `evaluator_list` (
  `id` int(30) NOT NULL,
  `employee_id` varchar(50) NOT NULL UNIQUE,
  `firstname` varchar(200) NOT NULL,
  `middlename` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL UNIQUE,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `evaluator_list` (`id`, `employee_id`, `firstname`, `middlename`, `lastname`, `email`, `password`, `avatar`, `date_created`) VALUES
(1, '', 'K', '', 'Charan', 'charan@sample.com', '4744ddea876b11dcb1d169fadf494418', '1607136060_47446233-clean-noir-et-gradient-sombre-image-de-fond-abstrait-.jpg', '2020-12-05 10:41:34');


CREATE TABLE `ratings` (
  `id` int(30) NOT NULL,
  `employee_id` int(30) NOT NULL UNIQUE,
  `task_id` int(30) NOT NULL,
  `evaluator_id` int(30) NOT NULL,
  `efficiency` int(11) NOT NULL,
  `timeliness` int(11) NOT NULL,
  `quality` int(11) NOT NULL,
  `accuracy` int(11) NOT NULL,
  `remarks` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `ratings` (`id`, `employee_id`, `task_id`, `evaluator_id`, `efficiency`, `timeliness`, `quality`, `accuracy`, `remarks`, `date_created`) VALUES
(2, 1, 1, 1, 5, 4, 5, 5, 'Sample', '2020-12-05 15:18:40');



CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `cover_img` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `address`, `cover_img`) VALUES
(1, 'Employee Performance Evaluation System', 'info@sample.comm', '+6948 8542 623', '2102  Caldwell Road, Rochester, New York, 14608', '');



CREATE TABLE `task_list` (
  `id` int(30) NOT NULL,
  `task` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `employee_id` varchar(30) NOT NULL UNIQUE,
  `due_date` date NOT NULL,
  `completed` date NOT NULL,
  `status` int(1) NOT NULL COMMENT '0=pending, 1=on-progress,3=Completed',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `task_list` (`id`, `task`, `description`, `employee_id`, `due_date`, `completed`, `status`, `date_created`) VALUES
(1, 'Sample Task 1', '	Sample Only	', VTS2025226, '2020-12-02', '0000-00-00', 2, '2020-12-05 11:06:15'),
(2, 'Sample Task 2', '&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed gravida, magna eu sagittis venenatis, lorem tellus mollis tellus, viverra facilisis metus odio vel dui. Sed posuere interdum ultrices. Pellentesque blandit enim in condimentum pretium. Suspendisse id tortor sit amet augue rutrum condimentum. Fusce ac mattis purus, eget vehicula sem. Maecenas sit amet orci id lorem tristique tempor. Nullam iaculis quis velit at dapibus. Nullam scelerisque, metus vitae feugiat aliquam, risus turpis pellentesque justo, vitae varius urna leo vitae nisl. Pellentesque viverra ipsum et diam blandit varius. Suspendisse blandit ex vitae hendrerit volutpat. Nulla fermentum dolor at lorem accumsan, nec lacinia mi pellentesque. Mauris ac augue vel elit lobortis maximus.&lt;/span&gt;																									', 1, '2020-12-24', '0000-00-00', 0, '2020-12-05 13:09:05');



CREATE TABLE `task_progress` (
  `id` int(11) NOT NULL,
  `task_id` int(30) NOT NULL,
  `progress` text NOT NULL,
  `is_complete` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0=no,1=Yes',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `task_progress` (`id`, `task_id`, `progress`, `is_complete`, `date_created`) VALUES
(1, 1, '&lt;p&gt;Sample Progress&lt;/p&gt;', 0, '2024-12-05 11:29:48'),
(2, 1, '&lt;p&gt;Sample Progress&lt;/p&gt;', 0, '2024-12-05 11:32:15'),
(3, 1, '&lt;p&gt;Sample 2&lt;/p&gt;', 0, '2024-12-05 11:34:18'),
(4, 1, 'asdasd', 0, '2024-12-05 11:34:31'),
(5, 1, '&lt;p&gt;complete&lt;/p&gt;', 1, '2024-12-05 11:54:13');


CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `avatar`, `date_created`) VALUES
(1, 'Administrator', '', 'admin@admin.com', '0192023a7bbd73250516f069df18b500', '1607135820_avatar.jpg', '2024-11-26 10:57:04'),
(2, 'K', 'Charan', 'charan@sample.com', 'cd74fae0a3adf459f73bbf187607ccea', 'no-image-available.png', '2024-03-02 13:53:17');


ALTER TABLE `department_list`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `designation_list`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `employee_list`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `evaluator_list`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `task_list`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `task_progress`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `department_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `designation_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE `employee_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `evaluator_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `ratings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `task_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `task_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

