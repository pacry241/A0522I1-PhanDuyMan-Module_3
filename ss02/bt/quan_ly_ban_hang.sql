create database QuanLyBanHang;
use QuanLyBanHang;
-- drop table `Order`;
-- drop table Customer;
-- drop table product;
-- drop table OrderDetail;
create table Customer(
cID int primary key not null auto_increment,
cName varchar(50),
cAge int not null );

create table `Order`(
oID int primary key not null auto_increment ,
cID int ,
oDate datetime ,
oTotalPrice double,
foreign key (cID)references Customer(cID));

create table product(
pId int primary key not null auto_increment,
pName varchar(50),
pPrice double);

create table OrderDetail(
oID int not null ,
pID int  not null,
quantity smallint,
primary key(oID,pID),
foreign key(oID) references `Order`(oID),
foreign key(pID) references product(pID)
); 