-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2023 at 06:01 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_sdm`
--

-- --------------------------------------------------------

--
-- Table structure for table `jenis_ijin`
--

CREATE TABLE `jenis_ijin` (
  `id_ijin` varchar(5) NOT NULL,
  `keterangan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pengajuan_ijin`
--

CREATE TABLE `pengajuan_ijin` (
  `id_pengajuanijin` varchar(5) NOT NULL,
  `id_ijin` varchar(5) NOT NULL,
  `tgl_ijin` date NOT NULL,
  `akhir_ijin` date NOT NULL,
  `keterangan` varchar(10) NOT NULL,
  `status_pengajuan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pengembangan_diri`
--

CREATE TABLE `pengembangan_diri` (
  `id_pengembangan` varchar(5) NOT NULL,
  `jenis_pelatihan` varchar(10) NOT NULL,
  `institusi` varchar(30) NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  `keterangan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_absensi`
--

CREATE TABLE `tb_absensi` (
  `id_absensi` varchar(5) NOT NULL,
  `nip` int(11) NOT NULL,
  `id_pengajuanijin` varchar(5) NOT NULL,
  `tanggal` date NOT NULL,
  `shift` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_gaji`
--

CREATE TABLE `tb_gaji` (
  `id_gaji` varchar(5) NOT NULL,
  `id_absensi` varchar(5) NOT NULL,
  `gaji_pokok` varchar(15) NOT NULL,
  `ptngn_gaji` varchar(15) NOT NULL,
  `lembur` varchar(15) NOT NULL,
  `total_gaji` varchar(15) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pegawai`
--

CREATE TABLE `tb_pegawai` (
  `nip` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(11) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_hp` int(12) NOT NULL,
  `agama` varchar(11) NOT NULL,
  `status` varchar(11) NOT NULL,
  `id_pendidikan` varchar(5) NOT NULL,
  `id_pengembangan` varchar(5) NOT NULL,
  `no_rekening` int(30) NOT NULL,
  `pemilik_rekening` varchar(50) NOT NULL,
  `npwp` int(30) NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `id_gaji` varchar(5) NOT NULL,
  `id_tunjangan` varchar(5) NOT NULL,
  `id_pengguna` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pendidikan`
--

CREATE TABLE `tb_pendidikan` (
  `id_pendidikan` varchar(5) NOT NULL,
  `jenjang` varchar(10) NOT NULL,
  `jurusan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id_pengguna` varchar(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(10) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_tunjangan`
--

CREATE TABLE `tb_tunjangan` (
  `id_tunjangan` varchar(5) NOT NULL,
  `bpjs` varchar(15) NOT NULL,
  `thr` varchar(15) NOT NULL,
  `jht` varchar(15) NOT NULL,
  `total_tunjangan` varchar(15) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jenis_ijin`
--
ALTER TABLE `jenis_ijin`
  ADD PRIMARY KEY (`id_ijin`);

--
-- Indexes for table `pengajuan_ijin`
--
ALTER TABLE `pengajuan_ijin`
  ADD PRIMARY KEY (`id_pengajuanijin`),
  ADD KEY `nip` (`id_ijin`);

--
-- Indexes for table `pengembangan_diri`
--
ALTER TABLE `pengembangan_diri`
  ADD PRIMARY KEY (`id_pengembangan`);

--
-- Indexes for table `tb_absensi`
--
ALTER TABLE `tb_absensi`
  ADD PRIMARY KEY (`id_absensi`),
  ADD KEY `nip` (`nip`,`id_pengajuanijin`),
  ADD KEY `id_pengajuanijin` (`id_pengajuanijin`);

--
-- Indexes for table `tb_gaji`
--
ALTER TABLE `tb_gaji`
  ADD PRIMARY KEY (`id_gaji`),
  ADD KEY `nip` (`id_absensi`),
  ADD KEY `id_absensi` (`id_absensi`);

--
-- Indexes for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD PRIMARY KEY (`nip`),
  ADD KEY `id_pendidikan` (`id_pendidikan`,`id_pengembangan`,`id_gaji`,`id_tunjangan`,`id_pengguna`),
  ADD KEY `id_gaji` (`id_gaji`),
  ADD KEY `id_pengguna` (`id_pengguna`),
  ADD KEY `id_pengembangan` (`id_pengembangan`),
  ADD KEY `id_tunjangan` (`id_tunjangan`);

--
-- Indexes for table `tb_pendidikan`
--
ALTER TABLE `tb_pendidikan`
  ADD PRIMARY KEY (`id_pendidikan`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indexes for table `tb_tunjangan`
--
ALTER TABLE `tb_tunjangan`
  ADD PRIMARY KEY (`id_tunjangan`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pengajuan_ijin`
--
ALTER TABLE `pengajuan_ijin`
  ADD CONSTRAINT `pengajuan_ijin_ibfk_1` FOREIGN KEY (`id_ijin`) REFERENCES `jenis_ijin` (`id_ijin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_absensi`
--
ALTER TABLE `tb_absensi`
  ADD CONSTRAINT `tb_absensi_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `tb_pegawai` (`nip`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_absensi_ibfk_3` FOREIGN KEY (`id_pengajuanijin`) REFERENCES `pengajuan_ijin` (`id_pengajuanijin`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_gaji`
--
ALTER TABLE `tb_gaji`
  ADD CONSTRAINT `tb_gaji_ibfk_1` FOREIGN KEY (`id_absensi`) REFERENCES `tb_absensi` (`id_absensi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD CONSTRAINT `tb_pegawai_ibfk_1` FOREIGN KEY (`id_gaji`) REFERENCES `tb_gaji` (`id_gaji`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pegawai_ibfk_2` FOREIGN KEY (`id_pengguna`) REFERENCES `tb_pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pegawai_ibfk_3` FOREIGN KEY (`id_pengembangan`) REFERENCES `pengembangan_diri` (`id_pengembangan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pegawai_ibfk_4` FOREIGN KEY (`id_tunjangan`) REFERENCES `tb_tunjangan` (`id_tunjangan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_pegawai_ibfk_5` FOREIGN KEY (`id_pendidikan`) REFERENCES `tb_pendidikan` (`id_pendidikan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
