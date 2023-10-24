use DMLModul7

create table FAKULTAS(
   ID_FAKULTAS smallint not null primary key,
   FAKULTAS VARCHAR(45)
)

create table JURUSAN(
   ID_JURUSAN smallint not null primary key,
   JURUSAN VARCHAR(45),
   ID_FAKULTAS smallint references FAKULTAS(ID_FAKULTAS)
)

create table STRATA(
   ID_STRATA smallint not null primary key,
   SINGKAT VARCHAR(10),
   STRATA VARCHAR(45)
)

create table SELEKSI_MASUK(
   ID_SELEKSI_MASUK smallint not null primary key,
   SINGKAT VARCHAR(12),
   SELEKSI_MASUK VARCHAR(60)
)

create table PROGRAM_STUDI(
   ID_PROGRAM_STUDI smallint not null primary key,
   PROGRAM_STUDI VARCHAR(60),
   ID_STRATA smallint references STRATA(ID_STRATA),
   ID_JURUSAN smallint references JURUSAN(ID_JURUSAN)
)

create table MAHASISWA(
   NIM VARCHAR(15) not null primary key,
   NAMA VARCHAR(45),
   ANGKATAN smallint,
   TGL_LAHIR DATE,
   KOTA_LAHIR VARCHAR(60),
   JENIS_KELAMIN CHAR(1),
   ID_SELEKSI_MASUK smallint references SELEKSI_MASUK(ID_SELEKSI_MASUK),
   ID_PROGRAM_STUDI smallint references PROGRAM_STUDI(ID_PROGRAM_STUDI)
)

insert into FAKULTAS(ID_FAKULTAS,FAKULTAS)
VALUES(1,'Ekonomi & Bisnis'),(2,'Ilmu Komputer');
select * from FAKULTAS;

insert into JURUSAN(ID_JURUSAN, ID_FAKULTAS, JURUSAN)
VALUES(21,2,'Informatika'), (22,2,'Sistem Informasi'), (23,2,'Teknik Komputer');
select * from JURUSAN;

insert into STRATA(ID_STRATA, SINGKAT, STRATA)
VALUES(1, 'D1', 'Diploma'), (2, 'S2', 'Sarjana'), (3,'S2','Magister');
select *from STRATA;

insert into PROGRAM_STUDI(ID_PROGRAM_STUDI, ID_STRATA, ID_JURUSAN, PROGRAM_STUDI)
values
(211,2,21,'Teknik Informatika'),
(212,2,21,'Teknik Komputer'),
(219,3,21,'Magister Ilmu Komputer');
select * from PROGRAM_STUDI;

insert into SELEKSI_MASUK(ID_SELEKSI_MASUK, SINGKAT, SELEKSI_MASUK)
VALUES(1,'SNMPTN','SELEKSI NASIONAL MAHASISWA PERGURUAN TINGGI NEGERI'), (2,'SBMPTN','SELEKSI BERSAMA MAHASISWA PERGURUAN TINGGI NEGERI');
select * from SELEKSI_MASUK;

INSERT INTO MAHASISWA(NIM, ID_SELEKSI_MASUK, ID_PROGRAM_STUDI, NAMA, ANGKATAN, TGL_LAHIR, KOTA_LAHIR, JENIS_KELAMIN)
VALUES('155150400', 1, 211, 'JONI', 2015, '1997-01-01', 'Malang', 'W'), ('155150401', 2, 212, 'JONO', 2015, '1997-10-02', 'Situbondo','P');
select * from MAHASISWA;