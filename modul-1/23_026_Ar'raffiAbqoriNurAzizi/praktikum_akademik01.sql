/*
SQLyog Community v13.2.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - db_akademik_tugasno1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_akademik_tugasno1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `db_akademik_tugasno1`;

/*Table structure for table `dosen` */

DROP TABLE IF EXISTS `dosen`;

CREATE TABLE `dosen` (
  `nip` varchar(20) NOT NULL,
  `nama_dosen` varchar(100) NOT NULL,
  PRIMARY KEY (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `dosen` */

insert  into `dosen`(`nip`,`nama_dosen`) values 
('1975090920','Dr. Budi Dwi Satoto, S.T., M.Kom'),
('1977092120','Dr. Yeni Kustiyahningsih, S.Kom., M.Kom'),
('1978050420','Firmansyah Adiputra, S.T., M.Cs.'),
('1978080420','Wahyudi Agustiono, S.Kom., M.Sc., Ph.D'),
('1979060520','Eza Rahmanita, S.T., M.T.'),
('1980032120','Mohammad Syarief, S.T., M.Cs.'),
('1983060820','Rosida Vivin Nahari, S.Kom., M.T'),
('1983082820','Sri Herawati, S.Kom., M.Kom'),
('1987052020','Doni Abdul Fatah, S.Kom., M.Kom'),
('1987112720','Novi Prastiti, S.Kom, M.Kom');

/*Table structure for table `krs` */

DROP TABLE IF EXISTS `krs`;

CREATE TABLE `krs` (
  `id_KRS` int(11) NOT NULL AUTO_INCREMENT,
  `id_matakuliah` varchar(10) DEFAULT NULL,
  `nip` varchar(20) DEFAULT NULL,
  `nim` varchar(15) DEFAULT NULL,
  `kode_kelas` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_KRS`),
  KEY `nim` (`nim`),
  KEY `id_matakuliah` (`id_matakuliah`),
  KEY `nip` (`nip`),
  CONSTRAINT `krs_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`),
  CONSTRAINT `krs_ibfk_2` FOREIGN KEY (`id_matakuliah`) REFERENCES `matakuliah` (`id_matakuliah`),
  CONSTRAINT `krs_ibfk_3` FOREIGN KEY (`nip`) REFERENCES `dosen` (`nip`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `krs` */

insert  into `krs`(`id_KRS`,`id_matakuliah`,`nip`,`nim`,`kode_kelas`) values 
(1,'INF101','1975090920','230441100156','KLS101'),
(2,'INF102','1980032120','230441100071','KLS102'),
(3,'INF103','1979060520','230441100166','KLS103'),
(4,'INF104','1987052020','230441100181','KLS104'),
(5,'INF105','1978080420','230441100022','KLS105');

/*Table structure for table `mahasiswa` */

DROP TABLE IF EXISTS `mahasiswa`;

CREATE TABLE `mahasiswa` (
  `nim` varchar(15) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `kode_prodi` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`nim`),
  KEY `kode_prodi` (`kode_prodi`),
  CONSTRAINT `mahasiswa_ibfk_1` FOREIGN KEY (`kode_prodi`) REFERENCES `prodi` (`kode_prodi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `mahasiswa` */

insert  into `mahasiswa`(`nim`,`nama`,`kode_prodi`) values 
('230441100022','Lanny Aprilia','SI'),
('230441100071','ANANDA EKAWATI','SI'),
('230441100091','Diah Ayu Nurmala','SI'),
('230441100111','Shelly Nimal Aulina Shinta','SI'),
('230441100120','Alvyan Maulana Karnawan Putra','SI'),
('230441100147','Moh Muchlis','SI'),
('230441100156','AGATHA YASMIN RAHMAN','SI'),
('230441100166','Shahaf Lanjaya Putra Mujiono','SI'),
('230441100181','Melati Ulfa Wijaya','SI'),
('230441100184','Wira Selfina Laydi','SI');

/*Table structure for table `matakuliah` */

DROP TABLE IF EXISTS `matakuliah`;

CREATE TABLE `matakuliah` (
  `id_matakuliah` varchar(10) NOT NULL,
  `nama_matakuliah` varchar(100) NOT NULL,
  `sks` int(11) NOT NULL,
  `semester` int(11) NOT NULL,
  PRIMARY KEY (`id_matakuliah`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `matakuliah` */

insert  into `matakuliah`(`id_matakuliah`,`nama_matakuliah`,`sks`,`semester`) values 
('INF101','Data Mining',3,4),
('INF102','Sistem Manajemen Basis Data',4,4),
('INF103','Perencanaan Sumber Daya Perusahaan',3,4),
('INF104','E-Business Dan E-Commerce',3,3),
('INF105','Implementasi Dan Pengujian Perangkat Lunak',3,4),
('INF106','Perencanaan Sumber Daya Perusahaan',3,4),
('INF107','Sistem Pendukung Keputusan',3,4),
('INF108','Pemrograman Berbasis Objek',3,3),
('INF109','Manajemen Proyek IT',3,4),
('INF110','Financial Technology',3,4);

/*Table structure for table `prodi` */

DROP TABLE IF EXISTS `prodi`;

CREATE TABLE `prodi` (
  `kode_prodi` varchar(10) NOT NULL,
  `nama_prodi` varchar(100) NOT NULL,
  PRIMARY KEY (`kode_prodi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `prodi` */

insert  into `prodi`(`kode_prodi`,`nama_prodi`) values 
('SI','Sistem Informasi'),
('TI','Teknik Informatika');

/*Table structure for table `transkrip` */

DROP TABLE IF EXISTS `transkrip`;

CREATE TABLE `transkrip` (
  `id_transkrip` int(11) NOT NULL AUTO_INCREMENT,
  `nim` varchar(15) DEFAULT NULL,
  `id_matakuliah` varchar(10) DEFAULT NULL,
  `nilai` char(2) DEFAULT NULL,
  `semester` int(11) DEFAULT NULL,
  `tahun_akademik` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`id_transkrip`),
  KEY `nim` (`nim`),
  KEY `id_matakuliah` (`id_matakuliah`),
  CONSTRAINT `transkrip_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `mahasiswa` (`nim`),
  CONSTRAINT `transkrip_ibfk_2` FOREIGN KEY (`id_matakuliah`) REFERENCES `matakuliah` (`id_matakuliah`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `transkrip` */

insert  into `transkrip`(`id_transkrip`,`nim`,`id_matakuliah`,`nilai`,`semester`,`tahun_akademik`) values 
(1,'230441100156','INF101','A',3,'2023/2024'),
(2,'230441100166','INF102','A-',4,'2023/2024'),
(3,'230441100071','INF102','B+',3,'2023/2024'),
(4,'230441100181','INF103','B',2,'2023/2024'),
(5,'230441100156','INF101','A',3,'2023/2024'),
(6,'230441100166','INF102','A-',4,'2023/2024'),
(7,'230441100071','INF102','B+',3,'2023/2024'),
(8,'230441100181','INF103','B',2,'2023/2024'),
(9,'230441100022','INF105','A',3,'2023/2024'),
(10,'230441100166','INF103','A-',4,'2023/2024');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
