-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2024 at 08:10 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `thumbnail` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`, `thumbnail`) VALUES
(1, 'SKIN 1004', '/media/static/20ccab9a-67e8-4358-809f-4f93b59d6fc9.png');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_item`
--

CREATE TABLE `cart_item` (
  `id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Serum');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `content`, `created_at`, `product_id`, `user_id`) VALUES
(1, 'hi', '2024-04-08 00:47:39', 4618230, 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `uploaded_at` datetime DEFAULT NULL,
  `uploaded_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `link`, `name`, `type`, `uploaded_at`, `uploaded_by`) VALUES
('07b9c801-6ee2-4f93-9892-52600b16db37', '/media/static/07b9c801-6ee2-4f93-9892-52600b16db37.jpeg', 'file', 'jpeg', '2024-04-07 01:29:09', NULL),
('20ccab9a-67e8-4358-809f-4f93b59d6fc9', '/media/static/20ccab9a-67e8-4358-809f-4f93b59d6fc9.png', 'file', 'png', '2024-04-07 01:25:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `uploaded_at` datetime NOT NULL,
  `uploaded_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `detail` text DEFAULT NULL,
  `risk_level` int(10) DEFAULT NULL,
  `uses` varchar(255) DEFAULT NULL,
  `guide` text DEFAULT NULL,
  `skin_compatibility` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `detail`, `risk_level`, `uses`, `guide`, `skin_compatibility`) VALUES
(1, 'Water', 'Là thành phần mỹ phẩm được sử dụng phổ biến, nước gần như luôn luôn được liệt kê đầu tiên trong bảng thành phần trên một nhãn nguyên liệu vì nó thường là thành phần có nồng độ cao nhất trong công thức. Nước có thể không phải là một thành phần quan trọng cho da. Chỉ cần 10% nồng độ nước trong lớp ngoài của da là cần thiết cho sự mềm mại và tính dẻo dai trong phần này của lớp biểu bì. Các nghiên cứu so sánh hàm lượng nước trong da khô so với bình thường hoặc da nhờn không tìm thấy sự khác biệt có ý nghĩa thống kê về mức độ ẩm giữa chúng. Hơn nữa, nước quá nhiều có thể là một vấn đề đối với da bởi vì nó có thể phá vỡ các chất thiết yếu trong các lớp bề mặt của da mà giữ cho nó còn nguyên vẹn, mịn màng, và trông khỏe mạnh. Ví dụ, hãy nhớ lại da ngón tay bạn bị \"móp\" khi bạn tắm quá lâu', 1, 'Dễ dàng sử dụng', 'Không có hướng dẫn đặc biệt', 'Mọi loại da'),
(2, 'Asiaticoside', NULL, 0, NULL, NULL, NULL),
(3, 'Asiatic Acid', NULL, 0, NULL, NULL, NULL),
(4, 'Madecassic Acid', NULL, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `modified_at` datetime NOT NULL,
  `receiver_address` varchar(255) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `receiver_phone` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `total_amount` bigint(20) DEFAULT NULL,
  `buyer_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` bigint(20) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `description` text DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `slug` varchar(600) NOT NULL,
  `status` int(11) DEFAULT 0,
  `thumbnail` varchar(255) DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `modified_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `description` text DEFAULT NULL,
  `modified_at` datetime NOT NULL,
  `published_at` datetime DEFAULT NULL,
  `slug` varchar(600) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `modified_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `description` text DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT NULL,
  `name` varchar(300) NOT NULL,
  `price` bigint(20) DEFAULT NULL,
  `product_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`product_images`)),
  `quantity` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `total_sold` int(11) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `ingredient` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `created_at`, `description`, `is_available`, `name`, `price`, `product_images`, `quantity`, `slug`, `total_sold`, `brand_id`, `ingredient`) VALUES
