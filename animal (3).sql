-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2025 at 01:07 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `animal`
--

-- --------------------------------------------------------

--
-- Table structure for table `deliveries`
--

CREATE TABLE `deliveries` (
  `deliveries_id` int(11) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `request_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `request_details_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deliveries`
--

INSERT INTO `deliveries` (`deliveries_id`, `status`, `request_date`, `request_details_id`) VALUES
(19, 'reject', '2025-03-12 01:40:55', 0),
(20, 'approve', '2025-03-12 01:41:48', 0),
(21, 'approve', '2025-03-13 20:28:08', 0),
(22, 'reject', '2025-03-14 00:14:30', 0),
(23, 'reject', '2025-03-14 01:36:22', 2),
(24, 'approve', '2025-03-14 03:10:44', 4),
(25, 'reject', '2025-03-14 11:48:28', 5),
(26, 'approve', '2025-03-14 11:50:34', 6);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `effective_date` date DEFAULT NULL,
  `date_hired` date DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `effective_date`, `date_hired`, `person_id`) VALUES
(1, '2025-03-24', '2025-03-05', 101),
(2, '2025-03-31', '2025-03-31', 102);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `person_ID` int(3) NOT NULL,
  `person_name` varchar(80) NOT NULL,
  `person_age` int(2) NOT NULL,
  `person_contact` varchar(15) NOT NULL,
  `person_address` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`person_ID`, `person_name`, `person_age`, `person_contact`, `person_address`) VALUES
(101, 'Employee1', 35, '09123456789', 'Davao'),
(102, 'Employee2', 33, '09123456788', 'Davao');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_approval`
--

CREATE TABLE `tbl_approval` (
  `approval_id` int(11) NOT NULL,
  `approval_date` date DEFAULT NULL,
  `approval_total` int(11) DEFAULT NULL,
  `hr_id` int(11) DEFAULT NULL,
  `request_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_approval_details`
--

CREATE TABLE `tbl_approval_details` (
  `approval_id` int(11) DEFAULT NULL,
  `approval_quantity` int(11) DEFAULT NULL,
  `approval_price` int(11) DEFAULT NULL,
  `approval_subtotal` int(11) DEFAULT NULL,
  `request_details_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_branch`
--

CREATE TABLE `tbl_branch` (
  `branch_id` int(3) NOT NULL,
  `branch_name` varchar(80) NOT NULL,
  `branch_address` varchar(80) NOT NULL,
  `branch_contact` varchar(80) NOT NULL,
  `branch_contact_person` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_branch`
--

INSERT INTO `tbl_branch` (`branch_id`, `branch_name`, `branch_address`, `branch_contact`, `branch_contact_person`) VALUES
(101, 'Lanang', 'Door 5, Ramona Building, Corner Guadalupe Village, Km 7 J.P. Laurel Ave, Lanang,', '0923 570 5164', 'Dr. Dunhill Crisostomo'),
(102, 'Panacan', '4MV3+9Q8, Corner of CP Garcia Highway, Panacan Ave, Buhangin, Davao City, Davao ', '0966 990 0080', 'Dr. Elaine Joy Nalang'),
(103, 'Ma-a', 'Prk 21Balicat Compund, National Highway, Maa, (Beside Sea Oil Gas Station), Dava', '0956 173 8545', 'Dr. John Isiah Duguil'),
(104, 'Tagum', 'Purok Matinabangon, Walohan Street, Magugpo North, Tagum City, Philippines', '0932 761 9944', 'Dr. Carla Louise Bartolome / Dr. Tobi Rubillos');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_courier`
--

CREATE TABLE `tbl_courier` (
  `courier_id` int(3) NOT NULL,
  `courier_name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_delivery`
--

CREATE TABLE `tbl_delivery` (
  `delivery_id` int(11) NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_permission` varchar(3) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `approval_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_delivery_details`
--

CREATE TABLE `tbl_delivery_details` (
  `delivery_details_id` int(11) NOT NULL,
  `delivery_reference_num` varchar(80) DEFAULT NULL,
  `delivery_id` int(11) DEFAULT NULL,
  `courier_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hr`
--

CREATE TABLE `tbl_hr` (
  `hr_id` int(11) NOT NULL,
  `effectivity_date` date DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_hr`
--

INSERT INTO `tbl_hr` (`hr_id`, `effectivity_date`, `employee_id`, `person_id`) VALUES
(101, '2025-03-27', 1, 101);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(80) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` varchar(80) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `product_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`product_id`, `product_name`, `quantity`, `price`, `description`, `expiration_date`, `product_type_id`) VALUES
(201, 'Paracetamol 500mg				', 50, 5, 'Pain reliever for pets', '2026-01-15', 101),
(202, 'Deworming Syrup					\r\n', 30, 13, 'Anti-parasite medication', '0000-00-00', 101),
(203, 'Shampoo for Dogs', 40, 9, 'Anti-tick and flea formula', '2026-03-10', 102),
(204, 'Pet Wipes', 100, 5, 'Gentle cleaning wipes for pets', '2027-06-18', 102),
(205, 'Dog Collar - Small', 25, 8, 'Adjustable nylon collar', NULL, 103),
(206, 'Cat Scratching Post', 15, 20, 'Durable sisal-covered post', NULL, 103),
(207, 'Dry Dog Food - Chicken', 80, 25, 'High-protein kibble', '2025-12-30', 104),
(208, 'Wet Cat Food - Tuna', 60, 3, 'Rich in Omega-3 for a healthy coat', '2025-10-22', 104),
(209, 'Dog Biscuits - Beef Flavor', 90, 7, 'Crunchy treats for training', '2025-08-15', 105),
(210, 'Catnip Treats', 50, 4, 'Irresistible snack for cats', '2025-07-12', 105);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_type`
--

CREATE TABLE `tbl_product_type` (
  `product_type_id` int(3) NOT NULL,
  `product_type_name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_product_type`
--

INSERT INTO `tbl_product_type` (`product_type_id`, `product_type_name`) VALUES
(101, 'Medicine'),
(102, 'Toiletries'),
(103, 'Accessory'),
(104, 'Food'),
(105, 'Snack');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_request`
--

CREATE TABLE `tbl_request` (
  `request_id` int(11) NOT NULL,
  `request_date` date DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_request_details`
--

CREATE TABLE `tbl_request_details` (
  `request_details_id` int(11) NOT NULL,
  `rd_selling_price` int(11) DEFAULT NULL,
  `rd_subtotal` int(11) DEFAULT NULL,
  `rd_quantity_requested` int(11) DEFAULT NULL,
  `re_remarks` varchar(80) DEFAULT NULL,
  `request_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `branch_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_request_details`
--

INSERT INTO `tbl_request_details` (`request_details_id`, `rd_selling_price`, `rd_subtotal`, `rd_quantity_requested`, `re_remarks`, `request_id`, `product_id`, `branch_id`) VALUES
(2, NULL, NULL, 32, 'Amazing', NULL, 208, 104),
(4, NULL, NULL, 12, 'Good', NULL, 203, 104),
(5, NULL, NULL, 222, 'needs more', NULL, 210, 103),
(6, NULL, NULL, 100, 'Chicken', NULL, 207, 104);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stockout`
--

CREATE TABLE `tbl_stockout` (
  `stockout_id` int(11) NOT NULL,
  `stockout_date` date DEFAULT NULL,
  `stockout_total` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_stockout_details`
--

CREATE TABLE `tbl_stockout_details` (
  `stockout_details_quantity` int(11) DEFAULT NULL,
  `stockout_quantity_price` int(11) DEFAULT NULL,
  `stockout_quantity_subtotal` int(11) DEFAULT NULL,
  `stockout_quantity_reasons` varchar(80) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `stockout_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier`
--

CREATE TABLE `tbl_supplier` (
  `supplier_id` int(3) NOT NULL,
  `supplier_name` varchar(80) NOT NULL,
  `supplier_contact` varchar(80) NOT NULL,
  `supplier_address` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`supplier_id`, `supplier_name`, `supplier_contact`, `supplier_address`) VALUES
(1, 'Suppie', '0987 654 3210', 'Manila Road, Manila Village, Manila City, Manila Del Sur');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supply`
--

CREATE TABLE `tbl_supply` (
  `supply_id` int(11) NOT NULL,
  `supply_date` date DEFAULT NULL,
  `supply_total` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supply_details`
--

CREATE TABLE `tbl_supply_details` (
  `supply_quantity` int(11) DEFAULT NULL,
  `supply_price` int(11) DEFAULT NULL,
  `sd_subtotal` int(11) DEFAULT NULL,
  `supply_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaction`
--

CREATE TABLE `tbl_transaction` (
  `transaction_id` int(11) NOT NULL,
  `request_details_id` int(11) DEFAULT NULL,
  `approval_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'employee'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `employee_id`, `role`) VALUES
(101, 'hr', '$2y$10$4r6UtE53lxqH4NXEliOreeCMim65CwPkkikyHTqe5gglkaWjzNCtu', 1, 'hr'),
(102, 'employee', '$2y$10$aYT3so9oFFC7Zz66NNX7B.Psro5FprkLwwF6BTWLYWpERDixabGAa', 2, 'employee');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `deliveries`
--
ALTER TABLE `deliveries`
  ADD PRIMARY KEY (`deliveries_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`person_ID`);

--
-- Indexes for table `tbl_approval`
--
ALTER TABLE `tbl_approval`
  ADD PRIMARY KEY (`approval_id`),
  ADD KEY `hr_id` (`hr_id`),
  ADD KEY `request_id` (`request_id`);

--
-- Indexes for table `tbl_approval_details`
--
ALTER TABLE `tbl_approval_details`
  ADD KEY `approval_id` (`approval_id`),
  ADD KEY `request_details_id` (`request_details_id`);

--
-- Indexes for table `tbl_branch`
--
ALTER TABLE `tbl_branch`
  ADD PRIMARY KEY (`branch_id`);

--
-- Indexes for table `tbl_courier`
--
ALTER TABLE `tbl_courier`
  ADD PRIMARY KEY (`courier_id`);

--
-- Indexes for table `tbl_delivery`
--
ALTER TABLE `tbl_delivery`
  ADD PRIMARY KEY (`delivery_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `approval_id` (`approval_id`);

--
-- Indexes for table `tbl_delivery_details`
--
ALTER TABLE `tbl_delivery_details`
  ADD PRIMARY KEY (`delivery_details_id`),
  ADD KEY `delivery_id` (`delivery_id`),
  ADD KEY `courier_id` (`courier_id`);

--
-- Indexes for table `tbl_hr`
--
ALTER TABLE `tbl_hr`
  ADD PRIMARY KEY (`hr_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `person_id` (`person_id`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `product_type_id` (`product_type_id`);

--
-- Indexes for table `tbl_product_type`
--
ALTER TABLE `tbl_product_type`
  ADD PRIMARY KEY (`product_type_id`);

--
-- Indexes for table `tbl_request`
--
ALTER TABLE `tbl_request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `tbl_request_details`
--
ALTER TABLE `tbl_request_details`
  ADD PRIMARY KEY (`request_details_id`),
  ADD KEY `request_id` (`request_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `fk_branch` (`branch_id`);

--
-- Indexes for table `tbl_stockout`
--
ALTER TABLE `tbl_stockout`
  ADD PRIMARY KEY (`stockout_id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `tbl_stockout_details`
--
ALTER TABLE `tbl_stockout_details`
  ADD KEY `product_id` (`product_id`),
  ADD KEY `stockout_id` (`stockout_id`);

--
-- Indexes for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `tbl_supply`
--
ALTER TABLE `tbl_supply`
  ADD PRIMARY KEY (`supply_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `tbl_supply_details`
--
ALTER TABLE `tbl_supply_details`
  ADD KEY `supply_id` (`supply_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `request_details_id` (`request_details_id`),
  ADD KEY `approval_id` (`approval_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `employee_id` (`employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `deliveries`
--
ALTER TABLE `deliveries`
  MODIFY `deliveries_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_request_details`
--
ALTER TABLE `tbl_request_details`
  MODIFY `request_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_ID`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_approval`
--
ALTER TABLE `tbl_approval`
  ADD CONSTRAINT `tbl_approval_ibfk_1` FOREIGN KEY (`hr_id`) REFERENCES `tbl_hr` (`hr_id`),
  ADD CONSTRAINT `tbl_approval_ibfk_2` FOREIGN KEY (`request_id`) REFERENCES `tbl_request` (`request_id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_approval_details`
--
ALTER TABLE `tbl_approval_details`
  ADD CONSTRAINT `tbl_approval_details_ibfk_1` FOREIGN KEY (`approval_id`) REFERENCES `tbl_approval` (`approval_id`),
  ADD CONSTRAINT `tbl_approval_details_ibfk_2` FOREIGN KEY (`request_details_id`) REFERENCES `tbl_request_details` (`request_details_id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_delivery`
--
ALTER TABLE `tbl_delivery`
  ADD CONSTRAINT `tbl_delivery_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `tbl_delivery_ibfk_2` FOREIGN KEY (`approval_id`) REFERENCES `tbl_approval` (`approval_id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_delivery_details`
--
ALTER TABLE `tbl_delivery_details`
  ADD CONSTRAINT `tbl_delivery_details_ibfk_1` FOREIGN KEY (`delivery_id`) REFERENCES `tbl_delivery` (`delivery_id`),
  ADD CONSTRAINT `tbl_delivery_details_ibfk_2` FOREIGN KEY (`courier_id`) REFERENCES `tbl_courier` (`courier_id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_hr`
--
ALTER TABLE `tbl_hr`
  ADD CONSTRAINT `tbl_hr_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `tbl_hr_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_ID`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`product_type_id`) REFERENCES `tbl_product_type` (`product_type_id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_request`
--
ALTER TABLE `tbl_request`
  ADD CONSTRAINT `tbl_request_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `tbl_request_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `tbl_branch` (`branch_id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_request_details`
--
ALTER TABLE `tbl_request_details`
  ADD CONSTRAINT `fk_branch` FOREIGN KEY (`branch_id`) REFERENCES `tbl_branch` (`branch_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_request_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_stockout`
--
ALTER TABLE `tbl_stockout`
  ADD CONSTRAINT `tbl_stockout_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_stockout_details`
--
ALTER TABLE `tbl_stockout_details`
  ADD CONSTRAINT `tbl_stockout_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`product_id`),
  ADD CONSTRAINT `tbl_stockout_details_ibfk_2` FOREIGN KEY (`stockout_id`) REFERENCES `tbl_stockout` (`stockout_id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_supply`
--
ALTER TABLE `tbl_supply`
  ADD CONSTRAINT `tbl_supply_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `tbl_supply_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `tbl_supplier` (`supplier_id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_supply_details`
--
ALTER TABLE `tbl_supply_details`
  ADD CONSTRAINT `tbl_supply_details_ibfk_1` FOREIGN KEY (`supply_id`) REFERENCES `tbl_supply` (`supply_id`),
  ADD CONSTRAINT `tbl_supply_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `tbl_product` (`product_id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  ADD CONSTRAINT `tbl_transaction_ibfk_1` FOREIGN KEY (`request_details_id`) REFERENCES `tbl_request_details` (`request_details_id`),
  ADD CONSTRAINT `tbl_transaction_ibfk_2` FOREIGN KEY (`approval_id`) REFERENCES `tbl_approval` (`approval_id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
