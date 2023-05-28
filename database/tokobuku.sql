-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Bulan Mei 2023 pada 04.19
-- Versi server: 10.4.21-MariaDB
-- Versi PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_lengkap`) VALUES
(1, 'Ezra', 'ezra12345', 'Muhammadezra');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kurir`
--

CREATE TABLE `kurir` (
  `id_kurir` int(50) NOT NULL,
  `nama_kurir` varchar(100) NOT NULL,
  `tarif` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kurir`
--

INSERT INTO `kurir` (`id_kurir`, `nama_kurir`, `tarif`) VALUES
(1, 'J&T REG (2 Hari Kerja)', 9000),
(2, 'JNE REG (2 Hari Kerja)', 10000),
(3, 'JNE YES (1 Hari Kerja)', 24000),
(4, 'Grab Instan (Lokasi Diluar Service)', 20000),
(5, 'Grab Same Day (Lokasi Diluar Service)', 20000),
(6, 'Rush Delivery by Grab Express (Lokasi Diluar Service)', 20000),
(7, 'GO-SEND Same Day (Lokasi Diluar Service)', 20000),
(8, 'GO-SEND Instant', 20000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `gmail_pelanggan` varchar(100) NOT NULL,
  `password_pelanggan` varchar(50) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `telepon_pelanggan` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `gmail_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`) VALUES
(8, 'Muhammadezra125@gmail.com', '456', 'Muhammad Ezra Maulana', '0898888');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(8, 12, 'Muhammad Ezra Maulana', 'Mandiri', 39000, '2023-05-27', '202305271227590a243255-10ed-4ad9-ad88-29e3cec7ba29.jpg'),
(9, 13, 'Muhammad Ezra Maulana', 'BNI', 110000, '2023-05-28', '20230528020733ezra.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_kurir` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `nama_kurir` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'Tertunda',
  `resi_pengiriman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `id_kurir`, `tanggal_pembelian`, `total_pembelian`, `nama_kurir`, `tarif`, `alamat_pengiriman`, `status_pembelian`, `resi_pengiriman`) VALUES
(12, 8, 1, '2023-05-27', 39000, 'J&T REG (2 Hari Kerja)', 9000, 'bandung', 'Lunas (Barang Terkirim)', '18022470553'),
(13, 8, 2, '2023-05-28', 110000, 'JNE REG (2 Hari Kerja)', 10000, 'bandung', 'Lunas (Barang Terkirim)', 'bndg1313113');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah_pembelian` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah_pembelian`) VALUES
(15, 11, 2, 1),
(16, 11, 3, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `harga_produk` int(11) NOT NULL,
  `berat_produk` int(11) NOT NULL,
  `foto_produk` varchar(100) NOT NULL,
  `deskripsi_produk` text NOT NULL,
  `resep_produk` varchar(100) NOT NULL,
  `stok_produk` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi_produk`, `resep_produk`, `stok_produk`) VALUES
(2, 'Mary Higgins C : Daddy Little Girl', 45000, 150, 'tb1.jpg', '     Ketika Ellie Cavanaugh berusia delapan tahun, kakaknya, Andrea, tewas dibunuh di dekat rumah mereka di Oldham-on-the-Hudson, Ada tiga tersangka: Rob westerfield, pemuda tampan dari keluarga kaya setempat, yang diam-diam menjalin hubungan dengan Andrea; Paulie Stroebel, teman sekelas yang diam-diam mencintai Andrea; dan Will Nebels, pekerja serabutan yang suka menawarkan jasa kepada para tetangga', 'tb1alt.jpg', 2),
(3, 'Auguste Dupin : Detektif Prancis', 30000, 130, 'tb2.jpg', '  Mungkin banyak yang mengira bahwa Sherlock Holmes adalah pionir tokoh detektif fiksi di dunia literasi. Tapi tahukah bahwasanya jauh sebelum Sherlock Holmes muncul, ada tokoh lain yang lebih dulu memulai dan menyandang predikat gentlemen detective?. Yup, tokoh detektif fiksi pertama di dunia literasi yang mengguncang dunia sastra pada eranya adalah C Auguste Dupin. Tokoh detektif ini merupakan rekaan sang penulis puisi dan cerita misteri beraliran gore, gothic dan macabre sekaligus kritikus sastra terkenal pada eranya, Edgar Allan Poe.', 'tb2alt.jpg', 6),
(4, 'Harry Potter and the Half Blood Prince', 100000, 300, 'tb3.jpg', '    Khawatir dengan pengalaman pertemuannya dengan Voldemort di Kementerian Sihir, Harry Potter merasa enggan untuk kembali ke Hogwarts. Dumbledore mendorongnya untuk kembali, setelah mengajaknya untuk menemui seorang mantan guru Hogwarts, Horace Slughorn. Dengan bantuan Harry, ia berhasil membujuk Slughorn agar mau kembali mengajar di Hogwarts.', 'tb3alt.jpg', 4),
(5, 'The Hobbit : There and Back Again', 100000, 190, 'tb4.jpg', '   Kisah bermula ketika Bilbo baggins yang merupakan seorang hobbit yang ingin hidup nyaman, sejahtera di liang hobbitnya, dan hampir tidak pernah bepergian jauh dari rumahnya di shire. suatu hari Gandalf datang ke rumahnya dan mengajaknya untuk berpetualang, dan Bilbo dengan jelas menolaknya. hingga ketika Gandalf mengundang 13 Kurcaci untuk datang ke rumah Bilbo dan terjadilah sebuah pesta yang tak terduga.', 'tb4alt.jpg', 1),
(6, 'Andrea Hirata : Laskar Pelangi', 40000, 100, 'tb5.jpg', '  Laskar Pelangi Menceritakan tentang kisah masa kecil anak-anak desa dari suatu komunitas melayu yang bisa dikatakan sangat miskin di Belitung. Kisah orang-orang â€˜kecilâ€™ yang berusaha untuk memperbaiki masa depan mereka.', 'tb5alt.jpg', 1),
(7, 'Agatha Christie : The Pale House', 50000, 90, 'tb6.jpg', '  Seorang wanita memanggil pastor di saat sedang sekarat untuk menceritakan rahasia kelam yang harus ia tanggung semasa hidupnya, termasuk memberikan sederet daftar nama pada sang pastor. Sepulang dari tempat wanita itu, Pastor Gorman dibunuh, meski daftar nama tadi selamat dari incaran si pembunuh.', 'tb6alt.jpg', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `kurir`
--
ALTER TABLE `kurir`
  ADD PRIMARY KEY (`id_kurir`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indeks untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indeks untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `kurir`
--
ALTER TABLE `kurir`
  MODIFY `id_kurir` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
