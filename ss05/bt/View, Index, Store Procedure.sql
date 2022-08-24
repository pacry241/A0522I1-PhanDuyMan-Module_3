create database demo;
use demo;

drop table if exists products;

create table products(
id int  primary key not null auto_increment,
pCode varchar(45) unique,
pName varchar(50),
pPrice double,
pAmount int ,
pDescription varchar(255),
pStatus bit
);

insert into products(pCode,pName,pPrice,pAmount,pStatus)
values
('a1','Hoang',100,1,1),
('a2','Huy',1200,12,0),
('a3','Duong',4100,11,1),
('a4','Long',1100,1,1),
('a5','Quoc',7100,10,1),
('a6','Linh',17700,100,1),
('a7','Vu',12200,123,0),
('a8','Minh',1300,11,0),
('a9','Hoa',12200,11,1);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
create index name_price on demo.products(pName, pPrice);

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index p_code on products(pCode);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select*From products where pName ='hoang';

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products. --
create view products_view AS
select pCode,pName,pPrice,pStatus
FROM products;

select*from products_view;

-- Tiến hành sửa đổi view -- 
create or replace view products_view AS
select pCode,pName,pPrice,pAmount,pStatus
from products;

explain select*from products_view where pName = 'Hoang';

-- Tiến hành xoá view
drop view products_view;


-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure findAll()
BEGIN
	Select*from products;
END //
delimiter ;

call findAll;

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure addProduct(IN codeP varchar(45), IN NameP varchar(50), IN price double, IN Amount int, IN Status bit)
Begin
	insert into demo.products(pCode,pName,pPrice,pAmount,pStatus)
    value(codeP,NameP,price,Amount,Status);
END//
delimiter ;

call addProduct('c1','Hien',5000,10,1);

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //
create procedure deleteProduct(IN idProduct int)
begin
	delete from products where id = idProduct;
end//
DELIMITER ;

call deleteProduct(1);

-- Tạo store procedure sửa thông tin sản phẩm theo id
DELIMITER //
create procedure editProduct (idProduct int, 
p_Code varchar(45) ,
p_Name varchar(50),
p_Price double,
p_Amount int ,
p_Description varchar(255),
p_Status bit)
begin
	update products set 
    pCode = p_Code,
    pName= p_Name,
    pPrice = p_Price.
    pAmount = p_Amount,
    pDescription = p_Description,
    pStatus = p_Status
    where id = idProduct;
end//
DELIMITER ;

call editProduct(1,'a1','Hoang',100,1,'capnhat',1);