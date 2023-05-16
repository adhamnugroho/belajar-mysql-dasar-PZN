-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Bulan Mei 2023 pada 17.21
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `belajar_mysql`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `first_name`, `last_name`) VALUES
(1, 'Eko', 'Khannedy'),
(2, 'Budi', 'Nugraha'),
(3, 'Joko', 'Morro');

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_category` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id`, `name`, `description`, `price`, `quantity`, `created_at`, `id_category`) VALUES
('P0001', 'Mie Ayam Original', NULL, 15000, 100, '2022-04-25 08:29:04', 'C0002'),
('P0002', 'Mie Ayam Bakso Tahu', 'Mie Ayam Original +  Bakso Tahu', 20000, 100, '2022-04-25 08:33:10', 'C0002'),
('P0003', 'Mie Ayam Ceker', 'Mie Ayam + Ceker', 20000, 100, '2022-04-25 09:55:58', 'C0002'),
('P0004', 'Mie Ayam Spesial', NULL, 30000, 100, '2022-04-25 09:55:58', 'C0002'),
('P0005', 'Mie Ayam Yamin', NULL, 15000, 100, '2022-04-25 09:55:58', 'C0002'),
('P0006', 'Bakso Rusuk', '', 25000, 200, '2022-10-08 18:11:02', 'C0002'),
('P0007', 'Es Jeruk', '', 10000, 300, '2022-10-08 18:11:02', 'C0002'),
('P0008', 'Es Campur', '', 15000, 500, '2022-10-08 18:11:02', 'C0002'),
('P0009', 'Es Teh Manis', '', 5000, 400, '2022-10-08 18:11:02', 'C0002'),
('P0010', 'Kerupuk', '', 2500, 1000, '2022-10-08 18:11:02', 'C0003'),
('P0011', 'Keripik Udang', '', 10000, 300, '2022-10-08 18:11:02', 'C0003'),
('P0012', 'Es Krim', '', 5000, 200, '2022-10-08 18:11:02', 'C0003'),
('P0013', 'Mie Ayam Jamur', '', 20000, 50, '2022-10-08 18:11:02', 'C0002'),
('P0014', 'Bakso Telor', '', 20000, 150, '2022-10-08 18:11:02', 'C0002'),
('P0015', 'Bakso Jando', '', 25000, 300, '2022-10-08 18:11:02', 'C0002'),
('P0016', 'Permen', '', 1000, 1000, '2022-10-08 18:11:02', 'C0003');

-- --------------------------------------------------------

--
-- Struktur dari tabel `categories`
--

CREATE TABLE `categories` (
  `id` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
('C0001', 'Makanan'),
('C0002', 'Minuman'),
('C0003', 'Lain - Lain');

-- --------------------------------------------------------

--
-- Struktur dari tabel `numbers`
--

CREATE TABLE `numbers` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `numbers`
--

INSERT INTO `numbers` (`id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `total`, `order_date`) VALUES
(1, 50000, '2022-10-09 02:31:11'),
(2, 50000, '2022-10-09 02:31:55'),
(3, 50000, '2022-10-09 02:31:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders_detail`
--

CREATE TABLE `orders_detail` (
  `id_barang` varchar(10) NOT NULL,
  `id_order` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders_detail`
--

INSERT INTO `orders_detail` (`id_barang`, `id_order`, `price`, `quantity`) VALUES
('P0001', 1, 25000, 1),
('P0001', 3, 25000, 1),
('P0002', 1, 25000, 1),
('P0003', 2, 25000, 1),
('P0003', 3, 25000, 1),
('P0004', 2, 25000, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembeli`
--

CREATE TABLE `pembeli` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pembeli`
--

INSERT INTO `pembeli` (`id`, `email`, `first_name`, `last_name`) VALUES
(1, 'eko@gmail.com', 'Eko', 'Kurniawan'),
(2, 'kurniawan@gmail.com', 'Eko', 'Kurniawan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjual`
--

CREATE TABLE `penjual` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sembarang`
--

CREATE TABLE `sembarang` (
  `id_pesan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `wallet`
--

CREATE TABLE `wallet` (
  `id` int(11) NOT NULL,
  `id_pembeli` int(11) NOT NULL,
  `balance` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `id_barang` varchar(10) NOT NULL,
  `description` text DEFAULT NULL,
  `id_pembeli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `wishlist`
--

INSERT INTO `wishlist` (`id`, `id_barang`, `description`, `id_pembeli`) VALUES
(4, 'P0001', 'Makanan Kesukaan', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_categories` (`id_category`);

--
-- Indeks untuk tabel `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `numbers`
--
ALTER TABLE `numbers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD PRIMARY KEY (`id_barang`,`id_order`),
  ADD KEY `fk_orders_detail_order` (`id_order`);

--
-- Indeks untuk tabel `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_unique` (`email`);

--
-- Indeks untuk tabel `penjual`
--
ALTER TABLE `penjual`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_unique` (`email`),
  ADD KEY `name_index` (`name`);

--
-- Indeks untuk tabel `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_pembeli_unique` (`id_pembeli`);

--
-- Indeks untuk tabel `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_wishlist_barang` (`id_barang`),
  ADD KEY `fk_wishlist_pembeli` (`id_pembeli`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pembeli`
--
ALTER TABLE `pembeli`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `penjual`
--
ALTER TABLE `penjual`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `fk_product_categories` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`);

--
-- Ketidakleluasaan untuk tabel `orders_detail`
--
ALTER TABLE `orders_detail`
  ADD CONSTRAINT `fk_orders_detail_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`),
  ADD CONSTRAINT `fk_orders_detail_order` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`);

--
-- Ketidakleluasaan untuk tabel `wallet`
--
ALTER TABLE `wallet`
  ADD CONSTRAINT `fk_wallet_pembeli` FOREIGN KEY (`id_pembeli`) REFERENCES `pembeli` (`id`);

--
-- Ketidakleluasaan untuk tabel `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `fk_wishlist_barang` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`),
  ADD CONSTRAINT `fk_wishlist_pembeli` FOREIGN KEY (`id_pembeli`) REFERENCES `pembeli` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
