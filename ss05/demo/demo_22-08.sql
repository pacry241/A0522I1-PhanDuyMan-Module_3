-- index
SELECT * FROM a0921i1.sinh_vien;
explain select * from sinh_vien where email = 'khanh@gmail.com';
create index email_index on sinh_vien(email);

explain select * from sinh_vien where 
name = 'Khanh' and email = 'khanh@gmail.com';
create index email_name on sinh_vien(email(50), name(50));
drop index email_index on sinh_vien;
explain select * from sinh_vien where 
name = 'Khanh';
-- view
create view student_view as
select name, class_name from sinh_vien;
select * from student_view;

update student_view
set class_name = 2
where name = 'Nam';

insert into student_view values ('Tuan',2);

-- stored procedure
drop procedure if exists count_sinhvien;
delimiter //
create procedure count_sinhvien(IN name1 varchar(100), OUT count INT)
BEGIN
	Select count(1) into count from sinh_vien where name = name1;
END //
delimiter ;

call count_sinhvien('Khanh', @a);
select @a;

-- function
drop function if exists count_sv_by_name;
delimiter //
create function count_sv_by_name(name1 varchar(100))
returns int
BEGIN
	declare count int default 0;
	Select count(1) into count from sinh_vien where name = name1;
    return count;
END //
delimiter ;
select count_sv_by_name('Khanh') into @c;
select @c;

-- trigger
delimiter //
create trigger before_sinhvien_delete
before delete on sinh_vien
for each row
Begin
	IF OLD.name = 'Khanh' then 
		SIGNAL sqlstate '45001' set message_text = 'Khong the xoa thang ten Khanh';
    END IF;
End //
delimiter ;

select * from sinh_vien;
delete from sinh_vien where name = 'Khanh';