-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th12 31, 2019 lúc 02:32 AM
-- Phiên bản máy phục vụ: 5.7.26
-- Phiên bản PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `backend2_prj`
--
CREATE DATABASE IF NOT EXISTS `backend2_prj` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `backend2_prj`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

DROP TABLE IF EXISTS `bills`;
CREATE TABLE IF NOT EXISTS `bills` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bills_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id`, `user_id`, `total_price`, `created_at`, `updated_at`) VALUES
(2, 1, 280, '2019-12-17 12:13:14', '2019-12-17 12:13:14'),
(3, 1, 990, '2019-12-17 12:15:08', '2019-12-17 12:15:08'),
(4, 1, 110, '2019-12-17 12:20:50', '2019-12-17 12:20:50'),
(5, 1, 280, '2019-12-18 02:25:59', '2019-12-18 02:25:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_details`
--

DROP TABLE IF EXISTS `bill_details`;
CREATE TABLE IF NOT EXISTS `bill_details` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bill_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bill_details_bill_id_foreign` (`bill_id`),
  KEY `bill_details_product_id_foreign` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bill_details`
--

INSERT INTO `bill_details` (`id`, `bill_id`, `product_id`, `quantity`, `price`) VALUES
(2, 2, 1, 2, 280),
(3, 3, 2, 1, 850),
(4, 3, 3, 1, 140),
(5, 4, 4, 1, 110),
(6, 5, 3, 2, 280);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `parent_id`) VALUES
(1, 'ADIDAS', 9),
(2, 'NIKE', 9),
(3, 'BALENCIAGA', 9),
(4, 'VANS', 9),
(6, 'JIMMY CHOO', 10),
(7, 'MANOLO BLAHNIK', 10),
(8, 'GAFA', 10),
(9, 'MEN', 0),
(10, 'WOMEN', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_product`
--

DROP TABLE IF EXISTS `category_product`;
CREATE TABLE IF NOT EXISTS `category_product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category_product`
--

INSERT INTO `category_product` (`product_id`, `category_id`) VALUES
(1, 2),
(2, 3),
(3, 1),
(4, 1),
(5, 3),
(6, 3),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 2),
(15, 2),
(16, 2),
(17, 3),
(18, 2),
(19, 3),
(20, 3),
(21, 3),
(38, 4),
(39, 4),
(40, 4),
(41, 4),
(42, 4),
(43, 4),
(44, 4),
(45, 4),
(46, 4),
(47, 4),
(48, 4),
(49, 4),
(50, 4),
(51, 4),
(52, 4),
(53, 7),
(54, 7),
(55, 7),
(56, 7),
(57, 7),
(58, 7),
(59, 7),
(60, 7),
(61, 7),
(62, 7),
(63, 7),
(64, 7),
(65, 7),
(66, 7),
(67, 7),
(68, 6),
(69, 6),
(70, 6),
(71, 6),
(72, 6),
(73, 6),
(74, 6),
(75, 6),
(76, 6),
(77, 6),
(78, 6),
(79, 6),
(80, 6),
(81, 6),
(82, 6),
(83, 8),
(84, 8),
(85, 8),
(86, 8),
(87, 8),
(88, 8),
(89, 8),
(90, 8),
(91, 8),
(92, 8),
(93, 8),
(94, 8),
(95, 8),
(96, 8),
(97, 8),
(104, 1),
(105, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_product_id_foreign` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `created_at`, `updated_at`, `comment_content`, `product_id`) VALUES
(1, '2019-12-06 06:59:41', '2019-12-06 06:59:41', 'Đẹp !!!', 1),
(2, '2019-12-17 05:50:33', '2019-12-17 05:50:33', 'Đúng giá', 1),
(3, '2019-12-17 19:24:43', '2019-12-17 19:24:43', 'aaaaaa', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_12_06_133228_create_comments_table', 1),
(4, '2019_12_17_074243_create_bills_table', 2),
(5, '2019_12_17_074604_create_billdetails_table', 3),
(6, '2019_12_17_120553_create_bills_table', 4),
(7, '2019_12_17_120754_create_bill_details_table', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_price`, `product_description`, `product_image`) VALUES
(1, 'Nike Jordan Mars 28', '139.95', 'Drawing inspiration from four classic Air Jordans, the Jordan Mars 270 is a modern-day remix that offers a heavy dose of heritage, plus an enormous Max Air unit and springy foam for non-stop comfort.', 'nike-jordan-mars-270.jpg'),
(2, 'Balenciaga Triple S', '850.00', 'Bold Balenciaga collectible sneakers, Complex 3-layered sole, Embroidered size at the edge of the toe, Embroidered logo on the side, Embossed logo in the back, Triple S rubber branding on the tongue.', 'blg-triple-s.jpg'),
(3, 'Adidas Pulseboost Hd Winter', '140.00', 'Train year-round, even when the weather is trying to force you indoors. These low-profile running shoes are designed with a Continental™ Rubber outsole for optimal traction on wet or slippery streets. They have a knit upper with built-in areas of support in the forefoot and midfoot. High-density cushioning provides a stable feel.', 'adidas-pulseboost-hd-winter.jpg'),
(4, 'Adidas Streetball', '110.00', 'Born for basketball and transformed for street style, the Streetball stomps onto the scene in an outrageous look. The high-volume shape and collage of layers on the upper are pure \'90s. The leather shoes are detailed with perforated quarters, an oversize tongue and a sculpted outsole.', 'adidas-streetball.png'),
(5, 'Balenciaga Speed Trainers', '710.00', 'Sock-like design: eliminates the laces’ pressure, High sock with Balenciaga logo, Made of technical knit developped exclusively by Balenciaga development hub, with static structure property, Ultra-flexible molded sole unit, Made in Italy.', 'blg-speed-trainers.jpg'),
(6, 'Balenciaga Pool Slide Sandals', '295.00', 'Thermoplastic polyuretane, Slide Sandals, Molded rubber footbeds, Allover logo wave printed, Balenciaga embossing on outsole, Wipe with a soft and clean cloth, Made in Italy.', 'blg-pool-slide-sandals.jpg'),
(7, 'Adidas Torsion X', '180.00', 'The Torsion X is new for Lifestyle on adidas.com. Scroll through the pictures above to see more details from different angles. If you’ve tried out the Torsion X before, leave a review below to let us know what you thought.', 'adidas-torsion-x.jpg'),
(8, 'Adidas Ozweego', '110.00', 'These shoes take late-\'90s and early-\'00s style in a new direction, fusing retro elements with futuristic design lines. They come in a mix of mesh, suede and smooth TPU. Targeted support in the forefoot and heel makes for a supremely comfortable ride.', 'adidas-ozweego.jpg'),
(9, 'Adidas Falcon', '100.00', 'Flaunt a carefree, rebellious vibe inspired by retro trends. These chunky shoes show off a distinctly \'90s look with eye-catching colors and a layered build. A bulky midsole stays true to the era and feels super-stable underfoot.', 'adidas-falcon.jpg'),
(10, 'Adidas Nite Jogger', '140.00', 'The Nite Jogger is new for Lifestyle on adidas.com. Scroll through the pictures above to see more details from different angles. If you’ve tried out the Nite Jogger before, leave a review below to let us know what you thought.', 'adidas-nite-jogger.jpg'),
(11, 'Adidas Adilette Comfort Slides', '35.00', 'Since 1972, the Adilette has reigned as a casual go-to, whether you\'re heading to the beach or coming off the pitch. Still going strong, these slip-ons have a contoured footbed for cruising comfort. The shimmery bandage upper flashes 3-Stripes across the top for an extra dose of sporty style.', 'adidas-adilette-comfort-slides.jpg'),
(12, 'Adidas Zx Torsion', '140.00', 'The ZX sneaker series reset the running scene in the \'80s with a high-tech approach based on the physics of human motion. Fusing nostalgia with modern innovation, these streetwear shoes revive the retro style with fresh materials. Made of mesh and suede, they feature energy-returning cushioning and a Torsion bar to deliver extra stability. Reflective details add a light-catching flash.', 'adidas-zx-torsion.jpg'),
(13, 'Adidas Yung-1 ', '120.00', 'The Yung-1 brings back the dynamic wavy forms and richly textured looks of 2000s-era sneakers. These shoes dress the chunky retro style with colors and details inspired by \'90s-era handheld gaming consoles. They\'re made with a wide fit to give extra space and comfort.', 'adidas-yung1.jpg'),
(14, 'Nike Air Max 720 SE', '164.95', 'Boasting Nike\'s tallest Air unit to date, the Nike Air Max 720 SE offers 360 degrees of cushioning and then some. With a jaw-dropping outsole and moulded upper, this shoe brings future style to the present day.', 'nike-air-max-720.jpg'),
(15, 'Nike Air Max 97', '94.95', 'The Nike Air Max 97 reimagines an iconic running shoe into everyday kicks for kids. With classic water ripple-inspired lines, Max Air cushioning and a durable design, it\'s all about bringing a \'90s fave to a new generation.', 'nike-air-max-97.jpg'),
(16, 'Nike P-6000', '104.95', 'A mash-up of Pegasus\' past, the Nike P-6000 pushes into the future with a mash-up of breathable, two-tone mesh, Metallic Silver accents and a toggle lacing system. Drawing on the design of the Nike Pegasus 25 and 2006, its running aesthetic goes a little crazy, while still providing all-day comfort for the streets.\r\n', 'nike-p6000.jpg'),
(17, 'Balenciaga Speed Lace Up', '765.00', 'Iconic Balenciaga athletic sneakers, Decorative laces, Ultra-flexible molded sole unit, “No Memory” sole technology, Ergonomic 10mm arch, Extra light: 240g, nearly barefoot feel, White logo printed on exterior.', 'blg-speed-lace-up.jpg'),
(18, 'Nike Zoom 2K', '79.95', 'Inspired by running silhouettes from the early 2000s, the Nike Zoom 2K is re-imagining the golden age of running sneakers. A classic Zoom bag takes it back to where it began, while the rubber wings that wrap the outsole push the design into the future.', 'nike-zoom-2k.jpg'),
(19, 'Balenciaga BB Mulel Pumps', '1150.00', 'Crushed velvet introduced in Winter 18 on ready-to-wear, Rhinestones strassed silver BB logo, Elongated pointy toe, Black leather insole and outsole, 80 mm / 3.14 inches arch, Made in Italy.', 'blg-mule-pumps.jpg'),
(20, 'Balenciaga Track 2 Trainers', '895.00', 'Track.2 is a 100% non leather sneaker made of mesh and nylon, Track.2 rubber logo attached to the shoe tongue, Rubber logo on the exterior, Logo embossed on foam counter back, BB embossed on outsole’s front, Articulated upper made of 176 panels, Metallic mesh on sides, Additional metallized piece on interior face, 1 pair of laces, Back pull-on tab, Dynamic sole design with an augmented back to propel feet forward, Washed effect for a well-worn look.', 'blg-track-2.jpg'),
(21, 'Balenciaga Santiag Booties', '1090.00', 'Calfskin suede, Santiag boot, Zipped on interior, Cinched toe, 40mm heel, Loop at back, Western yoke stitched on upper, Black leather outsole, Made in Italy, Wipe with a soft clean cloth.', 'blg-santiag-booties.jpg'),
(38, 'Vans Authentic Core Classic', '26000.00', 'I love these shoes, but I\'m not sure that I\'d recommend them for hours and hours of standing. If you have a job that expects you to stand for eight hours, I\'d probably get extra support arches to slip into these. Otherwise, they\'re great. It\'s a simple, clean look, and they are comfortable. I recommend them.', 'Vans Authentic Core Classic Sneakers.jpg'),
(39, 'Vans Half Cab Unisex-Adult', '55000.00', 'If you are ordering a smaller size, below a 9, be warned the tongue inside the shoe is still quite bulky as if for a larger size and as a result it can take some wearing in before it gets comfy and doesn\'t feel like someone shoved a pillow in your shoe... Otherwise they look nice and are quite comfy and what you would expect for vans shoes.', 'Vans Half Cab Unisex Adult Casual.jpg'),
(40, 'Vans Authentic Pig Suede', '45000.00', 'Kiểu dáng gọn nhẹ năng động kết hợp cùng chất da cao cấp mềm mại có “năng lực” chống nước và bụi bẩn độc đáo giúp cho người mang có được những trải nghiệm tiện ích và thú vị. Đặc biệt, gam màu vàng “chói chang” khi mix-match với bất kì phong cách nào đều mang đến sự nổi bật và cuốn hút.', 'Vans Authentic Pig Suede.jpg'),
(41, 'Vans Authentic Golden Coast', '15000.00', 'Familiar Checkerboard design with Vintage black / white ivory tone. Especially, the entire area around the neck of the shoe to the tongue of the tongue is black border creating a different highlight for the product. This must be a trendy item for Vans fans.', 'Vans Authentic Golden Coast.jpg'),
(42, 'Vans Classic ComfyCush', '11000.00', '\r\nApply ComfyCush technology to Authentic Vans shoes with traditional design and elegant white. Vans ComfyCush Authentic has brought users a differentiated experience with extremely light weight. Especially the whole interior improvement of the shoes, helping you be more flexible and easier to move.', 'Vans Classic ComfyCush Authentic.jpg'),
(43, 'Vans Authentic Gum Bumper', '54000.00', 'The bright red tone and striking with the tip of the rubber sole covered with Gum material helps the shoes become more different. The traditional Vans Authentic design with soft, lightweight Canvas fabric brings you quality products from the inside out.', 'Vans Authentic Gum Bumper.jpg'),
(44, 'Vans Check Foxing Authentic', '12000.00', 'With the classic style of the Vans Authentic line, this is a new, more beautiful variation with the intersection of the white shoe body and white sole is a familiar Checkerboard border. Soft lightweight Canvas material and durable rubber shoe soles help wearers more gentle, more comfortable steps.', 'Vans Check Foxing Authentic.jpg'),
(45, 'Vans Authentic Mix Checker', '13000.00', 'With outstanding red tone combined with prominent checkered patterns distributed throughout the body, it will bring you the best experience.', 'Vans Authentic Mix Checker.jpg'),
(46, 'Vans Authentic 44 DX', '14000.00', 'Textile fabric meticulously woven with bright red color, dynamic is definitely the choice of those who love the outstanding and stylish personality. Keeping the simple traditional design combined with modern UltraCush technology, the product will surely give you the most comfortable feeling when you step in.', 'Vans Authentic 44 DX.jpg'),
(47, 'Vans Authentic 44 DX Anaheim ', '15000.00', 'Ivory white eye-catching, eye-catching, easy-to-look with Textile fabric gives you a personality, elegant but no less prominent. The simple traditional design combined with modern UltraCush technology certainly creates a comfortable, smooth, classy feel for the wearer, regardless of style.', 'Vans Authentic 44 DX Anaheim .jpg'),
(48, 'Vans Authentic 45 DX Anaheim', '16000.00', '\r\nClassic Authentic design with the upper sole of the shoe is ivory-white and shaded to create a special highlight for the Anaheim Factory line. Soft lightweight Canvas material embraces the legs and the simple color scheme to help you stand out with the Retro style.', 'Vans Authentic 45 DX Anaheim.jpg'),
(49, 'Vans Authentic OTW Repeat', '17000.00', 'With the \"Vans Off The Wall\" motifs distributed throughout the shoe body, the black shoe body combined with white letters helps the shoe stand out.', 'Vans Authentic OTW Repeat.jpg'),
(50, 'Vans Authentic Gum Block', '21000.00', 'Vans Authentic Gum Block becomes more attractive with a rubber sole that is renewed by combining with GUM material arranged in the heel to enhance good grip. The design of the shoe body is covered with durable canvas fabric to keep your feet comfortable when exercising.', 'Vans Authentic Gum Block.jpg'),
(51, 'Vans UA Authentic Jersey', '23000.00', 'With striped patterns covering the whole body of the shoe, the product becomes quite personal and suitable for all ages, the rubber sole with good grip and durability is suitable for those who love skateboards, products. free socks and free shipping nationwide when purchased at Drake System Vietnam, apply direct and online purchase.', 'Vans UA Authentic Jersey.jpg'),
(52, 'Vans Authentic Mix', '24000.00', 'Stylized shoes from Vans Athentic Classic with Checkerboard color create a new style but still very easy to coordinate. Products are bundled with socks and free shipping nationwide when purchased at Drake System Vietnam, apply direct and online purchase.', 'Vans Authentic Mix Checkerboard.jpg'),
(53, 'Women\'s Hangisi Satin Pump', '20000.00', 'Royal blue satin evening pump with a gray crystal embellished ornament from Manolo Blahnik. The Hangisi pump has a slightly pointed toe, a covered heel measuring approximately 105mm / 4\" high, and cream…', 'Women\'s Hangisi Satin Pump Royal Blue Us.jpg'),
(54, 'Women\'s Green Osaka 105 ', '30000.00', 'Made in Italy Color/material: verde satin Design details: silver-tone hardware Lightly padded leather insole Smooth leather sole 4in heel Please note: All measurements are approximate and were taken from a size 37; slight…', 'Women\'s Green Osaka 105 Satin Pump.jpg'),
(55, 'Women\'s Purple Sicaria', '31000.00', 'Please note: Size selections are European. For US conversions, please reference size chart. Made in Italy Color/material: purple satin Design details: embellished ankle strap with silver-tone hardware Adjustable ankle strap with buckle closure…', 'Women\'s Purple Sicaria Embellished Ankle Strap Flat.jpg'),
(56, 'Women\'s Blue Taylerbi 105 Suede ', '32000.00', 'Please note: Size selections are European. For US conversions, please reference size chart. Made in Italy Color/material: Viking blue and yellow suede Lightly padded leather insole Smooth leather sole 4in heel Please note:…', 'Women\'s Blue Taylerbi 105 Suede Pump.jpg'),
(57, 'Women\'s Blue Fibiona Satin', '33000.00', 'Please note: Size selections are European. For US conversions, please reference size chart. Made in Italy. Color/material: navy satin. Design details: crystal accent. Lightly padded leather insole. Smooth leather sole. 4in heel. Please…', 'Women\'s Blue Fibiona Satin Slide Sandals.jpg'),
(58, 'Women\'s Blue 105mm Hangisi ', '35000.00', 'Please note: Size selections are European. For US conversions, please reference size chart. Made in Italy. Color/material: navy satin. Design details: crystal accent. Lightly padded leather insole. Smooth leather sole. 4in heel. Please…', 'Women\'s Blue 105mm Hangisi Swarovski Silk Satin Pumps.jpg'),
(59, 'Women\'s Hangisi Bridal 70 Ivory', '45000.00', 'Please note: Size selections are European. For US conversions, please reference size chart. Made in Italy. Color/material: navy satin. Design details: crystal accent. Lightly padded leather insole. Smooth leather sole. 4in heel. Please…', 'Women\'s Hangisi Bridal 70 Ivory Satin Pumps.jpg'),
(60, 'Women\'s Pink Hangisi 70 Satin ', '46000.00', 'Please note: Size selections are European. For US conversions, please reference size chart. Made in Italy. Color/material: navy satin. Design details: crystal accent. Lightly padded leather insole. Smooth leather sole. 4in heel. Please…', 'Women\'s Pink Hangisi 70 Satin Pump.jpg'),
(61, 'Women\'s Green 105mm Hangisi', '52000.00', 'Please note: Size selections are European. For US conversions, please reference size chart. Made in Italy. Color/material: navy satin. Design details: crystal accent. Lightly padded leather insole. Smooth leather sole. 4in heel. Please…', 'Women\'s Green 105mm Hangisi Swarovski Silk Satin Pumps.jpg'),
(62, 'Women\'s Gray Hangisi 70 Satin', '31000.00', 'Please note: Size selections are European. For US conversions, please reference size chart. Made in Italy. Color/material: navy satin. Design details: crystal accent. Lightly padded leather insole. Smooth leather sole. 4in heel. Please…', 'Women\'s Gray Hangisi 70 Satin Pump.jpg'),
(63, 'Women\'s Gray Osaka 105 Satin', '34000.00', 'Please note: Size selections are European. For US conversions, please reference size chart. Made in Italy. Color/material: navy satin. Design details: crystal accent. Lightly padded leather insole. Smooth leather sole. 4in heel. Please…', 'Women\'s Gray Osaka 105 Satin Pump.jpg'),
(64, 'Women\'s Black Umilla 105 Suede', '33000.00', 'Please note: Size selections are European. For US conversions, please reference size chart. Made in Italy. Color/material: navy satin. Design details: crystal accent. Lightly padded leather insole. Smooth leather sole. 4in heel. Please…', 'Women\'s Black Umilla 105 Suede Pump.jpg'),
(65, 'Women\'s Black Karma 106', '100000.00', 'Made in Italy Color/material: black/white leather Lightly padded leather insole Smooth leather sole 4in heel Please note: All measurements are approximate and were taken from a size 37; slight variations may occur. Our…', 'Women\'s Black Karma 106 Leather Pump.jpg'),
(66, 'Women\'s White Nadira 90 Ivory', '110000.00', 'Ivory satin embellished pump from Manolo Blahnik. The Nadira has a 90mm stiletto heel, a beige leather insole, and an elegant crystal embellishment. True to size. Leather sole. Made in Italy. Color: white', 'Women\'s White Nadira 90 Ivory Satin Pump.jpg'),
(67, 'Women\'s Gray Chaos Crystal', '32000.00', 'Please note: Size selections are European. For US conversions, please reference size chart. Made in Italy Color/material: dark gray satin Design details: silver-tone hardware Adjustable ankle strap with buckle closure Lightly padded leather…', 'Women\'s Gray Chaos Crystal Rock 106 Satin Sandal.jpg'),
(68, 'Women\'s Perla Suede Cork', '60000.00', 'Jimmy Choo’s Perla sandals are what vacation dreams are made of. With its comfortable wedge heel and braided jute sole, the Perla is the only shoe you’ll want to wear when the sun comes out. Featuring everything from glitter and tropical leaf prints to raffia embroidery, the collection is designed to take you seamlessly from the beach to the local bar. Wear your Perla sandals with cropped denim for weekends in the city, or team them with an off-the-shoulder dress for balmy summer nights.', 'Women\'s Perla Suede Cork Platform Wedge Sandals.jpg'),
(69, 'Women\'s Blue Perla Wedges', '55000.00', 'Jimmy Choo’s Perla sandals are what vacation dreams are made of. With its comfortable wedge heel and braided jute sole, the Perla is the only shoe you’ll want to wear when the sun comes out. Featuring everything from glitter and tropical leaf prints to raffia embroidery, the collection is designed to take you seamlessly from the beach to the local bar. Wear your Perla sandals with cropped denim for weekends in the city, or team them with an off-the-shoulder dress for balmy summer nights.', 'Women\'s Blue Perla Wedges.jpg'),
(70, 'Women\'s Black Perla 70 Leather ', '31000.00', 'Jimmy Choo’s Perla sandals are what vacation dreams are made of. With its comfortable wedge heel and braided jute sole, the Perla is the only shoe you’ll want to wear when the sun comes out. Featuring everything from glitter and tropical leaf prints to raffia embroidery, the collection is designed to take you seamlessly from the beach to the local bar. Wear your Perla sandals with cropped denim for weekends in the city, or team them with an off-the-shoulder dress for balmy summer nights.', 'Women\'s Black Perla 70 Leather Cork Wedge Sandal.jpg'),
(71, 'Women\'s Pink Perla 120 Wedge', '52000.00', 'Jimmy Choo’s Perla sandals are what vacation dreams are made of. With its comfortable wedge heel and braided jute sole, the Perla is the only shoe you’ll want to wear when the sun comes out. Featuring everything from glitter and tropical leaf prints to raffia embroidery, the collection is designed to take you seamlessly from the beach to the local bar. Wear your Perla sandals with cropped denim for weekends in the city, or team them with an off-the-shoulder dress for balmy summer nights.', 'Women\'s Pink Perla 120 Leather Wedge.jpg'),
(72, 'Women\'s Brown Perla 70', '80000.00', 'Jimmy Choo’s Perla sandals are what vacation dreams are made of. With its comfortable wedge heel and braided jute sole, the Perla is the only shoe you’ll want to wear when the sun comes out. Featuring everything from glitter and tropical leaf prints to raffia embroidery, the collection is designed to take you seamlessly from the beach to the local bar. Wear your Perla sandals with cropped denim for weekends in the city, or team them with an off-the-shoulder dress for balmy summer nights.', 'Women\'s Brown Perla 70 Wedge Sandals.jpg'),
(73, 'Women\'s Perla 120 Metallic', '14000.00', 'Jimmy Choo’s Perla sandals are what vacation dreams are made of. With its comfortable wedge heel and braided jute sole, the Perla is the only shoe you’ll want to wear when the sun comes out. Featuring everything from glitter and tropical leaf prints to raffia embroidery, the collection is designed to take you seamlessly from the beach to the local bar. Wear your Perla sandals with cropped denim for weekends in the city, or team them with an off-the-shoulder dress for balmy summer nights.', 'Women\'s Perla 120 Metallic Leather Cork Wedge Sandal.jpg'),
(74, 'Women\'s Natural Perla 120', '32000.00', 'Jimmy Choo’s Perla sandals are what vacation dreams are made of. With its comfortable wedge heel and braided jute sole, the Perla is the only shoe you’ll want to wear when the sun comes out. Featuring everything from glitter and tropical leaf prints to raffia embroidery, the collection is designed to take you seamlessly from the beach to the local bar. Wear your Perla sandals with cropped denim for weekends in the city, or team them with an off-the-shoulder dress for balmy summer nights.', 'Women\'s Natural Perla 120 Sandals.jpg'),
(75, 'Women\'s Natural Perla 121', '7500.00', 'Jimmy Choo’s Perla sandals are what vacation dreams are made of. With its comfortable wedge heel and braided jute sole, the Perla is the only shoe you’ll want to wear when the sun comes out. Featuring everything from glitter and tropical leaf prints to raffia embroidery, the collection is designed to take you seamlessly from the beach to the local bar. Wear your Perla sandals with cropped denim for weekends in the city, or team them with an off-the-shoulder dress for balmy summer nights.', 'Women\'s Natural Perla 121 Wedges.jpg'),
(76, 'Women\'s Perla 122 Suede  ', '1300.00', 'Jimmy Choo’s Perla sandals are what vacation dreams are made of. With its comfortable wedge heel and braided jute sole, the Perla is the only shoe you’ll want to wear when the sun comes out. Featuring everything from glitter and tropical leaf prints to raffia embroidery, the collection is designed to take you seamlessly from the beach to the local bar. Wear your Perla sandals with cropped denim for weekends in the city, or team them with an off-the-shoulder dress for balmy summer nights.', 'Women\'s Perla 122 Suede.jpg'),
(77, 'Women\'s Black Perla1 Sandals', '4800.00', 'Jimmy Choo’s Perla sandals are what vacation dreams are made of. With its comfortable wedge heel and braided jute sole, the Perla is the only shoe you’ll want to wear when the sun comes out. Featuring everything from glitter and tropical leaf prints to raffia embroidery, the collection is designed to take you seamlessly from the beach to the local bar. Wear your Perla sandals with cropped denim for weekends in the city, or team them with an off-the-shoulder dress for balmy summer nights.', 'Women\'s Black Perla1 Patent-Leather Sandals.jpg'),
(78, 'Women\'s Perla 101 Metallic', '8000.00', 'Jimmy Choo’s Perla sandals are what vacation dreams are made of. With its comfortable wedge heel and braided jute sole, the Perla is the only shoe you’ll want to wear when the sun comes out. Featuring everything from glitter and tropical leaf prints to raffia embroidery, the collection is designed to take you seamlessly from the beach to the local bar. Wear your Perla sandals with cropped denim for weekends in the city, or team them with an off-the-shoulder dress for balmy summer nights.', 'Women\'s Perla 101 Metallic Snakeskin.jpg'),
(79, 'Women\'s Black1 \'perla\' Sandals', '31000.00', 'Jimmy Choo’s Perla sandals are what vacation dreams are made of. With its comfortable wedge heel and braided jute sole, the Perla is the only shoe you’ll want to wear when the sun comes out. Featuring everything from glitter and tropical leaf prints to raffia embroidery, the collection is designed to take you seamlessly from the beach to the local bar. Wear your Perla sandals with cropped denim for weekends in the city, or team them with an off-the-shoulder dress for balmy summer nights.', 'Women\'s Black1 \'perla\' Sandals.jpg'),
(80, 'Women\'s Black Perla 123 Sandal', '21000.00', 'Jimmy Choo’s Perla sandals are what vacation dreams are made of. With its comfortable wedge heel and braided jute sole, the Perla is the only shoe you’ll want to wear when the sun comes out. Featuring everything from glitter and tropical leaf prints to raffia embroidery, the collection is designed to take you seamlessly from the beach to the local bar. Wear your Perla sandals with cropped denim for weekends in the city, or team them with an off-the-shoulder dress for balmy summer nights.', 'Women\'s Black Perla 123 Raffia Wedge Sandal.jpg'),
(81, 'Women\'s Blue Perla 124 ', '62000.00', 'Jimmy Choo’s Perla sandals are what vacation dreams are made of. With its comfortable wedge heel and braided jute sole, the Perla is the only shoe you’ll want to wear when the sun comes out. Featuring everything from glitter and tropical leaf prints to raffia embroidery, the collection is designed to take you seamlessly from the beach to the local bar. Wear your Perla sandals with cropped denim for weekends in the city, or team them with an off-the-shoulder dress for balmy summer nights.', 'Women\'s Blue Perla 124 Scalloped Perforated.jpg'),
(82, 'Women\'s Brown1 \'perla\' Sandals', '23000.00', 'Jimmy Choo’s Perla sandals are what vacation dreams are made of. With its comfortable wedge heel and braided jute sole, the Perla is the only shoe you’ll want to wear when the sun comes out. Featuring everything from glitter and tropical leaf prints to raffia embroidery, the collection is designed to take you seamlessly from the beach to the local bar. Wear your Perla sandals with cropped denim for weekends in the city, or team them with an off-the-shoulder dress for balmy summer nights.', 'Women\'s Brown1 \'perla\' Sandals.jpg'),
(83, 'GAFA Silk Satin', '56000.00', 'With sophisticated design, the object is aimed at office girls as well as modern business women. Not too fussy but extremely delicate, the GAFA brand was honored to be accompanied by the contestants of Miss Almighty Asian Entrepreneurs 2019', 'GAFA1.jpg'),
(84, 'GAFA Glossy skin', '30000.00', 'With sophisticated design, the object is aimed at office girls as well as modern business women. Not too fussy but extremely delicate, the GAFA brand was honored to be accompanied by the contestants of Miss Almighty Asian Entrepreneurs 2019', 'GAFA2.jpg'),
(85, 'GAFA High heels Larue', '34000.00', 'With sophisticated design, the object is aimed at office girls as well as modern business women. Not too fussy but extremely delicate, the GAFA brand was honored to be accompanied by the contestants of Miss Almighty Asian Entrepreneurs 2019', 'GAFA3.jpg'),
(86, 'GAFA High heels TX 10Bo', '100000.00', 'With sophisticated design, the object is aimed at office girls as well as modern business women. Not too fussy but extremely delicate, the GAFA brand was honored to be accompanied by the contestants of Miss Almighty Asian Entrepreneurs 2019', 'GAFA4.jpg'),
(87, 'GAFA High heel sandals TX12', '34000.00', 'With sophisticated design, the object is aimed at office girls as well as modern business women. Not too fussy but extremely delicate, the GAFA brand was honored to be accompanied by the contestants of Miss Almighty Asian Entrepreneurs 2019', 'GAFA5.jpg'),
(88, 'GAFA Transparent high heels', '75000.00', 'With sophisticated design, the object is aimed at office girls as well as modern business women. Not too fussy but extremely delicate, the GAFA brand was honored to be accompanied by the contestants of Miss Almighty Asian Entrepreneurs 2019', 'GAFA6.jpg'),
(89, 'GAFA Metallic high heels', '93000.00', 'With sophisticated design, the object is aimed at office girls as well as modern business women. Not too fussy but extremely delicate, the GAFA brand was honored to be accompanied by the contestants of Miss Almighty Asian Entrepreneurs 2019', 'GAFA7.jpg'),
(90, 'GAFA Sandal Moonlight', '89000.00', 'With sophisticated design, the object is aimed at office girls as well as modern business women. Not too fussy but extremely delicate, the GAFA brand was honored to be accompanied by the contestants of Miss Almighty Asian Entrepreneurs 2019', 'GAFA8.jpg'),
(91, 'GAFA High-heeled sandal TX02', '29000.00', 'With sophisticated design, the object is aimed at office girls as well as modern business women. Not too fussy but extremely delicate, the GAFA brand was honored to be accompanied by the contestants of Miss Almighty Asian Entrepreneurs 2019', 'GAFA9.jpg'),
(92, 'GAFA Sandal Dolores', '79000.00', 'With sophisticated design, the object is aimed at office girls as well as modern business women. Not too fussy but extremely delicate, the GAFA brand was honored to be accompanied by the contestants of Miss Almighty Asian Entrepreneurs 2019', 'GAFA10.jpg'),
(93, 'GAFA Sandal TX04 Cecile', '41000.00', 'With sophisticated design, the object is aimed at office girls as well as modern business women. Not too fussy but extremely delicate, the GAFA brand was honored to be accompanied by the contestants of Miss Almighty Asian Entrepreneurs 2019', 'GAFA11.jpg'),
(94, 'GAFA Sandal TX05 Cecile', '48000.00', 'With sophisticated design, the object is aimed at office girls as well as modern business women. Not too fussy but extremely delicate, the GAFA brand was honored to be accompanied by the contestants of Miss Almighty Asian Entrepreneurs 2019', 'GAFA12.jpg'),
(95, 'GAFA Sandal TX06 Cecile', '20000.00', 'With sophisticated design, the object is aimed at office girls as well as modern business women. Not too fussy but extremely delicate, the GAFA brand was honored to be accompanied by the contestants of Miss Almighty Asian Entrepreneurs 2019', 'GAFA13.jpg'),
(96, 'GAFA Pink heels with stones', '11000.00', 'With sophisticated design, the object is aimed at office girls as well as modern business women. Not too fussy but extremely delicate, the GAFA brand was honored to be accompanied by the contestants of Miss Almighty Asian Entrepreneurs 2019', 'GAFA14.jpg'),
(97, 'GAFA Black heels with stones', '55000.00', 'With sophisticated design, the object is aimed at office girls as well as modern business women. Not too fussy but extremely delicate, the GAFA brand was honored to be accompanied by the contestants of Miss Almighty Asian Entrepreneurs 2019', 'GAFA15.jpg'),
(105, 'adidas', '100.00', 'asdasasdasd', 'OJwE5kCFBJidsiin7wTyj4kFKRwOc5FcuiP0OJQk.jpeg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(1, 'hoc van', 'hocvan@gmail.com', NULL, '$2y$10$8tZt9bYrU4XBFeWKqRrrLupzL2x/PjbLOI91a082DzZTkCmLhLHQi', NULL, '2019-12-10 07:51:04', '2019-12-10 07:51:04', 0),
(3, 'admin', 'admin@gmail.com', NULL, '$2y$10$FvIHQpU59UnW02ikMwdDBOyBpT0ueUbH5Dc4GamRGRhGhKB0.CPvm', NULL, '2019-12-12 09:09:57', '2019-12-12 09:09:57', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
