/*
SQLyog Community v13.2.1 (64 bit)
MySQL - 8.0.30 : Database - tiket_kereta
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tiket_kereta` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `tiket_kereta`;

/*Table structure for table `jadwal` */

DROP TABLE IF EXISTS `jadwal`;

CREATE TABLE `jadwal` (
  `id_jadwal` VARCHAR(10) NOT NULL,
  `id_kereta` VARCHAR(10) DEFAULT NULL,
  `stasiun_asal` VARCHAR(10) DEFAULT NULL,
  `stasiun_tujuan` VARCHAR(10) DEFAULT NULL,
  `tanggal_berangkat` DATE DEFAULT NULL,
  `jam_berangkat` TIME DEFAULT NULL,
  `jam_tiba` TIME DEFAULT NULL,
  `harga_tiket` DECIMAL(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_jadwal`),
  KEY `id_kereta` (`id_kereta`),
  KEY `stasiun_asal` (`stasiun_asal`),
  KEY `stasiun_tujuan` (`stasiun_tujuan`),
  CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`id_kereta`) REFERENCES `kereta` (`id_kereta`),
  CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`stasiun_asal`) REFERENCES `stasiun` (`id_stasiun`),
  CONSTRAINT `jadwal_ibfk_3` FOREIGN KEY (`stasiun_tujuan`) REFERENCES `stasiun` (`id_stasiun`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `jadwal` */

INSERT  INTO `jadwal`(`id_jadwal`,`id_kereta`,`stasiun_asal`,`stasiun_tujuan`,`tanggal_berangkat`,`jam_berangkat`,`jam_tiba`,`harga_tiket`) VALUES 
('JDW001','KRT001','STS001','STS003','2025-04-10','08:00:00','15:00:00',350000.00),
('JDW002','KRT002','STS002','STS004','2025-04-11','09:30:00','17:00:00',280000.00),
('JDW003','KRT003','STS003','STS005','2025-04-12','06:45:00','14:00:00',150000.00),
('JDW004','KRT001','STS001','STS005','2025-04-13','10:00:00','18:00:00',360000.00),
('JDW005','KRT002','STS002','STS003','2025-04-14','07:15:00','13:30:00',290000.00);

/*Table structure for table `kereta` */

DROP TABLE IF EXISTS `kereta`;

CREATE TABLE `kereta` (
  `id_kereta` VARCHAR(10) NOT NULL,
  `nama_kereta` VARCHAR(50) DEFAULT NULL,
  `jenis_kereta` ENUM('Eksekutif','Bisnis','Ekonomi') DEFAULT NULL,
  `jumlah_kursi` INT DEFAULT NULL,
  PRIMARY KEY (`id_kereta`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `kereta` */

INSERT  INTO `kereta`(`id_kereta`,`nama_kereta`,`jenis_kereta`,`jumlah_kursi`) VALUES 
('KRT001','Argo Bromo Anggrek','Eksekutif',100),
('KRT002','Tegal Bahari','Bisnis',80),
('KRT003','Serayu','Ekonomi',120);

/*Table structure for table `pembayaran` */

DROP TABLE IF EXISTS `pembayaran`;

CREATE TABLE `pembayaran` (
  `id_pembayaran` VARCHAR(10) NOT NULL,
  `id_tiket` VARCHAR(10) DEFAULT NULL,
  `tanggal_pembayaran` DATE DEFAULT NULL,
  `jumlah_pembayaran` DECIMAL(10,2) DEFAULT NULL,
  `metode_pembayaran` ENUM('Tunai','Transfer','EDC') DEFAULT NULL,
  PRIMARY KEY (`id_pembayaran`),
  KEY `id_tiket` (`id_tiket`),
  CONSTRAINT `pembayaran_ibfk_1` FOREIGN KEY (`id_tiket`) REFERENCES `tiket` (`id_tiket`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pembayaran` */

INSERT  INTO `pembayaran`(`id_pembayaran`,`id_tiket`,`tanggal_pembayaran`,`jumlah_pembayaran`,`metode_pembayaran`) VALUES 
('PYT001','TKT001','2025-04-06',350000.00,'Transfer'),
('PYT002','TKT003','2025-04-08',150000.00,'Tunai'),
('PYT003','TKT005','2025-04-09',360000.00,'EDC'),
('PYT004','TKT006','2025-04-09',290000.00,'Transfer');

/*Table structure for table `penumpang` */

DROP TABLE IF EXISTS `penumpang`;

CREATE TABLE `penumpang` (
  `id_penumpang` VARCHAR(10) NOT NULL,
  `nama_penumpang` VARCHAR(100) DEFAULT NULL,
  `no_identitas` VARCHAR(30) DEFAULT NULL,
  `alamat` TEXT,
  `telepon` VARCHAR(15) DEFAULT NULL,
  PRIMARY KEY (`id_penumpang`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `penumpang` */

INSERT  INTO `penumpang`(`id_penumpang`,`nama_penumpang`,`no_identitas`,`alamat`,`telepon`) VALUES 
('PNP001','Andi Saputra','1234567890123456','Jl. Merdeka No. 1, Jakarta','081234567890'),
('PNP002','Siti Aminah','2345678901234567','Jl. Malioboro No. 10, Yogyakarta','082134567891'),
('PNP003','Budi Hartono','3456789012345678','Jl. Pahlawan No. 5, Semarang','083134567892'),
('PNP004','Rina Widya','4567890123456789','Jl. Diponegoro No. 3, Surabaya','084134567893'),
('PNP005','Dedi Kurniawan','5678901234567890','Jl. Sudirman No. 2, Bandung','085134567894');

/*Table structure for table `stasiun` */

DROP TABLE IF EXISTS `stasiun`;

CREATE TABLE `stasiun` (
  `id_stasiun` VARCHAR(10) NOT NULL,
  `nama_stasiun` VARCHAR(50) DEFAULT NULL,
  `kota` VARCHAR(50) DEFAULT NULL,
  `kode_stasiun` VARCHAR(10) DEFAULT NULL,
  PRIMARY KEY (`id_stasiun`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `stasiun` */

INSERT  INTO `stasiun`(`id_stasiun`,`nama_stasiun`,`kota`,`kode_stasiun`) VALUES 
('STS001','Gambir','Jakarta','GMR'),
('STS002','Pasar Senen','Jakarta','PSE'),
('STS003','Tugu','Yogyakarta','YK'),
('STS004','Tawang','Semarang','SMT'),
('STS005','Gubeng','Surabaya','SGU');

/*Table structure for table `tiket` */

DROP TABLE IF EXISTS `tiket`;

CREATE TABLE `tiket` (
  `id_tiket` VARCHAR(10) NOT NULL,
  `id_penumpang` VARCHAR(10) DEFAULT NULL,
  `id_jadwal` VARCHAR(10) DEFAULT NULL,
  `tanggal_pesan` DATE DEFAULT NULL,
  `nomor_kursi` VARCHAR(10) DEFAULT NULL,
  `status_pembayaran` ENUM('Lunas','Belum Lunas') DEFAULT NULL,
  PRIMARY KEY (`id_tiket`),
  KEY `id_penumpang` (`id_penumpang`),
  KEY `id_jadwal` (`id_jadwal`),
  CONSTRAINT `tiket_ibfk_1` FOREIGN KEY (`id_penumpang`) REFERENCES `penumpang` (`id_penumpang`),
  CONSTRAINT `tiket_ibfk_2` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id_jadwal`)
) ENGINE=INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tiket` */

INSERT  INTO `tiket`(`id_tiket`,`id_penumpang`,`id_jadwal`,`tanggal_pesan`,`nomor_kursi`,`status_pembayaran`) VALUES 
('TKT001','PNP001','JDW001','2025-04-05','A01','Lunas'),
('TKT002','PNP002','JDW002','2025-04-06','B05','Belum Lunas'),
('TKT003','PNP003','JDW003','2025-04-07','C03','Lunas'),
('TKT004','PNP004','JDW004','2025-04-07','D02','Belum Lunas'),
('TKT005','PNP005','JDW004','2025-04-08','A04','Lunas'),
('TKT006','PNP001','JDW005','2025-04-08','B02','Lunas');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;




-- untuk yang nomor 1 => Untuk menampilkan data penumpang beserta data tiket-nya
CREATE VIEW tiket_penumpang AS
SELECT 
    p.id_penumpang, 
    p.nama_penumpang, 
    t.id_tiket, 
    t.tanggal_pesan, 
    t.status_pembayaran
FROM penumpang p
JOIN tiket t ON p.id_penumpang = t.id_penumpang;

SELECT * FROM tiket_penumpang;



-- untuk yang nomor 2 => Untuk menampilkan rincian tiket yang lengkap
CREATE VIEW detail_tiket AS
SELECT 
    t.id_tiket,
    p.nama_penumpang AS nama_pelanggan,
    j.stasiun_asal,
    j.stasiun_tujuan,
    k.nama_kereta,
    j.jam_berangkat,
    j.jam_tiba
FROM tiket t
JOIN penumpang p ON t.id_penumpang = p.id_penumpang
JOIN jadwal j ON t.id_jadwal = j.id_jadwal
JOIN kereta k ON j.id_kereta = k.id_kereta;

SELECT * FROM detail_tiket;




-- untuk yang nomor 3 => Untuk melihat tiket yang hanya berstatus lunas
CREATE VIEW tiket_lunas AS
SELECT 
    t.id_tiket,
    p.nama_penumpang AS nama_pelanggan,
    t.tanggal_pesan,
    t.status_pembayaran AS STATUS
FROM tiket t
JOIN penumpang p ON t.id_penumpang = p.id_penumpang
WHERE t.status_pembayaran = 'Lunas';

SELECT * FROM tiket_lunas;




-- untuk yang nomor 4 => Untuk melihat ada berapa total jumlah tiket yang dipesan dan total pendapatan per kereta
CREATE VIEW view_total_tiket_per_kereta AS
SELECT 
    k.nama_kereta,
    COUNT(t.id_tiket) AS total_tiket,
    SUM(pb.jumlah_pembayaran) AS total_transaksi
FROM tiket t
JOIN pembayaran pb
    ON t.id_tiket = pb.id_tiket
JOIN jadwal j
    ON t.id_jadwal = j.id_jadwal
JOIN kereta k
    ON j.id_kereta = k.id_kereta
GROUP BY k.nama_kereta;


SELECT * FROM view_total_tiket_per_kereta;




-- untuk yang nomor 5 => Untuk Menyajikan rekap harian tiket terjual beserta total pendapatan pada setiap tanggal keberangkatan
CREATE VIEW view_rekap_harian AS
SELECT 
    DATE(j.tanggal_berangkat) AS tanggal_keberangkatan,
    COUNT(t.id_tiket) AS total_tiket,
    SUM(pb.jumlah_pembayaran) AS total_pendapatan
FROM tiket t
JOIN jadwal j ON t.id_jadwal = j.id_jadwal
JOIN pembayaran pb ON t.id_tiket = pb.id_tiket
WHERE t.status_pembayaran = 'Lunas'
GROUP BY DATE(j.tanggal_berangkat);

SELECT * FROM view_rekap_harian;
