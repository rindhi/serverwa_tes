-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2022 at 10:40 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokobuku`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `Kode_Buku` varchar(6) NOT NULL,
  `Judul` varchar(100) NOT NULL,
  `ID_Pengarang` varchar(3) NOT NULL,
  `ID_Penerbit` varchar(3) NOT NULL,
  `ISBN` varchar(25) NOT NULL,
  `Tahun_Terbit` varchar(4) NOT NULL,
  `Rak` varchar(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`Kode_Buku`, `Judul`, `ID_Pengarang`, `ID_Penerbit`, `ISBN`, `Tahun_Terbit`, `Rak`) VALUES
('165311', 'Membangun Aplikasi Handphone dengan FBUS & Visual Basic', '201', '101', '979-731-075-2', '2004', 'R45'),
('165312', 'Pemrograman Visual Basic 6.0', '201', '101', '979-731-828-1', '2005', 'H65'),
('165313', 'Membuat Menu Cantik Untuk Aplikasi Visual Basic 6.0', '203', '101', '979-731-647-5', '2005', 'J77'),
('165314', 'Pemrograman Tingkat Lanjut dengan Visual Basic 6.0 dan Crystal Report', '202', '101', '979-763-031-5', '2005', 'J77'),
('165315', 'Visual Basic .NET 2005', '204', '101', '979-763-380-2', '2006', 'H65'),
('165316', 'Panduan Pemrograman dan Referensi Kamus Visual Basic 6.0', '202', '101', '979-763-336-5', '2006', 'F32'),
('165317', 'Kumpulan Tip Trik Pemrograman Visual Basic', '205', '101', '979-763-654-2', '2007', 'D11'),
('165318', 'Mudah & Cepat Menguasai Visual Basic', '206', '102', '978-979-794-067-6', '2008', 'H98'),
('165319', 'Pemrograman Web Dinamis dengan Kolaborasi PHP & JAVA', '207', '101', '978-979-29-0262-4', '2008', 'H53'),
('165320', 'Mengotak-Atik Windows dengan VB Script', '208', '103', '978-979-1078-34-4', '2008', 'J66'),
('165321', 'Membangun Aplikasi Toko dengan Visual Basic 2008', '209', '101', '978-979-29-0977-7', '2009', 'G32'),
('165322', 'Membuat Sendiri Kontrol ActiveX dengan Visual Basic 6.0 untuk Orang Awam', '210', '104', '978-979-1398-70-1', '2009', 'V54'),
('165323', 'Membuat SMS Gateway (ESME) Berbasis Protokol SMPP', '211', '101', '978-979-29-0720-9', '2009', 'A21'),
('165324', 'Rekayasa Perangkat Lunak', '212', '101', '978-979-29-1347-7', '2010', 'A09'),
('165325', 'Shortcourse Series: SQL Server 2008 Express', '209', '101', '978-979-29-1532-7', '2010', 'A66'),
('165326', 'Learning By Sample Visual Basic 2008', '213', '105', '979-602-8470-64-3', '2020', 'D43'),
('165327', 'Paling dicari: Visual Basic 2010 Source Code', '209', '101', '978-979-29-`676-8', '2010', 'J77'),
('165328', 'Pemrograman Aplikasi Database dengan Microsoft Visual Basic .NET 2008', '214', '106', '978-979-1153-90-4', '2010', 'F78'),
('165329', 'Pemodelan Basis Data Berorientasi Objek', '215', '101', '978-979-29-1712-3', '2010', 'D44'),
('165330', 'Belajar dan Memahami MapInfo', '216', '106', '978-979-1153-99-7', '2012', 'D48'),
('165331', 'Sistem Penerimaan Mahasiswa Baru Berbasis Web & Mobile', '217', '107', '978-979-1758-75-8', '2011', 'H74'),
('165332', 'Keamanan Sistem Informasi', '218', '101', '978-979-29-1792-5', '2011', 'G32'),
('165333', 'Kupas Tuntas Bermacam Aplikasi Generasi Cloud Computing', '209', '101', '978-979-29-2626-2', '2011', 'C45'),
('165334', 'Menggunakan UML (Unified Modeling Language)', '219', '106', '978-602-8758-38-3', '2011', 'C68'),
('165335', 'Shortcourse Series: Android Programming with Eclipse', '209', '101', '978-979-29-4021-3', '2013', 'J66'),
('165336', 'Pemrograman Desktop Database Phyton - MySQL dengan BOA Constructor', '220', '101', '978-979-29-4053-4', '2013', 'P09'),
('165337', 'Visual Basic .NET: Membuat Aplikasi Database dan Program Kreatif', '221', '106', '978-602-1514-37-5', '2014', 'R45'),
('165338', 'Membuat Website Mudah dan Praktis dengan Weebly', '222', '108', '978-602-02-4698-7', '2014', 'G44'),
('165339', 'Kumpulan Lengkap Syntax untuk Programmer Pemula', '223', '109', '979-877-389-6', '2014', 'H65'),
('165340', 'Aplikasi Bisnis dengan PHP dan MySQL', '210', '104', '978-602-7680-69-2', '2020', 'D33'),
('165341', 'Pemrograman Web', '221', '106', '978-602-1514-48-1', '2014', 'V54'),
('165342', 'Mudah Membuat Aplikasi SMS Gateway dengan CodeIgniter', '209', '108', '978-602-02-4272-9', '2014', 'A11'),
('165343', 'From Zero to a Pro JavaScript & jQuery', '224', '101', '978-979-29-3987-3', '2014', 'J66'),
('165344', 'From Zero to A Pro Android', '224', '101', '978-979-29-2153-3', '2013', 'D11');

