-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Jun 2023 pada 12.11
-- Versi server: 10.4.22-MariaDB
-- Versi PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `whatsapp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` enum('L','P') NOT NULL,
  `status_aktif` enum('Y','T') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id`, `nama`, `jenis_kelamin`, `status_aktif`) VALUES
(1, 'Rizky Mutiara Citra', 'P', 'Y'),
(2, 'Rindhi Dwi Fibrianti', 'P', 'Y'),
(3, 'Fakhri Azra', 'L', 'Y'),
(4, 'Zaskia ', 'P', 'Y'),
(5, 'Hidayat', 'L', 'T'),
(6, 'Rizky Dwi Saputra', 'L', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `grup`
--

CREATE TABLE `grup` (
  `id` char(25) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `grup`
--

INSERT INTO `grup` (`id`, `nama`) VALUES
('01', 'Programmer'),
('02', 'Analis'),
('03', 'Tester'),
('04', 'Support');

-- --------------------------------------------------------

--
-- Struktur dari tabel `log_pesan`
--

CREATE TABLE `log_pesan` (
  `id` varchar(25) NOT NULL,
  `nomor_pengirim` char(25) NOT NULL,
  `alias` text NOT NULL,
  `pesan` text NOT NULL,
  `tgljam_terima` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `log_pesan`
--

INSERT INTO `log_pesan` (`id`, `nomor_pengirim`, `alias`, `pesan`, `tgljam_terima`) VALUES
('1685766968', '6281515875409', 'Rindhi Dwi Fibrianti', 'test', '2023-06-03 11:36:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `telp`
--

CREATE TABLE `telp` (
  `id` int(11) NOT NULL,
  `no_telp` char(20) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `id_grup` char(25) NOT NULL,
  `status_aktif` enum('Y','T') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Dumping data untuk tabel `telp`
--

INSERT INTO `telp` (`id`, `no_telp`, `id_anggota`, `id_grup`, `status_aktif`) VALUES
(1, '6282244078183', 3, '02', 'Y'),
(2, '6285785947685', 3, '04', 'Y'),
(3, '6281515875409', 2, '01', 'Y'),
(4, '6281515875409', 2, '02', 'Y'),
(5, '6281515875409', 1, '03', 'Y'),
(6, '6285785947685', 4, '04', 'Y'),
(7, '6285785947685', 5, '01', 'T'),
(8, '6281515875409', 6, '04', 'Y'),
(9, '6282244078183', 6, '02', 'Y');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `grup`
--
ALTER TABLE `grup`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indeks untuk tabel `log_pesan`
--
ALTER TABLE `log_pesan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `telp`
--
ALTER TABLE `telp`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `telp`
--
ALTER TABLE `telp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
