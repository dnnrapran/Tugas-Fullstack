-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2022 at 04:23 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apotek`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `personid` int(11) NOT NULL,
  `salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`personid`, `salary`) VALUES
(7, 1),
(8, 4),
(12, 9);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `personid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cost` int(11) NOT NULL,
  `deliveryid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`personid`, `productid`, `quantity`, `cost`, `deliveryid`) VALUES
(11, 1, 5, 500000, 6);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `personid` int(11) NOT NULL,
  `paymentPreference` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`personid`, `paymentPreference`) VALUES
(9, 'NA'),
(10, 'NA'),
(11, 'NA'),
(13, 'NA');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `deliveryid` int(11) NOT NULL,
  `personid` int(11) NOT NULL,
  `deliveryStatus` varchar(50) NOT NULL DEFAULT 'Order Placed',
  `deliveryDate` date DEFAULT current_timestamp(),
  `totalCost` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`deliveryid`, `personid`, `deliveryStatus`, `deliveryDate`, `totalCost`) VALUES
(6, 11, 'Order Placed', '2022-11-27', 500000);

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

CREATE TABLE `persons` (
  `personid` int(11) NOT NULL,
  `fname` varchar(25) NOT NULL,
  `lname` varchar(25) NOT NULL,
  `accesslevel` varchar(15) NOT NULL,
  `accountpassword` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `phoneno` bigint(11) NOT NULL,
  `email` varchar(40) NOT NULL,
  `address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `persons`
--

INSERT INTO `persons` (`personid`, `fname`, `lname`, `accesslevel`, `accountpassword`, `dob`, `phoneno`, `email`, `address`) VALUES
(7, 'Dini', 'Nur Aprilia Anggraeni', 'admin', '12345', '2022-11-09', 896213114, 'dininuraprilia0402@gmail.com', 'Desa Batujajar Barat'),
(8, 'dini', 'aprilia', 'admin', 'D1ninuraprilia23', '2007-04-23', 897652314, 'dini@gmail.com', 'Desa Batujajar Barat'),
(9, 'hilman', 'diana', 'customer', 'Aku098Z#@8', '2011-06-30', 4939384944, 'hilman@gmail.com', 'sumedang'),
(10, 'fristia', 'tia', 'customer', '09Azaz@#158', '2015-06-27', 4443546744, 'fristia@gmail.com', 'Desa Batujajar'),
(11, 'tia', 'aulia', 'customer', '09Azaz@#158', '2014-06-10', 7837284748, 'aulia@gmail.com', 'palembang'),
(12, 'anggraeni', 'nia', 'admin', '96dfdd1063e9fec156073ecd773b2345', '2000-08-16', 837492729, 'nia@gmail.com', 'batujajar'),
(13, 'aprilia', 'dini', 'customer', '3dacaf6f76d8b18ac5e1fb4d54dbb139', '2000-02-03', 893936837, 'april@gmail.com', 'Bandung');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `productName` varchar(200) NOT NULL,
  `productPrice` int(11) NOT NULL,
  `productStock` int(11) NOT NULL,
  `productDescription` varchar(200) NOT NULL,
  `productCap` int(11) NOT NULL,
  `productPhoto` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `productName`, `productPrice`, `productStock`, `productDescription`, `productCap`, `productPhoto`) VALUES
