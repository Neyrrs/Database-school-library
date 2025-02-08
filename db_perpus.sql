-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 08, 2025 at 03:45 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_perpus`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteBuku` (IN `p_id_buku` INT)   BEGIN
    DELETE FROM buku WHERE id_buku = p_id_buku;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeletePeminjaman` (IN `p_id_peminjaman` INT)   BEGIN
    DELETE FROM peminjaman WHERE id_peminjaman = p_id_peminjaman;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteSiswa` (IN `p_id_siswa` INT)   BEGIN
    DELETE FROM siswa WHERE id_siswa = p_id_siswa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DisplayTable` (IN `nama_table` VARCHAR(100))   BEGIN
	SELECT * FROM nama_table;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertBuku` (IN `p_id_buku` INT, IN `p_judul_buku` VARCHAR(255), IN `p_penulis` VARCHAR(100), IN `p_kategori` VARCHAR(50), IN `p_stok` INT)   BEGIN
    INSERT INTO buku (id_buku, judul_buku, penulis, kategori, stok)
    VALUES (p_id_buku, p_judul_buku, p_penulis, p_kategori, p_stok);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertPeminjaman` (IN `p_id_peminjaman` INT, IN `p_id_siswa` INT, IN `p_id_buku` INT, IN `p_tanggal_pinjam` DATE, IN `p_tanggal_kembali` DATE, IN `p_status` ENUM('Dipinjam','Dikembalikan'))   BEGIN
    INSERT INTO peminjaman (id_peminjaman, id_siswa, id_buku, tanggal_pinjam, tanggal_kembali, status)
    VALUES (p_id_peminjaman, p_id_siswa, p_id_buku, p_tanggal_pinjam, p_tanggal_kembali, p_status);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertSiswa` (IN `p_id_siswa` INT, IN `p_nama` VARCHAR(100), IN `p_kelas` VARCHAR(50))   BEGIN
    INSERT INTO siswa (id_siswa, nama, kelas)
    VALUES (p_id_siswa, p_nama, p_kelas);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `KembalikanBuku` (IN `p_id_peminjaman` INT)   BEGIN
    UPDATE peminjaman 
    SET Tanggal_Kembali = CURDATE(), 
        Status = 'Dikembalikan'
    WHERE ID_Peminjaman = p_id_peminjaman;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `TampilkanSemuaSiswa` ()   BEGIN
    SELECT s.ID_Siswa, s.Nama, IFNULL(COUNT(p.ID_Peminjaman), 0) AS TotalPeminjaman
    FROM siswa s
    LEFT JOIN peminjaman p ON s.ID_Siswa = p.ID_Siswa
    GROUP BY s.ID_Siswa;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBuku` (IN `p_id_buku` INT, IN `p_judul_buku` VARCHAR(255), IN `p_penulis` VARCHAR(100), IN `p_kategori` VARCHAR(50), IN `p_stok` INT)   BEGIN
    UPDATE buku
    SET judul_buku = p_judul_buku, penulis = p_penulis, kategori = p_kategori, stok = p_stok
    WHERE id_buku = p_id_buku;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdatePeminjaman` (IN `p_id_peminjaman` INT, IN `p_id_siswa` INT, IN `p_id_buku` INT, IN `p_tanggal_pinjam` DATE, IN `p_tanggal_kembali` DATE, IN `p_status` ENUM('Dipinjam','Dikembalikan'))   BEGIN
    UPDATE peminjaman
    SET id_siswa = p_id_siswa, id_buku = p_id_buku, tanggal_pinjam = p_tanggal_pinjam, tanggal_kembali = p_tanggal_kembali, status = p_status
    WHERE id_peminjaman = p_id_peminjaman;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateSiswa` (IN `p_id_siswa` INT, IN `p_nama` VARCHAR(100), IN `p_kelas` VARCHAR(50))   BEGIN
    UPDATE siswa
    SET nama = p_nama, kelas = p_kelas
    WHERE id_siswa = p_id_siswa;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int NOT NULL,
  `judul_buku` varchar(255) DEFAULT NULL,
  `penulis` varchar(100) DEFAULT NULL,
  `kategori` varchar(50) DEFAULT NULL,
  `stok` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `judul_buku`, `penulis`, `kategori`, `stok`) VALUES
(1, 'Algoritma dan Pemrograman', 'Andi Wijaya', 'Teknologi', 5),
(2, 'Dasar-dasar Database', 'Budi Santoso', 'Teknologi', 7),
(3, 'Matematika Diskrit', 'Rina Sari', 'Matematika', 4),
(4, 'Sejarah Dunia', 'John Smith', 'Sejarah', 3),
(5, 'Pemrograman Web dengan PHP', 'Eko Prasetyo', 'Teknologi', 8),
(6, 'Sistem Operasi', 'Dian Kurniawan', 'Teknologi', 6),
(7, 'Jaringan Komputer', 'Ahmad Fauzi', 'Teknologi', 5),
(8, 'Cerita Rakyat Nusantara', 'Lestari Dewi', 'Sastra', 9),
(9, 'Bahasa Inggris untuk Pemula', 'Jane Doe', 'Bahasa', 10),
(10, 'Biologi Dasar', 'Budi Rahman', 'Sains', 7),
(11, 'Kimia Organik', 'Siti Aminah', 'Sains', 5),
(12, 'Teknik Elektro', 'Ridwan Hakim', 'Teknik', 6),
(13, 'Fisika Modern', 'Albert Einstein', 'Sains', 4),
(14, 'Manajemen Waktu', 'Steven Covey', 'Pengembangan', 8),
(15, 'Strategi Belajar Efektif', 'Tony Buzan', 'Pendidikan', 6);

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_peminjaman` int NOT NULL,
  `id_siswa` int DEFAULT NULL,
  `id_buku` int DEFAULT NULL,
  `tanggal_pinjam` date DEFAULT NULL,
  `tanggal_kembali` date DEFAULT NULL,
  `status` enum('Dipinjam','Dikembalikan') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Triggers `peminjaman`
