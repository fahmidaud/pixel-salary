-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 01, 2023 at 05:46 AM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gaji_webapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `idadmin` int(5) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL,
  `namalengkap` varchar(40) NOT NULL,
  `photo` varchar(50) NOT NULL DEFAULT 'Avatar.png',
  `email` varchar(50) NOT NULL,
  `level` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`idadmin`, `username`, `password`, `namalengkap`, `photo`, `email`, `level`) VALUES
(1, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Pixel', 'admin361552.png', 'pixelsalary@gmail.com', 'admin'),
(10, 'fahmiadmin', '0ddff0c492465695c3d7936ef4a83de69f1895fb', 'Fahmi Daud Abdillah', 'admin3615521.png', 'fahmidaud354@gmail.com', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `golongan`
--

CREATE TABLE `golongan` (
  `kode_golongan` varchar(3) NOT NULL,
  `nama_golongan` varchar(50) NOT NULL,
  `tunjangan_suami_istri` int(10) NOT NULL,
  `tunjangan_anak` int(10) NOT NULL,
  `uang_makan` int(10) NOT NULL,
  `uang_lembur` int(10) NOT NULL,
  `asuransi_kesehatan` int(10) NOT NULL,
  `bulan` varchar(20) NOT NULL,
  `tahun` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `golongan`
--

INSERT INTO `golongan` (`kode_golongan`, `nama_golongan`, `tunjangan_suami_istri`, `tunjangan_anak`, `uang_makan`, `uang_lembur`, `asuransi_kesehatan`, `bulan`, `tahun`) VALUES
('G01', 'I', 500000, 250000, 50000, 100000, 300000, '12', '2022'),
('G02', 'II', 700000, 450000, 50000, 200000, 300000, '12', '2022'),
('G03', 'III', 1000000, 750000, 100000, 300000, 500000, '12', '2022'),
('G04', 'IV', 1300000, 1000000, 100000, 400000, 500000, '12', '2022'),
('G05', 'V', 1500000, 1000000, 100000, 400000, 500000, '12', '2022');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `kode_jabatan` varchar(3) NOT NULL,
  `nama_jabatan` varchar(50) NOT NULL,
  `gaji_pokok` int(10) NOT NULL,
  `tunjangan_jabatan` int(10) NOT NULL,
  `potongan_sakit` int(10) NOT NULL,
  `potongan_izin` int(10) NOT NULL,
  `potongan_alpha` int(10) NOT NULL,
  `bulan` varchar(20) NOT NULL,
  `tahun` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`kode_jabatan`, `nama_jabatan`, `gaji_pokok`, `tunjangan_jabatan`, `potongan_sakit`, `potongan_izin`, `potongan_alpha`, `bulan`, `tahun`) VALUES
('J01', 'Direktur Utama', 8000000, 4500000, 0, 240000, 400000, '12', '2022'),
('J02', 'HRD', 5000000, 2500000, 0, 150000, 250000, '12', '2022'),
('J03', 'Management & Accountant', 4000000, 2000000, 0, 120000, 200000, '12', '2022'),
('J04', 'Marketing', 3000000, 1500000, 0, 90000, 150000, '12', '2022'),
('J05', 'Operational', 2000000, 1000000, 0, 60000, 100000, '12', '2022');

-- --------------------------------------------------------

--
-- Table structure for table `master_gaji`
--

CREATE TABLE `master_gaji` (
  `id` int(11) NOT NULL,
  `bulan` varchar(20) NOT NULL,
  `tahun` varchar(20) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `masuk` int(5) NOT NULL,
  `sakit` int(5) NOT NULL,
  `izin` int(5) NOT NULL,
  `alpha` int(5) NOT NULL,
  `lembur` int(5) NOT NULL,
  `uang_lembur` int(15) NOT NULL,
  `potongan` int(10) NOT NULL,
  `potongan_sakit` int(10) NOT NULL,
  `potongan_izin` int(10) NOT NULL,
  `potongan_alpha` int(10) NOT NULL,
  `pendapatan` int(15) NOT NULL,
  `total_gaji` int(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `master_gaji`
--

INSERT INTO `master_gaji` (`id`, `bulan`, `tahun`, `nip`, `masuk`, `sakit`, `izin`, `alpha`, `lembur`, `uang_lembur`, `potongan`, `potongan_sakit`, `potongan_izin`, `potongan_alpha`, `pendapatan`, `total_gaji`) VALUES
(654, '12', '2022', '105', 27, 1, 1, 1, 0, 0, 0, 0, 60000, 100000, 4600000, 4440000),
(653, '12', '2022', '104', 28, 1, 1, 0, 0, 0, 0, 0, 90000, 0, 6900000, 6810000),
(652, '12', '2022', '103', 29, 1, 0, 0, 1, 300000, 0, 0, 0, 0, 6900000, 6900000),
(651, '12', '2022', '102', 30, 0, 0, 0, 2, 800000, 0, 0, 0, 0, 11200000, 11200000),
(650, '12', '2022', '101', 30, 0, 0, 0, 1, 400000, 0, 0, 0, 0, 15000000, 15000000),
(655, '01', '2023', '101', 29, 1, 0, 0, 1, 400000, 0, 0, 0, 0, 15000000, 15000000),
(656, '01', '2023', '102', 28, 1, 1, 0, 0, 0, 0, 0, 150000, 0, 10400000, 10250000),
(657, '01', '2023', '103', 27, 1, 1, 1, 1, 300000, 0, 0, 120000, 200000, 6900000, 6580000),
(658, '01', '2023', '104', 26, 0, 3, 1, 3, 600000, 0, 0, 270000, 150000, 7500000, 7080000),
(659, '01', '2023', '105', 26, 1, 2, 1, 5, 500000, 0, 0, 120000, 100000, 5100000, 4880000);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `nip` varchar(20) NOT NULL,
  `namalengkap` varchar(40) NOT NULL,
  `kode_jabatan` varchar(3) NOT NULL,
  `kode_golongan` varchar(3) NOT NULL,
  `status` varchar(15) NOT NULL,
  `jumlah_anak` int(2) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL,
  `photo` varchar(50) NOT NULL DEFAULT 'Avatar.png',
  `email` varchar(50) NOT NULL,
  `bulan` varchar(20) NOT NULL,
  `tahun` varchar(20) NOT NULL,
  `alamat` varchar(500) NOT NULL,
  `notelp` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`nip`, `namalengkap`, `kode_jabatan`, `kode_golongan`, `status`, `jumlah_anak`, `username`, `password`, `photo`, `email`, `bulan`, `tahun`, `alamat`, `notelp`) VALUES
('101', 'Nunik Tri Wahyuni ', 'J01', 'G05', 'Menikah', 0, 'nuniktri', '2bf3e2e1e3ce5ea28cc4dc59a12497ae28d1da44', 'Avatar1.png', 'nuniktri@gmail.com', '12', '2022', 'Jakarta Timur', '081582637468'),
('102', 'Endang Ritnowati', 'J02', 'G04', 'Menikah', 1, 'endangritnowati', '94bdcf107bfa68eb366704a287b6272c9e88cddf', 'Avatar2.png', 'endangritnowati@gmail.com', '12', '2022', 'Bekasi', '0819264859475'),
('103', 'Wido Wati', 'J03', 'G03', 'Belum Menikah', 0, 'widowati', '4f466eb64780777b979da1b674d5908141c4507a', 'Avatar3.png', 'widowati@gmail.com', '12', '2022', 'Jakarta Pusat', '0851347495748'),
('104', 'Sri Widodo', 'J04', 'G02', 'Menikah', 3, 'sriwidodo', 'de5dad71ffd0358248209ce9fbe619ed5a8e1449', 'Avatar4.png', 'sriwidodo@gmail.com', '12', '2022', 'Jakarta Utara', '08192746895'),
('105', 'Samsul Akhiyar', 'J05', 'G01', 'Menikah', 5, 'samsulakhiyar', '58dacd89a9b2e1a8fdbff658f97055c95a213203', 'Avatar5.png', 'samsulakhiyar@gmail.com', '12', '2022', 'Jakarta Barat', '0878273843347');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`idadmin`);

--
-- Indexes for table `golongan`
--
ALTER TABLE `golongan`
  ADD PRIMARY KEY (`kode_golongan`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`kode_jabatan`);

--
-- Indexes for table `master_gaji`
--
ALTER TABLE `master_gaji`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nip` (`nip`) USING BTREE;

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `kode_jabatan` (`kode_jabatan`),
  ADD KEY `kode_golongan` (`kode_golongan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `idadmin` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `master_gaji`
--
ALTER TABLE `master_gaji`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=660;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
