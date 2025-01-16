-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 10 Oca 2025, 21:47:12
-- Sunucu sürümü: 8.3.0
-- PHP Sürümü: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `sisler_cafe`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoriler`
--

DROP TABLE IF EXISTS `kategoriler`;
CREATE TABLE IF NOT EXISTS `kategoriler` (
  `kategori_id` int NOT NULL,
  `kategori_adi` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci NOT NULL,
  PRIMARY KEY (`kategori_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

--
-- Tablo döküm verisi `kategoriler`
--

INSERT INTO `kategoriler` (`kategori_id`, `kategori_adi`) VALUES
(1, 'Kahvaltı'),
(2, 'Atıştırmalıklar ve Yiyecekler'),
(3, 'Tatlılar'),
(4, 'Sıcak İçecekler'),
(5, 'Kahveler'),
(6, 'Türk Kahveleri'),
(7, 'Demleme Bitki Çayları'),
(8, 'Soğuk İçecekler'),
(9, 'Soğuk Kahveler'),
(10, 'Meşrubatlar');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullaniciler`
--

DROP TABLE IF EXISTS `kullaniciler`;
CREATE TABLE IF NOT EXISTS `kullaniciler` (
  `kullanici_adi` varchar(20) COLLATE utf8mb3_turkish_ci NOT NULL,
  `sifre` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci NOT NULL,
  PRIMARY KEY (`kullanici_adi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

--
-- Tablo döküm verisi `kullaniciler`
--

INSERT INTO `kullaniciler` (`kullanici_adi`, `sifre`) VALUES
('admin', '$2b$10$xN6AYQABzUkuxVOM32hOJecH77X0fe53u0J1mC4ACF5KkxOvP/4M2'),
('ahmet ', '$2b$10$IWZ3QSqkuwCRf6.QQAulBOM72UCNp36BWGRRJL1wbWEx1zogKKgDu');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personel`
--

DROP TABLE IF EXISTS `personel`;
CREATE TABLE IF NOT EXISTS `personel` (
  `personel_id` int NOT NULL AUTO_INCREMENT,
  `ad` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  `soyad` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_turkish_ci NOT NULL,
  PRIMARY KEY (`personel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `personel`
--

INSERT INTO `personel` (`personel_id`, `ad`, `soyad`) VALUES
(5, 'batuhan', 'yüksel'),
(13, 'ekin', 'çelik'),
(14, 'savaş', 'avcı');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `personel_gider`
--