(1, 'Betadine 30 ml', 35000, 1500, 'Betadine adalah produk antiseptik yang bermanfaat untuk mencegah pertumbuhan dan membunuh kuman penyebab infeksi.', 500, 'https://www.prosehat.com/wp-content/uploads/2015/10/00000699_BetadineSolution15ML.jpg'),
(2, 'Amoxcillin 500 Mg', 2, 2000, 'Amoksisilin merupakan antibiotik yang digunakan dalam pengobatan berbagai infeksi bakteri. Obat ini merupakan lini pertama untuk pengobatan infeksi telinga tengah. Obat ini juga dapat digunakan untuk ', 50, 'https://www.novapharin.co.id/data/plist_pic/13.jpg'),
(3, 'Alerfed Syrup (Guardian Pharmatama)', 32800, 994, 'Pada setiap 5ml Alerfed syrup mengandung 1,25mg triprolidine HCl dan 30mg pseudoephedrine HCl. Alerfed digunakan untuk meredakan gejala gangguan saluran nafas atas seperti rhinitis alergi yaitu adanya', 300, 'https://d2qjkwm11akmwu.cloudfront.net/products/3962-1665770610.jpeg'),
(4, 'Amoxan (Sanbe farma) 500 mg', 28900, 4999, 'Amoxsan merupakan obat antibiotika yang digunakan untuk mengatasi infeksi pada saluran pernafasan atas, infeksi saluran kemih, saluran cerna, kulit dan jaringan lunak serta demam tifoid pada anak. Amo', 1000, 'https://static.sehatq.com/cdn-cgi/image/height=600,onerror=redirect/tokoq/products/l0o9ih3xzgx3t91oy256lf728zij'),
(5, 'Paracetamol Kf 500mg Tablet', 6000, 2000, 'Parasetamol atau asetaminofen adalah obat analgesik dan antipiretik yang banyak dipakai untuk meredakan sakit kepala ringan akut, nyeri ringan hingga sedang, serta demam. Manfaatnya dalam penanganan d', 300, 'https://images.k24klik.com/product/large/apotek_online_k24klik_20211227093836359225_PARACETAMOL-KF-500MG-TAB-1000S-removebg-preview.png'),
(6, 'Panadol Biru Tablet 1 Strip', 12500, 2000, 'PANADOL merupakan obat dengan kandungan Paracetamol yang dapat digunakan untuk meringankan rasa sakit pada sakit kepala, sakit gigi, sakit pada otot dan menurunkan demam.', 300, 'https://images.k24klik.com/product/apotek_online_k24klik_20160721040527291_45-Panadol-Paracetamol.jpg'),
(7, 'Erha Acneact Acne Spot Gel 10g', 70000, 600, 'ERHA Acneact Acne Spot Gel merupakan obat jerawat dari ERHA terbukti secara klinis menghilangkan jerawat dan noda hitam bekas jerawat sejak hari ketiga. Diformulasikan untuk mengurangi peradangan, mem', 50, 'https://images.k24klik.com/product/apotek_online_k24klik_20210503114702359225_Acne-Spot-Gel.jpg'),
(8, 'Erha Acneact Acne Back 100ml Spray', 96000, 700, 'kembangkan dengan formula dermatologi Erha Acneact Acne Back Spray diformulasikan dan dirancang khusus untuk mengatasi jerawat punggung, dada dan pada bagian tubuh lainnya. Aman digunakan sehari-hari ', 100, 'https://images.k24klik.com/product/large/apotek_online_k24klik_20210503115208359225_Acne-Back-Spray.jpg'),
(10, 'Curmino Plus Kapsul', 70000, 300, 'Curmino Plus merupakan kapsul dari ekstak alami yang mengandung temulawak, sambiloto dan kayu manis yang dapat berperan sebagai pelindung kesehatan hati, dan dapat membantu memperbaiki daya tahan tubu', 50, 'https://images.k24klik.com/product/large/apotek_online_k24klik_2020061808352223085_CURMINO.jpg'),
(11, 'Jamu Iboe Jinten Hitam Tablet', 56000, 400, 'Jamu Iboe Jinten Hitam merupakan suplemen herbal yang berkhasiat dalam memelihara daya tahan tubuh agar kesehatan tetap terjaga dengan baik. Sesuai dengan namanya, produk ini mengandung ekstrak Jinten', 500, 'https://images.tokopedia.net/img/cache/500-square/product-1/2020/8/28/1306630/1306630_959a1316-8321-424d-b742-7f8336b2ab2c_1280_1280.jpg'),
(12, 'Holisticare Super Ester C Tablet (isi 30 Tablet)', 55000, 400, 'Suplementasi vitamin c untuk membantu memelihara daya tahan tubuh. Suplemen bukan untuk menggantikan asupan nutrisi dari pola makan sehat.', 50, 'https://images.k24klik.com/product/apotek_online_k24klik_2020043001532023085_Holis30.jpg'),
(13, 'Enervon C Tablet (isi 30 Tablet)', 40000, 400, 'Multivitamin untuk menjaga daya tahan tubuh dengan komposisi vitamin c 500mg, niasinamida 50 mg, kalsium pantotenat 20 mg, vitamin b1 50 mg, vitamin b2 25 mg, vitamin b6 10 mg, vitamin b12 5 mcg', 70, 'https://images.k24klik.com/product/apotek_online_k24klik_20200814030017359225_ENERVON-C-30-TAB.jpg'),
(14, 'Vitalong C Kapsul (isi 30 Kapsul)', 50000, 600, 'VITALONG C merupakan kapsul lepas berkala, karena didalam kapsul berisi granul-granul vitamin C yang larut secara bertahap didalam tubuh selama 12 jam. Suplemen ini mengandung Vitamin C 500 mg yang be', 40, 'https://images.k24klik.com/product/0112c0040.jpg'),
(15, 'Imboost Extra Vitc & D3 (per Strip Isi 8 Tablet)', 45000, 499, 'IMBOOST EXTRA VIT C & D3 merupakan suplemen dengan kandungan Echinacea & Zinc yang dilengkapi dengan penambahan Vitamin C + Vitamin D yang bekerja secara sinergis untuk meningkatkan sistem kekebalan t', 50, 'https://images.k24klik.com/product/apotek_online_k24klik_20220316110057359225_imboost-.png'),
(16, 'Diatabs Tablet Per Strip Isi 4 Tablet', 3000, 7000, 'Diapet merupakan obat herbal yang mengandung ekstrak daun jambu biji, kunyit, buah mojokeling dan kulit buah delima yang dikemas dalam bentuk sediaan kapsul. Diapet digunakan untuk membantu mengurangi', 2000, 'https://images.k24klik.com/product/0101d0034.jpg'),
(17, 'Hansaplast Rol 1.25cmx5m', 13000, 900, 'HANSAPLAST PLESTER TRANSPARAN merupakan plaster penutup luka untuk mencegah infeksi pada luka selama proses penyembuhan. Produk ini dibuat dari bahan elastis yang akan mengikuti tiap lekukan kulit seh', 50, 'https://images.k24klik.com/product/apotek_online_k24klik_20210715034947359225_HP-ROLL-KAIN-2.5CM-X-4.5M-HOSPITAL.jpg'),
(18, 'Betadine Plaster Elastic', 13000, 5000, 'Betadine Plester 5 Lembar merupakan plester untuk luka dengan bahan kain yang elastis dilengkapi dengan perekat berbasis Zinc Oxide Natural Rubber yang membuat Plester Elastic Fabric dapat melekat sec', 600, 'https://images.k24klik.com/product/apotek_online_k24klik_20210224013105359225_BETADINE-PLASTER.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`personid`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`personid`,`productid`,`deliveryid`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`personid`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`deliveryid`);

--
-- Indexes for table `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`personid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `delivery`
--
ALTER TABLE `delivery`
  MODIFY `deliveryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `persons`
--
ALTER TABLE `persons`
  MODIFY `personid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