(4618230, NULL, '<p style=\"line-height: 1.5;\">Em tinh chất này thì quá nổi của hãng Skin1004 rồi. Với thành phần đúng như tên của em tinh chất Rau má Skin1004 Madagascar Centella Ampoule: chứa 100% chiết xuất cô đặc từ Rau Má vùng Madagascar – nơi được mệnh danh là hòn đảo đã có mặt lâu đời nhất trên Trái Đất.</p><p style=\"line-height: 1.5;\"></p><p style=\"line-height: 1.5;\">Trong thành phần bao gồm các hoạt chất như sau:</p><p style=\"line-height: 1.5;\">- 30% Asiaticoside: Cải thiện sự cân bằng lượng dầu – nước, giúp tổng hợp Collagen ở tầng biểu bì.</p><p style=\"line-height: 1.5;\">- 30% Asiatic Acid: Củng cố hàng rào bảo vệ tự nhiên của da, làm dịu làn da mẫn cảm, chống oxy hóa và góp phần cải thiện độ đàn hồi của da.</p><p style=\"line-height: 1.5;\">- 40% Madecassic Acid: làm dịu làn da mệt mỏi, cải thiện các thương tổn do mụn để lại, làm lành làn da bị tổn thương.</p><p style=\"line-height: 1.5;\"></p><p style=\"line-height: 1.5;\">Em này cấp ẩm cực tốt và còn làm dịu da, dưỡng da dành cho nhữung ngày lười thì có thể chỉ sử dụng mỗi em này rồi đi ngủ luôn cũng được. Chất thấm nhanh và không bết rít trên da. Phù hợp cho mọi loại da luôn nha!</p>', 1, 'Skin1004 Madagascar Centella Ampoule 55ml', 310000, '[\"/media/static/07b9c801-6ee2-4f93-9892-52600b16db37.jpeg\"]', 10, 'skin1004-madagascar-centella-ampoule-55ml', 0, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `description` text DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT NULL,
  `name` varchar(300) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `product_images` text DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `brand_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `product_id` bigint(20) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`product_id`, `category_id`) VALUES
(4618230, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_ingredient`
--

CREATE TABLE `product_ingredient` (
  `product_id` bigint(20) NOT NULL,
  `ingredient_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_ingredient`
--

INSERT INTO `product_ingredient` (`product_id`, `ingredient_id`) VALUES
(4618230, 1),
(4618230, 2),
(4618230, 3),
(4618230, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `address`, `created_at`, `email`, `full_name`, `password`, `phone`, `roles`, `status`) VALUES
(1, NULL, '2024-04-06 15:13:06', 'duy@gmail.com', 'Trần Bảo Duy', '$2a$10$L3F2QzC7N.HXdwBz3ut0o.fxK0owJqXoV6.xv0bHvegIBgnaZ8UtW', '0987654321', '[\"USER\", \"ADMIN\"]', 1),
(2, NULL, '2024-04-06 15:47:25', 'caominh26032003@gmail.com', 'Cao Minh', '$2a$10$l7PikzHIZUFsxCweVG1DjefqNw.UYwQQ1JNxeiroGNSk5schIZEIa', '0987654321', '[\"USER\"]', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `full_name` varchar(200) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`roles`)),
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_rdxh7tq2xs66r485cc8dkxt77` (`name`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjcyd5wv4igqnw413rgxbfu4nv` (`product_id`),
  ADD KEY `FKjnaj4sjyqjkr4ivemf9gb25w` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKm1rmnfcvq5mk26li4lit88pc5` (`product_id`),
  ADD KEY `FK8kcum44fvpupyw6f5baccx25c` (`user_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_4pgw8w3qp244ujvcs4wowiv3x` (`link`),
  ADD KEY `FK6q9lwl1j82nmm8n75cxcuxc1p` (`uploaded_by`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uploaded_by` (`uploaded_by`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4odf7l3wq1f4up72w6cc0ybqj` (`buyer_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKt4dc2r9nbvbujrljv3e23iibt` (`order_id`),
  ADD KEY `FK551losx9j75ss5d6bfsqvijna` (`product_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK93o2xaw90541rp5xaf29hsgd2` (`created_by`),
  ADD KEY `FKodidrykmej58d3xy9ynanq3vw` (`modified_by`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `modified_by` (`modified_by`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKs6cydsualtsrprvlf2bb3lcam` (`brand_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD KEY `FKkud35ls1d40wpjb5htpp14q4e` (`category_id`),
  ADD KEY `FK2k3smhbruedlcrvu6clued06x` (`product_id`);

--
-- Indexes for table `product_ingredient`
--
ALTER TABLE `product_ingredient`
  ADD PRIMARY KEY (`product_id`,`ingredient_id`),
  ADD KEY `ingredient_id` (`ingredient_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `FKjcyd5wv4igqnw413rgxbfu4nv` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKjnaj4sjyqjkr4ivemf9gb25w` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK8kcum44fvpupyw6f5baccx25c` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKm1rmnfcvq5mk26li4lit88pc5` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `FK6q9lwl1j82nmm8n75cxcuxc1p` FOREIGN KEY (`uploaded_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK4odf7l3wq1f4up72w6cc0ybqj` FOREIGN KEY (`buyer_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `FK551losx9j75ss5d6bfsqvijna` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKt4dc2r9nbvbujrljv3e23iibt` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FK93o2xaw90541rp5xaf29hsgd2` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKodidrykmej58d3xy9ynanq3vw` FOREIGN KEY (`modified_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FKs6cydsualtsrprvlf2bb3lcam` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`);

--
-- Constraints for table `product_category`
--
ALTER TABLE `product_category`
  ADD CONSTRAINT `FK2k3smhbruedlcrvu6clued06x` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FKkud35ls1d40wpjb5htpp14q4e` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `product_ingredient`
--
ALTER TABLE `product_ingredient`
  ADD CONSTRAINT `product_ingredient_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `product_ingredient_ibfk_2` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