DROP TABLE IF EXISTS `personel_gider`;
CREATE TABLE IF NOT EXISTS `personel_gider` (
  `gider_id` int NOT NULL AUTO_INCREMENT,
  `personel_id` int NOT NULL,
  `maas_tutari` decimal(10,2) NOT NULL,
  `ek_mesai_ucreti` decimal(10,2) DEFAULT '0.00',
  `toplam_gider` decimal(10,2) GENERATED ALWAYS AS ((`maas_tutari` + `ek_mesai_ucreti`)) STORED,
  `odeme_tarihi` date NOT NULL,
  PRIMARY KEY (`gider_id`),
  KEY `personel_id` (`personel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `personel_gider`
--

INSERT INTO `personel_gider` (`gider_id`, `personel_id`, `maas_tutari`, `ek_mesai_ucreti`, `odeme_tarihi`) VALUES
(7, 5, 14665.00, 1860.00, '2024-12-03'),
(14, 13, 17899.00, 5478.00, '2024-12-07'),
(15, 14, 21000.00, 5789.00, '2024-12-07');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparisler`
--

DROP TABLE IF EXISTS `siparisler`;
CREATE TABLE IF NOT EXISTS `siparisler` (
  `siparis_id` int NOT NULL AUTO_INCREMENT,
  `masa_kodu` int NOT NULL,
  `urun_id` int NOT NULL,
  `adet` int NOT NULL,
  `siparis_tarih` date NOT NULL,
  `toplam_fiyat` int DEFAULT NULL,
  `siparis_durum` tinyint(1) NOT NULL,
  PRIMARY KEY (`siparis_id`),
  KEY `masa_kodu` (`masa_kodu`),
  KEY `urun_id` (`urun_id`)
) ENGINE=InnoDB AUTO_INCREMENT=565 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

--
-- Tablo döküm verisi `siparisler`
--

INSERT INTO `siparisler` (`siparis_id`, `masa_kodu`, `urun_id`, `adet`, `siparis_tarih`, `toplam_fiyat`, `siparis_durum`) VALUES
(392, 2, 3, 2, '2024-04-29', 240, 0),
(393, 1, 2, 2, '2024-12-25', 730, 0),
(394, 13, 1, 1, '2024-12-28', 675, 0),
(395, 13, 2, 1, '2024-12-27', 365, 0),
(396, 13, 3, 1, '2024-12-26', 120, 0),
(397, 17, 3, 1, '2024-12-25', 120, 0),
(398, 17, 2, 1, '2024-12-24', 365, 0),
(399, 17, 1, 1, '2024-12-23', 675, 0),
(400, 17, 5, 2, '2024-12-22', 270, 0),
(401, 16, 2, 1, '2024-12-21', 365, 0),
(402, 16, 6, 1, '2024-09-24', 135, 0),
(403, 16, 5, 1, '2024-12-29', 135, 0),
(404, 16, 4, 1, '2024-10-29', 140, 0),
(405, 16, 3, 1, '2024-11-29', 120, 0),
(406, 2, 1, 4, '2024-08-24', 2700, 0),
(413, 10, 1, 1, '2024-12-30', 675, 0),
(414, 10, 2, 1, '2024-12-30', 365, 0),
(415, 10, 15, 1, '2024-12-24', 200, 0),
(416, 10, 13, 1, '2024-12-30', 120, 0),
(417, 10, 14, 1, '2024-12-30', 190, 0),
(418, 10, 12, 1, '2024-12-30', 180, 0),
(419, 10, 11, 1, '2024-12-30', 115, 0),
(420, 10, 10, 1, '2024-12-30', 135, 0),
(421, 10, 18, 2, '2024-12-30', 340, 0),
(422, 10, 33, 5, '2024-12-30', 1100, 0),
(427, 1, 1, 1, '2024-12-30', 675, 0),
(428, 1, 2, 1, '2024-12-30', 365, 0),
(429, 1, 3, 1, '2024-12-30', 120, 0),
(430, 3, 6, 1, '2024-12-30', 135, 0),
(431, 3, 5, 1, '2024-12-30', 135, 0),
(432, 3, 7, 2, '2024-12-30', 340, 0),
(433, 5, 5, 2, '2024-12-30', 270, 0),
(434, 5, 6, 2, '2024-12-30', 270, 0),
(435, 20, 1, 1, '2024-12-30', 675, 0),
(436, 20, 2, 1, '2024-12-30', 365, 0),
(437, 20, 3, 1, '2024-12-30', 120, 0),
(438, 20, 4, 1, '2024-12-30', 140, 0),
(439, 20, 5, 1, '2024-12-30', 135, 0),
(440, 20, 6, 2, '2024-12-30', 270, 0),
(441, 20, 7, 1, '2024-12-30', 170, 0),
(442, 20, 8, 1, '2024-12-30', 195, 0),
(443, 6, 8, 1, '2024-12-30', 195, 0),
(445, 6, 44, 1, '2024-12-30', 30, 0),
(446, 6, 64, 1, '2024-12-30', 115, 0),
(447, 6, 80, 1, '2024-12-30', 85, 0),
(448, 6, 58, 1, '2024-12-30', 60, 0),
(449, 7, 7, 1, '2024-12-30', 170, 0),
(450, 7, 56, 2, '2024-12-30', 50, 0),
(451, 7, 117, 1, '2024-12-30', 110, 0),
(453, 7, 10, 1, '2024-12-30', 135, 0),
(454, 7, 23, 1, '2024-12-30', 210, 0),
(455, 7, 49, 1, '2024-12-30', 180, 0),
(456, 7, 57, 1, '2024-12-30', 50, 0),
(457, 9, 8, 1, '2024-12-30', 195, 0),
(458, 9, 17, 1, '2024-12-30', 170, 0),
(459, 9, 52, 1, '2024-12-30', 180, 0),
(460, 9, 59, 1, '2024-12-30', 95, 0),
(461, 9, 63, 4, '2024-12-30', 300, 0),
(462, 18, 1, 1, '2024-12-30', 675, 0),
(463, 18, 13, 1, '2024-12-30', 120, 0),
(464, 18, 29, 1, '2024-12-30', 160, 0),
(465, 18, 56, 1, '2024-12-30', 25, 0),
(466, 9, 5, 1, '2024-12-30', 135, 0),
(467, 9, 10, 1, '2024-12-30', 135, 0),
(468, 9, 11, 1, '2024-12-30', 115, 0),
(469, 9, 21, 1, '2024-12-30', 195, 0),
(470, 9, 56, 1, '2024-12-30', 25, 0),
(471, 19, 54, 14, '2024-12-30', 840, 0),
(472, 19, 169, 1, '2024-12-30', 800, 0),
(473, 19, 55, 4, '2024-12-30', 340, 0),
(474, 6, 7, 1, '2024-12-30', 170, 0),
(476, 6, 36, 1, '2024-12-30', 230, 0),
(477, 6, 142, 1, '2024-12-30', 50, 0),
(479, 7, 14, 1, '2024-12-30', 190, 0),
(480, 7, 56, 2, '2024-12-30', 50, 0),
(481, 18, 5, 3, '2024-12-30', 405, 0),
(482, 18, 3, 1, '2024-12-30', 120, 0),
(483, 18, 145, 1, '2024-12-30', 100, 0),
(484, 18, 8, 2, '2024-12-30', 390, 0),
(485, 18, 7, 1, '2024-12-30', 170, 0),
(486, 18, 6, 1, '2024-12-30', 135, 0),
(487, 9, 7, 3, '2024-12-30', 510, 0),
(488, 9, 6, 1, '2024-12-30', 135, 0),
(489, 9, 5, 3, '2024-12-30', 405, 0),
(490, 9, 8, 1, '2024-12-30', 195, 0),
(491, 9, 145, 2, '2024-12-30', 200, 0),
(492, 3, 6, 2, '2024-12-30', 270, 0),
(493, 3, 5, 1, '2024-12-30', 135, 0),
(494, 3, 4, 2, '2024-12-30', 280, 0),
(495, 3, 3, 2, '2024-12-30', 240, 0),
(496, 3, 2, 2, '2024-12-30', 730, 0),
(498, 3, 6, 2, '2024-12-30', 270, 0),
(499, 3, 5, 1, '2024-12-30', 135, 0),
(500, 3, 4, 2, '2024-12-30', 280, 0),
(501, 3, 3, 2, '2024-12-30', 240, 0),
(502, 3, 2, 2, '2024-12-30', 730, 0),
(528, 20, 6, 2, '2024-12-30', 270, 0),
(529, 20, 5, 1, '2024-12-30', 135, 0),
(530, 20, 4, 2, '2024-12-30', 280, 0),
(531, 20, 3, 2, '2024-12-30', 240, 0),
(532, 20, 2, 2, '2024-12-30', 730, 0),
(534, 9, 6, 2, '2024-12-30', 270, 0),
(535, 9, 5, 1, '2024-12-30', 135, 0),
(536, 9, 4, 2, '2024-12-30', 280, 0),
(537, 9, 3, 2, '2024-12-30', 240, 0),
(538, 9, 2, 2, '2024-12-30', 730, 0),
(540, 20, 171, 4, '2024-12-30', 600, 0),
(541, 4, 63, 4, '2024-12-31', 300, 0),
(542, 4, 77, 1, '2024-12-31', 75, 0),
(543, 4, 78, 1, '2024-12-31', 90, 0),
(544, 7, 138, 3, '2024-12-31', 135, 0),
(545, 7, 1, 5, '2025-01-08', 3375, 0),
(546, 7, 2, 1, '2025-01-08', 365, 0),
(547, 7, 6, 9, '2025-01-08', 1215, 0),
(548, 7, 7, 3, '2025-01-08', 510, 0),
(549, 7, 145, 3, '2025-01-08', 300, 0),
(550, 7, 25, 2, '2025-01-08', 270, 0),
(551, 7, 24, 3, '2025-01-08', 345, 0),
(552, 7, 37, 2, '2025-01-08', 460, 0),
(553, 7, 36, 4, '2025-01-08', 920, 0),
(554, 7, 51, 2, '2025-01-08', 320, 0),
(555, 7, 56, 4, '2025-01-08', 100, 0),
(556, 6, 28, 1, '2025-01-08', 210, 0),
(557, 6, 35, 2, '2025-01-08', 460, 0),
(558, 6, 40, 1, '2025-01-08', 250, 0),
(559, 6, 44, 1, '2025-01-08', 30, 0),
(560, 1, 1, 4, '2025-01-08', 2700, 0),
(561, 1, 8, 4, '2025-01-08', 780, 0),
(562, 2, 173, 3, '2025-01-08', 2580, 1),
(563, 3, 1, 3, '2025-01-11', 2025, 1),
(564, 3, 2, 2, '2025-01-11', 730, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urunler`
--

DROP TABLE IF EXISTS `urunler`;
CREATE TABLE IF NOT EXISTS `urunler` (
  `urun_id` int NOT NULL AUTO_INCREMENT,
  `urun_isim` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci NOT NULL,
  `urun_fiyat` int NOT NULL,
  `urun_maliyet` int NOT NULL,
  `kategori_id` int DEFAULT NULL,
  PRIMARY KEY (`urun_id`),
  KEY `kategori_id` (`kategori_id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

--
-- Tablo döküm verisi `urunler`
--

INSERT INTO `urunler` (`urun_id`, `urun_isim`, `urun_fiyat`, `urun_maliyet`, `kategori_id`) VALUES
(1, 'Serpme Kahvaltı', 675, 200, 1),
(2, 'Tek Kişilik Kahvaltı Tabağı', 365, 100, 1),
(3, 'Sahanda Yumurta', 120, 50, 1),
(4, 'Sucuklu Yumurta', 140, 80, 1),
(5, 'Beyaz Peynirli Omlet', 135, 60, 1),
(6, 'Kaşarlı Omlet', 135, 70, 1),
(7, 'Menemen', 170, 100, 1),
(8, 'Kaşarlı Sucuklu Menemen', 195, 120, 1),
(10, 'Sosis Tava', 135, 80, 2),
(11, 'Patates Tabağı', 115, 50, 2),
(12, 'Sisler Atıştırmalık Tabağı', 180, 90, 2),
(13, 'Sigara Böreği', 120, 50, 2),
(14, 'Paçanga Böreği', 190, 90, 2),
(15, 'Tortilla', 200, 90, 2),
(16, 'Kurabiye Tabağı', 80, 20, 2),
(17, 'Kestane', 170, 100, 2),
(18, 'Beyaz Peynirli Gözleme', 170, 60, 2),
(19, 'Kaşar Peynirli Gözleme', 170, 60, 2),
(20, 'Kaşarlı Yumurtalı Gözleme', 195, 70, 2),
(21, 'Kaşarlı Mantarlı Gözleme', 195, 70, 2),
(22, 'Karışık Gözleme', 195, 70, 2),
(23, 'Kavurmalı Gözleme', 210, 80, 2),
(24, 'Kaşarlı  Tost', 115, 40, 2),
(25, 'Karışık Tost', 135, 60, 2),
(26, 'Beyaz Peynirli Tost', 115, 50, 2),
(27, 'Kavurmalı Tost', 180, 70, 2),
(28, 'Sisler Bulvarı Spesyal Tost', 210, 80, 2),
(29, 'Ton Balıklı Sandviç', 160, 70, 2),
(30, 'Beyaz Peynirli Sandviç', 125, 60, 2),
(31, 'Kaşarlı Sandviç', 125, 60, 2),
(32, 'Kaşarlı Salamlı Sandviç', 135, 75, 2),
(33, 'Mantı', 220, 70, 2),
(34, 'Tikka Masala Soslu Penne', 230, 90, 2),
(35, 'Krema Soslu Penne', 230, 90, 2),
(36, 'Köri Soslu Penne ', 230, 90, 2),
(37, 'Pesto Soslu Penne', 230, 90, 2),
(38, 'Penne Arabiata', 210, 90, 2),
(39, 'Tavuk Pirzola', 250, 100, 2),
(40, 'Tavuk Biftek', 250, 100, 2),
(41, 'Köri Soslu Tavuk', 250, 100, 2),
(42, 'Krema Soslu Tavuk', 250, 100, 2),
(43, 'Tikka Masala Soslu Tavuk', 265, 100, 2),
(44, 'Dondurma Top', 30, 15, 3),
(45, 'Mozaik Pasta ', 160, 40, 3),
(46, 'Yanardağ Pasta', 180, 40, 3),
(47, 'Marlenka ', 180, 40, 3),
(48, 'Tiramisu', 170, 50, 3),
(49, 'Limonlu Chessecake', 180, 40, 3),
(50, 'Frambuazlı Cheesecake', 180, 40, 3),
(51, 'Magnolia', 160, 60, 3),
(52, 'Sufle', 180, 50, 3),
(53, 'Sıcak Çikolata', 95, 20, 4),
(54, 'Sıcak Süt', 60, 5, 4),
(55, 'Ballı Süt', 85, 10, 8),
(56, 'Çay ', 25, 3, 4),
(57, 'Fincan Çay', 50, 5, 4),
(58, 'Sütlü Çay', 60, 6, 8),
(59, 'Salep', 95, 30, 4),
(60, 'Fındıklı Salep', 105, 35, 4),
(61, 'Pumpkin Latte', 100, 35, 5),
(62, 'Chai Tea Latte', 95, 30, 5),
(63, 'Türk Kahvesi', 75, 20, 6),
(64, 'Büyük Türk Kahvesi', 115, 30, 6),
(65, 'Sütlü Türk Kahvesi', 80, 25, 6),
(66, 'Büyük Sütlü Türk Kahvesi', 120, 35, 6),
(67, 'Sütlü Dibek Kahvesi', 80, 30, 6),
(68, 'Büyük Sütlü Dibek Kahvesi', 120, 40, 6),
(69, 'Damla Sakızlı Türk Kahvesi', 80, 30, 6),
(70, 'Büyük Damla Sakızlı Türk Kahvesi', 120, 40, 6),
(71, 'Osmanlı Kahvesi', 80, 30, 6),
(72, 'Büyük Osmanlı Kahvesi', 120, 40, 6),
(73, 'Filtre Kahve ', 85, 30, 5),
(75, 'Sade Nescafe ', 80, 20, 5),
(76, 'Sütlü Nescafe', 85, 21, 5),
(77, 'Espresso', 75, 20, 5),
(78, 'Double Espresso', 90, 25, 5),
(79, 'Americano', 85, 20, 5),
(80, 'Macchiato', 85, 20, 5),
(81, 'Latte', 90, 25, 5),
(82, 'Fındık Aromalı Latte', 100, 30, 9),
(83, 'Vanilya Aromalı Latte', 100, 30, 9),
(84, 'Mocha', 100, 30, 9),
(85, 'White Chocolate Mocha', 100, 30, 9),
(86, 'Karamel Macchiato', 100, 30, 9),
(87, 'Kappucino', 95, 30, 9),
(88, 'Affagato', 125, 30, 9),
(89, 'Adaçayı', 85, 15, 7),
(90, 'Ihlamur', 85, 15, 7),
(91, 'Papatya Çayı ', 85, 15, 7),
(92, 'Yeşil Çay', 85, 15, 7),
(93, 'Melisa Çayı', 85, 15, 7),
(94, 'Elma Çayı', 85, 15, 7),
(95, 'Kış Çayı ', 90, 20, 7),
(96, 'Hasta Çayı', 90, 20, 7),
(97, 'Çikolatalı Milshake', 110, 40, 8),
(98, 'Karamelli Milkshake', 110, 40, 8),
(99, 'Çilekli Milkshake', 110, 40, 8),
(100, 'Orman Meyveli Milkshake', 110, 40, 8),
(101, 'Frambuazlı Milkshake', 110, 40, 8),
(102, 'Vanilyalı Milkshake', 110, 40, 8),
(103, 'Karpuz Çilekli Milkshake', 110, 40, 8),
(104, 'Karpuzlu Milshake', 110, 40, 8),
(105, 'Kivili Milkshake', 110, 40, 8),
(106, 'Muzlu Milshake', 110, 40, 8),
(107, 'Oreolu Milshake', 165, 50, 8),
(108, 'Brownieli Milshake', 165, 50, 8),
(109, 'İced Americano', 100, 30, 9),
(110, 'İced Latte', 110, 30, 9),
(111, 'İced Mocha', 120, 35, 9),
(112, 'Frappe', 100, 35, 9),
(113, 'Cold Brew', 125, 35, 9),
(114, 'Limonata', 95, 10, 8),
(115, 'Çilekli Limonata', 105, 15, 8),
(116, 'Karadut', 95, 10, 8),
(117, 'Sıkma Portakal Suyu', 110, 30, 10),
(118, 'Çilekli Smoothie', 110, 60, 8),
(119, 'Muzlu Smoothie', 110, 60, 8),
(120, 'Kivili Smoothie', 110, 60, 8),
(121, 'Böğürtlenli Smoothie', 110, 60, 8),
(122, 'Orman Meyveli Smoothie', 110, 60, 8),
(123, 'Çilekli Frozen', 105, 20, 8),
(124, 'Kavunlu Frozen', 105, 20, 8),
(125, 'Karpuzlu Frozen', 105, 20, 8),
(126, 'Kivili Frozen', 105, 20, 8),
(127, 'Naneli Frozen', 105, 20, 8),
(128, 'Limonlu Frozen', 105, 20, 8),
(129, 'Orman Meyveli Frozen', 105, 20, 8),
(130, 'Karpuz Çilekli Frozen', 105, 20, 8),
(131, 'Muzlu Frozen', 105, 20, 8),
(132, 'Blue Lagon', 105, 70, 8),
(133, 'İce Tea', 65, 20, 10),
(134, 'Pepsi', 65, 20, 10),
(135, 'Yedigün', 65, 20, 10),
(136, 'SevenUp', 65, 20, 10),
(137, 'Meyve Suyu', 65, 15, 10),
(138, 'Soda ', 45, 15, 10),
(139, 'Meyveli Soda', 50, 20, 10),
(140, 'Sıkma Limon Soda', 60, 25, 10),
(141, 'Churchill', 65, 25, 10),
(142, 'Ayran', 50, 20, 10),
(143, 'Su', 20, 5, 8),
(145, 'Sucuklu Omlet', 100, 70, 1),
(169, 'dubai çikolatası', 800, 100, 1),
(171, 'salam', 150, 50, 1),
(173, 'söğüş', 860, 256, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urunler_yedek`
--

DROP TABLE IF EXISTS `urunler_yedek`;
CREATE TABLE IF NOT EXISTS `urunler_yedek` (
  `urun_id` int NOT NULL DEFAULT '0',
  `urun_isim` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_turkish_ci NOT NULL,
  `urun_fiyat` int NOT NULL,
  `urun_maliyet` int NOT NULL,
  `kategori_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_turkish_ci;

--
-- Tablo döküm verisi `urunler_yedek`
--

INSERT INTO `urunler_yedek` (`urun_id`, `urun_isim`, `urun_fiyat`, `urun_maliyet`, `kategori_id`) VALUES
(9, 'Burger Tabağı', 280, 130, 2),
(10, 'Sosis Tava', 135, 80, 2),
(11, 'Patates Tabağı', 115, 50, 2),
(12, 'Sisler Atıştırmalık Tabağı', 180, 90, 2),
(13, 'Sigara Böreği', 120, 50, 2),
(14, 'Paçanga Böreği', 190, 90, 2),
(15, 'Tortilla', 200, 90, 2),
(16, 'Kurabiye Tabağı', 80, 20, 2),
(17, 'Kestane', 170, 100, 2),
(18, 'Beyaz Peynirli Gözleme', 170, 60, 1),
(20, 'Kaşarlı Yumurtalı Gözleme', 195, 70, 1),
(22, 'Karışık Gözleme', 195, 70, 1),
(23, 'Kavurmalı Gözleme', 210, 80, 1),
(24, 'Kaşarlı  Tost', 115, 40, 2),
(25, 'Karışık Tost', 135, 60, 2),
(26, 'Beyaz Peynirli Tost', 115, 50, 2),
(27, 'Kavurmalı Tost', 180, 70, 2),
(28, 'Sisler Bulvarı Spesyal Tost', 210, 80, 2),
(29, 'Ton Balıklı Sandviç', 160, 70, 2),
(30, 'Beyaz Peynirli Sandviç', 125, 60, 2),
(31, 'Kaşarlı Sandviç', 125, 60, 2),
(32, 'Kaşarlı Salamlı Sandviç', 135, 75, 2),
(33, 'Mantı', 220, 70, 2),
(34, 'Tikka Masala Soslu Penne', 230, 90, 2),
(35, 'Krema Soslu Penne', 230, 90, 2),
(36, 'Köri Soslu Penne ', 230, 90, 2),
(37, 'Pesto Soslu Penne', 230, 90, 2),
(38, 'Penne Arabiata', 210, 90, 2),
(39, 'Tavuk Pirzola', 250, 100, 2),
(40, 'Tavuk Biftek', 250, 100, 2),
(41, 'Köri Soslu Tavuk', 250, 100, 2),
(42, 'Krema Soslu Tavuk', 250, 100, 2),
(43, 'Tikka Masala Soslu Tavuk', 265, 100, 2),
(44, 'Dondurma Top', 30, 15, 3),
(45, 'Mozaik Pasta ', 160, 40, 3),
(46, 'Yanardağ Pasta', 180, 40, 3),
(47, 'Marlenka ', 180, 40, 3),
(48, 'Tiramisu', 170, 50, 3),
(49, 'Limonlu Chessecake', 180, 40, 3),
(50, 'Frambuazlı Cheesecake', 180, 40, 3),
(51, 'Magnolia', 160, 60, 3),
(52, 'Sufle', 180, 50, 3),
(53, 'Sıcak Çikolata', 95, 20, 4),
(54, 'Sıcak Süt', 60, 5, 4),
(55, 'Ballı Süt', 85, 10, 8),
(56, 'Çay ', 25, 3, 4),
(57, 'Fincan Çay', 50, 5, 4),
(58, 'Sütlü Çay', 60, 6, 8),
(59, 'Salep', 95, 30, 4),
(60, 'Fındıklı Salep', 105, 35, 4),
(61, 'Pumpkin Latte', 100, 35, 5),
(62, 'Chai Tea Latte', 95, 30, 5),
(63, 'Türk Kahvesi', 75, 20, 6),
(64, 'Büyük Türk Kahvesi', 115, 30, 6),
(65, 'Sütlü Türk Kahvesi', 80, 25, 6),
(66, 'Büyük Sütlü Türk Kahvesi', 120, 35, 6),
(67, 'Sütlü Dibek Kahvesi', 80, 30, 6),
(68, 'Büyük Sütlü Dibek Kahvesi', 120, 40, 6),
(69, 'Damla Sakızlı Türk Kahvesi', 80, 30, 6),
(70, 'Büyük Damla Sakızlı Türk Kahvesi', 120, 40, 6),
(71, 'Osmanlı Kahvesi', 80, 30, 6),
(72, 'Büyük Osmanlı Kahvesi', 120, 40, 6),
(73, 'Filtre Kahve ', 85, 30, 5),
(74, 'İlave Süt', 15, 1, 8),
(75, 'Sade Nescafe ', 80, 20, 5),
(76, 'Sütlü Nescafe', 85, 21, 5),
(77, 'Espresso', 75, 20, 5),
(78, 'Double Espresso', 90, 25, 5),
(79, 'Americano', 85, 20, 5),
(80, 'Macchiato', 85, 20, 5),
(82, 'Fındık Aromalı Latte', 100, 30, 9),
(83, 'Vanilya Aromalı Latte', 100, 30, 9),
(84, 'Mocha', 100, 30, 9),
(85, 'White Chocolate Mocha', 100, 30, 9),
(86, 'Karamel Macchiato', 100, 30, 9),
(87, 'Kappucino', 95, 30, 9),
(88, 'Affagato', 125, 30, 9),
(89, 'Adaçayı', 85, 15, 7),
(90, 'Ihlamur', 85, 15, 7),
(91, 'Papatya Çayı ', 85, 15, 7),
(92, 'Yeşil Çay', 85, 15, 7),
(93, 'Melisa Çayı', 85, 15, 7),
(94, 'Elma Çayı', 85, 15, 7),
(95, 'Kış Çayı ', 90, 20, 7),
(96, 'Hasta Çayı', 90, 20, 7),
(97, 'Çikolatalı Milshake', 110, 40, 8),
(98, 'Karamelli Milkshake', 110, 40, 8),
(99, 'Çilekli Milkshake', 110, 40, 8),
(100, 'Orman Meyveli Milkshake', 110, 40, 8),
(101, 'Frambuazlı Milkshake', 110, 40, 8),
(102, 'Vanilyalı Milkshake', 110, 40, 8),
(103, 'Karpuz Çilekli Milkshake', 110, 40, 8),
(104, 'Karpuzlu Milshake', 110, 40, 8),
(105, 'Kivili Milkshake', 110, 40, 8),
(106, 'Muzlu Milshake', 110, 40, 8),
(107, 'Oreolu Milshake', 165, 50, 8),
(108, 'Brownieli Milshake', 165, 50, 8),
(109, 'İced Americano', 100, 30, 9),
(110, 'İced Latte', 110, 30, 9),
(111, 'İced Mocha', 120, 35, 9),
(112, 'Frappe', 100, 35, 9),
(113, 'Cold Brew', 125, 35, 9),
(115, 'Çilekli Limonata', 105, 15, 10),
(116, 'Karadut', 95, 10, 10),
(117, 'Sıkma Portakal Suyu', 110, 30, 10),
(118, 'Çilekli Smoothie', 110, 60, 10),
(119, 'Muzlu Smoothie', 110, 60, 10),
(120, 'Kivili Smoothie', 110, 60, 10),
(121, 'Böğürtlenli Smoothie', 110, 60, 10),
(122, 'Orman Meyveli Smoothie', 110, 60, 10),
(123, 'Çilekli Frozen', 105, 20, 10),
(124, 'Kavunlu Frozen', 105, 20, 10),
(125, 'Karpuzlu Frozen', 105, 20, 10),
(126, 'Kivili Frozen', 105, 20, 10),
(127, 'Naneli Frozen', 105, 20, 10),
(128, 'Limonlu Frozen', 105, 20, 10),
(129, 'Orman Meyveli Frozen', 105, 20, 10),
(130, 'Karpuz Çilekli Frozen', 105, 20, 10),
(131, 'Muzlu Frozen', 105, 20, 10),
(132, 'Blue Lagon', 105, 70, 10),
(133, 'İce Tea', 65, 20, 10),
(134, 'Pepsi', 65, 20, 10),
(135, 'Yedigün', 65, 20, 10),
(136, 'SevenUp', 65, 20, 10),
(137, 'Meyve Suyu', 65, 15, 10),
(138, 'Soda ', 45, 15, 10),
(139, 'Meyveli Soda', 50, 20, 10),
(140, 'Sıkma Limon Soda', 60, 25, 10),
(141, 'Churchill', 65, 25, 10),
(142, 'Ayran', 50, 20, 10),
(143, 'Su', 20, 5, 8),
(144, 'Sucuklu Omlet', 100, 70, 1),
(145, 'Sucuklu Omlet', 100, 70, 1),
(146, 'Sucuklu Omlet', 100, 70, 1),
(150, 'asd', 11111, 121, 1),
(151, 'asd', 11111, 121, 1),
(153, 'asd', 11111, 121, 1),
(154, 'sss', 1000, 100, 1),
(155, 'sss', 1000, 100, 1),
(158, 'aaaa', 100, 12, 1),
(159, 'aaaa', 100, 12, 1);

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `personel_gider`
--
ALTER TABLE `personel_gider`
  ADD CONSTRAINT `personel_gider_ibfk_1` FOREIGN KEY (`personel_id`) REFERENCES `personel` (`personel_id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `siparisler`
--
ALTER TABLE `siparisler`
  ADD CONSTRAINT `siparisler_ibfk_1` FOREIGN KEY (`urun_id`) REFERENCES `urunler` (`urun_id`) ON DELETE CASCADE;

--
-- Tablo kısıtlamaları `urunler`
--
ALTER TABLE `urunler`
  ADD CONSTRAINT `fk_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `kategoriler` (`kategori_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kategorii` FOREIGN KEY (`kategori_id`) REFERENCES `kategoriler` (`kategori_id`),
  ADD CONSTRAINT `urunler_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategoriler` (`kategori_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
