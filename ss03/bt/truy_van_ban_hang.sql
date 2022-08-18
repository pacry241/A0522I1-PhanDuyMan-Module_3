use quanlybanhang;

insert into customer
value(1,'Minh Quan',10);
insert into customer
value(2,'Ngoc Oanh',20);
insert into customer
value(3,'Hong Ha',50);

delete from `Order`;

insert INTO `order` (cID, oDate) VALUE(1, '2006-03-21');
insert INTO `order` (cID, oDate) VALUE(2, '2006-03-23');
insert INTO `order` (cID, oDate) VALUE(1, '2006-03-21');

INSERT into product (pName, pPrice) VALUE('may giat', 3);
INSERT into product (pName, pPrice) VALUE('tu lanh', 5);
INSERT into product (pName, pPrice) VALUE('dieu hoa', 7);
INSERT into product (pName, pPrice) VALUE('quat', 1);
INSERT into product (pName, pPrice) VALUE('bep dien', 2);

INSERT INTO OrderDetail (oID, pID, quantity) VALUE(1,1,3);
INSERT INTO OrderDetail (oID, pID, quantity) VALUE(1,3,7);
INSERT INTO OrderDetail (oID, pID, quantity) VALUE(1,4,2);
INSERT INTO OrderDetail (oID, pID, quantity) VALUE(3,1,8);
INSERT INTO OrderDetail (oID, pID, quantity) VALUE(2,5,4);
INSERT INTO OrderDetail (oID, pID, quantity) VALUE(2,3,3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
SELECT * from `order`;
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.cName, p.pName from customer c 
join `order` o on c.cID = o.cID
join OrderDetail od on o.oID = od.oID
join product p on od.pID = p.pID

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT * FROM customer c
LEFT JOIN `order` o on o.cID= c.cID
WHERE o.cID is NULL;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select o.oID as'code', o.oDate as'date', sum(p.pPrice*d.quantity) as'total' from `order` o
inner join OrderDetail d on d.oID = o.oID
inner join product p on p.pID = d.pID
group by o.oID;