--
DELIMITER $$
CREATE TRIGGER `after_stok_bertambah` AFTER UPDATE ON `peminjaman` FOR EACH ROW BEGIN
    IF OLD.status = 'Dipinjam' AND NEW.status = 'Dikembalikan' THEN
        UPDATE buku 
        SET stok = stok + 1 
        WHERE id_buku = NEW.id_buku;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `stok_berkurang` AFTER UPDATE ON `peminjaman` FOR EACH ROW BEGIN
    IF OLD.STATUS = 'Dikembalikan' AND NEW.STATUS = 'Dipinjam' THEN
    	UPDATE buku
    	SET stok = stok - 1
    	WHERE id_buku = NEW.id_buku ;
    END IF ;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `kelas` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nama`, `kelas`) VALUES
(1, 'Andi Saputra', 'X-RPL'),
(2, 'Budi Wijaya', 'X-TKJ'),
(3, 'Citra Lestari', 'XI-RPL'),
(4, 'Dewi Kurniawan', 'XI-TKJ'),
(5, 'Eko Prasetyo', 'XII-RPL'),
(6, 'Farhan Maulana', 'XII-TKJ'),
(7, 'Gita Permata', 'X-RPL'),
(8, 'Hadi Sucipto', 'X-TKJ'),
(9, 'Intan Permadi', 'XI-RPL'),
(10, 'Joko Santoso', 'XI-TKJ'),
(11, 'Kartika Sari', 'XII-RPL'),
(12, 'Lintang Putri', 'XII-TKJ'),
(13, 'Muhammad Rizky', 'X-RPL'),
(14, 'Novi Andriana', 'X-TKJ'),
(15, 'Olivia Hernanda', 'XI-RPL');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_peminjaman`),
  ADD KEY `id_siswa` (`id_siswa`),
  ADD KEY `id_buku` (`id_buku`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD CONSTRAINT `peminjaman_ibfk_1` FOREIGN KEY (`id_siswa`) REFERENCES `siswa` (`id_siswa`),
  ADD CONSTRAINT `peminjaman_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