-- --------------------------------------------------------

--
-- Stand-in structure for view `buku_view`
-- (See below for the actual view)
--
CREATE TABLE `buku_view` (
`Kode_Buku` varchar(6)
,`Judul` varchar(100)
,`Pengarang` varchar(50)
,`Penerbit` varchar(50)
,`ISBN` varchar(25)
,`Tahun_Terbit` varchar(4)
,`Rak` varchar(3)
);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `nama` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `password` text CHARACTER SET utf8mb4 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `nama`, `password`) VALUES
('admin', 'Administrator', '6c3089a3ec0632dcb1133820410f78e8');

-- --------------------------------------------------------

--
-- Table structure for table `log_history`
--

CREATE TABLE `log_history` (
  `id` char(25) NOT NULL,
  `data` varchar(50) NOT NULL,
  `operasi` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  `id_user` char(25) NOT NULL,
  `tgl` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `ID_Penerbit` varchar(3) NOT NULL,
  `Nama_Penerbit` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`ID_Penerbit`, `Nama_Penerbit`) VALUES
('100', 'Testing Penerbit'),
('101', 'Andi Publisher'),
('102', 'Mediakita'),
('103', 'Gaya Media'),
('104', 'Maxikom'),
('105', 'Prestasi Pustaka'),
('106', 'Informatika'),
('107', 'Lokomedia'),
('108', 'Elex Media Komputindo'),
('109', 'Mediakom'),
('111', 'AA Excelcom'),
('112', 'BB Basher');

-- --------------------------------------------------------

--
-- Table structure for table `pengarang`
--

CREATE TABLE `pengarang` (
  `ID_Pengarang` varchar(3) NOT NULL,
  `Nama_Pengarang` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengarang`
--

INSERT INTO `pengarang` (`ID_Pengarang`, `Nama_Pengarang`) VALUES
('201', 'X-Oerang'),
('202', 'Madcoms'),
('203', 'Ridwan Sanjaya, SE, S.Kom'),
('204', 'Widodo Budiharto, M.Kom'),
('205', 'Jaja Jamaludin Malik'),
('206', 'Ir. Suryanto Thabrani, MM'),
('207', 'Afriyudi, M.Kom'),
('208', 'VygoriViva CR'),
('209', 'Wahana Komputer'),
('210', 'Muhammad Sadeli'),
('211', 'Romzi Imron Rozidi'),
('212', 'Janner Simarmata'),
('213', 'Soetam Rizky'),
('214', 'Ketut Darmayuda'),
('215', 'Wiranto Herry Utomo'),
('216', 'Ir. Eddy Prahasta, MT'),
('217', 'Sidiq Wahyu'),
('218', 'IBISA'),
('219', 'Prabowo Pudjo Widodo'),
('220', 'Kharisma Kholid Hudaya'),
('221', 'Priyanto Hidayatullah'),
('222', 'Fathurrahman, S.Pd'),
('223', 'eWolf Community'),
('224', 'Abdul Kadir');

-- --------------------------------------------------------

--
-- Structure for view `buku_view`
--
DROP TABLE IF EXISTS `buku_view`;

CREATE VIEW `buku_view`  AS  select `a`.`Kode_Buku` AS `Kode_Buku`,`a`.`Judul` AS `Judul`,`b`.`Nama_Pengarang` AS `Pengarang`,`c`.`Nama_Penerbit` AS `Penerbit`,`a`.`ISBN` AS `ISBN`,`a`.`Tahun_Terbit` AS `Tahun_Terbit`,`a`.`Rak` AS `Rak` from ((`buku` `a` left join `pengarang` `b` on(`a`.`ID_Pengarang` = `b`.`ID_Pengarang`)) left join `penerbit` `c` on(`a`.`ID_Penerbit` = `c`.`ID_Penerbit`)) order by `a`.`Kode_Buku` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`Kode_Buku`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `log_history`
--
ALTER TABLE `log_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`ID_Penerbit`);

--
-- Indexes for table `pengarang`
--
ALTER TABLE `pengarang`
  ADD PRIMARY KEY (`ID_Pengarang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
