-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Jun 2022 pada 05.41
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hoteluyu`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `resepsionis`
--

CREATE TABLE `resepsionis` (
  `ID` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nokamar` int(25) NOT NULL,
  `tipe` varchar(50) NOT NULL,
  `checkin` date NOT NULL,
  `checkout` date NOT NULL,
  `jml` int(10) NOT NULL,
  `ket` int(11) NOT NULL,
  `status` enum('Konfirmasi','Booking','Leave') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `resepsionis`
--

INSERT INTO `resepsionis` (`ID`, `nama`, `email`, `nokamar`, `tipe`, `checkin`, `checkout`, `jml`, `ket`, `status`) VALUES
(88, 'Dany Syauqi', 'danysyauqi@gmail.com', 2147483647, 'Single Room', '2022-05-11', '2022-05-14', 2, 0, 'Konfirmasi'),
(89, 'Michael Afton', 'michmike@gmail.com', 44445, 'Single Room', '2022-05-30', '2022-06-01', 2, 0, 'Booking'),
(90, 'iiiiii', 'iiii@gmail.com', 10, 'Deluxe Room', '2022-06-12', '2022-06-12', 1, 0, 'Konfirmasi'),
(91, 'Athar', 'athargemoi@gmail.com', 12, 'Single Room', '2022-05-29', '2022-05-31', 1, 0, 'Konfirmasi'),
(92, 'michael', 'mike@gmail.com', 14, 'Superior Room', '2022-06-11', '2022-06-12', 1, 3, 'Konfirmasi');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `resepsionis`
--
ALTER TABLE `resepsionis`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `resepsionis`
--
ALTER TABLE `resepsionis`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
