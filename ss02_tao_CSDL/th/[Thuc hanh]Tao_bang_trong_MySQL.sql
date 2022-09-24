CREATE DATABASE `quan ly diem thi`;
USE `quan ly diem thi`;

CREATE TABLE HocSinh(
MaHS VARCHAR(20) PRIMARY KEY,
TenHS VARCHAR(50),
NgaySinh DATETIME,
Lop VARCHAR(20),
GT VARCHAR(20));

create table Monhoc(
MaMH varchar(20),
primary key(MaMH),
TenMH varchar(50)
);

create table BangDiem(
MaHS varchar(20),
MaMH varchar(20),
DiemThi int,
NgayKT datetime,
primary key(MaHS,MaMH),
foreign key(MaHS) references HocSinh(MaHS),
foreign key(MaMH) references Monhoc(MaMH)
);

create table GiaoVien(
MaGV varchar(20) primary key,
TenGV varchar(20),
SDT varchar(10)
);

alter table Monhoc add MaGV varchar(20);
alter table Monhoc add constraint FK_MaGV foreign key (MaGV) 
references GiaoVien(MaGV);



