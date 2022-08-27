use casestudy;
-- Câu 2

SELECT 
    *
FROM
    nhan_vien
WHERE
    (ho_ten LIKE 'H%' OR ho_ten LIKE 'T%'
        OR ho_ten LIKE 'K%')
        AND CHAR_LENGTH(ho_ten) <= 15;

-- Câu 3
SELECT 
    *
FROM
    khach_hang
WHERE
    (YEAR(NOW()) - YEAR(ngay_sinh) BETWEEN 18 AND 50)
        AND (dia_chi LIKE '%Đà Nẵng%'
        OR dia_chi LIKE '%Quảng Trị%');

-- Câu 4
SELECT 
    kh.ma_khach_hang,
    kh.ho_ten AS 'Họ Tên',
    COUNT(hd.ma_khach_hang) AS 'Số lần đặt phòng'
FROM
    khach_hang kh
        JOIN
    loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
        JOIN
    hop_dong hd ON hd.ma_khach_hang = kh.ma_khach_hang
WHERE
    ten_loai_khach = 'Diamond'
GROUP BY kh.ma_khach_hang
ORDER BY COUNT(kh.ma_khach_hang);

-- Câu 5

select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, ifnull(sum(dvdk.gia * hdct.so_luong),0)+dv.chi_phi_thue  tong_tien
from khach_hang kh
left join loai_khach lk on kh.ma_loai_khach=lk.ma_loai_khach
left join hop_dong hd on hd.ma_khach_hang=kh.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu=hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong=hd.ma_hop_dong
left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem=hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong
order by hd.ma_hop_dong asc , tong_tien desc ;

-- Câu 6
select dv.ma_dich_vu, dv.ten_dich_vu,dv.dien_tich,dv.chi_phi_thue,ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where dv.ma_dich_vu not in (select dv.ma_dich_vu from dich_vu join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu where hd.ngay_lam_hop_dong BETWEEN '2021-01-01'
            and '2021-03-31') ;
            
-- Câu 7
select dv.ma_dich_vu, dv.ten_dich_vu,dv.dien_tich,dv.so_nguoi_toi_da,dv.chi_phi_thue,ldv.ten_loai_dich_vu
from dich_vu dv
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where (year(hd.ngay_lam_hop_dong)=2020) and 
NOT EXISTS (SELECT*FROM hop_dong WHERE dv.ma_dich_vu = ma_dich_vu and year(ngay_lam_hop_dong) = 2021 );

-- Câu 8
-- Cách 1
select distinct (ho_ten) from khach_hang;
-- Cách 2
select ho_ten from khach_hang group by ho_ten;
-- Cách 3
select ho_ten from khach_hang union select ho_ten from khach_hang;

-- Câu 9
select month(hd.ngay_lam_hop_dong) as thang, count(kh.ma_khach_hang) as so_lan_dat
from khach_hang kh
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
where year(hd.ngay_lam_hop_dong)='2021'
group by  thang
order by  thang;

-- Câu 10
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, sum(hd.tien_dat_coc), ifnull(sum(hdct.so_luong),0) so_luong
from hop_dong hd
left join  hop_dong_chi_tiet hdct on hd.ma_hop_dong= hdct.ma_hop_dong
group by hd.ma_hop_dong;

-- Câu 11:	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có 
-- ten_loai_khach là “Diamond” và 
-- có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, dvdk.gia
from dich_vu_di_kem dvdk
left join hop_dong_chi_tiet using(ma_dich_vu_di_kem)
left join hop_dong using(ma_hop_dong)
left join khach_hang kh using(ma_khach_hang)
left join loai_khach lk using(ma_loai_khach)
where lk.ten_loai_khach = 'Diamond' and (kh.dia_chi like '%Vinh%' or kh.dia_chi like '%Quảng Ngãi%');

-- Câu 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), 
-- so_dien_thoai (khách hàng), ten_dich_vu, 
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select hd.ma_hop_dong,nv.ho_ten as khach_hang ,kh.ho_ten as nhan_vien ,kh.so_dien_thoai as sdt_khach_hang, dv.ten_dich_vu,
sum(hd.tien_dat_coc) tien_coc, sum(hdct.so_luong) as so_luong
from dich_vu dv
left join hop_dong hd using(ma_dich_vu)
left join khach_hang kh using(ma_khach_hang)
left join nhan_vien nv using(ma_nhan_vien)
left join hop_dong_chi_tiet hdct using(ma_hop_dong)
left join dich_vu_di_kem dvdk using(ma_dich_vu_di_kem)
where (month(hd.ngay_lam_hop_dong) between 10 and 12) and (hd.ngay_lam_hop_dong not between'2021-01-01' and '2021-06-30')
group by hd.ma_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, dv.ten_dich_vu;

-- Câu 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
--  (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) as so_luong
from dich_vu_di_kem dvdk
left join hop_dong_chi_tiet hdct using(ma_dich_vu_di_kem)
left join hop_dong using(ma_hop_dong)
group by dvdk.ten_dich_vu_di_kem
having so_luong >=all(
select sum(so_luong)
from hop_dong_chi_tiet
group by so_luong
);

-- Câu 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, 
-- so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

select ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, count(ma_dich_vu_di_kem) as so_lan_dung
from dich_vu_di_kem
left join hop_dong_chi_tiet using(ma_dich_vu_di_kem)
left join hop_dong using (ma_hop_dong)
left join dich_vu using(ma_dich_vu)
left join loai_dich_vu using(ma_loai_dich_vu)
group by ten_dich_vu_di_kem
having so_lan_dung =1
order by ma_hop_dong ;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien,
--  ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
--  mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select nv.ma_nhan_vien,nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi, count(hd.ma_nhan_vien) tong_so_hop_dong
from hop_dong hd
left join nhan_vien nv using(ma_nhan_vien)
left join trinh_do td using(ma_trinh_do)
left join bo_phan bp using(ma_bo_phan)
where year(hd.ngay_lam_hop_dong) between 2020 and 2021
group by hd.ma_nhan_vien
having count(hd.ma_nhan_vien) <=3
order by hd.ma_nhan_vien;

-- Câu 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
delete from nhan_vien nv
where 
NOT EXISTS (
        select
            *
        from
            hop_dong
        WHERE
            ma_nhan_vien = nv.ma_nhan_vien
            and YEAR(ngay_lam_hop_dong) BETWEEN 2019
            and 2021
    );
-- 17.	Cập nhật thông tin những khách hàng có 
-- ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng
--  với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
update khach_hang 
set ma_loai_khach = 1
where
 ma_khach_hang in (
select t.ma_khach_hang
 from (
select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, ifnull(sum(dvdk.gia * hdct.so_luong),0)+tmp.gia_dv  tong_tien
from khach_hang kh
left JOIN loai_khach lk USING (ma_loai_khach)
left join hop_dong hd USING (ma_khach_hang)
left join dich_vu dv USING (ma_dich_vu)
left JOIN hop_dong_chi_tiet hdct USING (ma_hop_dong)
left join dich_vu_di_kem dvdk USING (ma_dich_vu_di_kem)
left join (
SELECT
            kh1.ma_khach_hang as ma_khach_hang,
            sum(dv.chi_phi_thue) as gia_dv
        from
            khach_hang kh1
            join hop_dong hd USING (ma_khach_hang)
            join dich_vu dv USING (ma_dich_vu)
        GROUP by
            kh1.ma_khach_hang
    ) tmp USING (ma_khach_hang)
    where ten_loai_khach = 'Platinium' and year(hd.ngay_lam_hop_dong)=2021
	GROUP by
	kh.ma_khach_hang
	HAVING
	tong_tien > 1000000
) as t
);

-- Câu 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

delete from khach_hang kh
where kh.ma_khach_hang in (
select ma_khach_hang from hop_dong hd
where year(hd.ngay_lam_hop_dong)<2021);

-- Câu 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
update dich_vu_di_kem
set gia = gia*2
where ma_dich_vu_di_kem in (select ma_dich_vu_di_kem from (select dvdk.ma_dich_vu_di_kem
from hop_dong_chi_tiet hdct 
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
where year(hd.ngay_lam_hop_dong) = 2020
group by dvdk.ma_dich_vu_di_kem
having sum(hdct.so_luong)>10) as tab);


-- Câu 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
--  thông tin hiển thị bao gồm 
--  id (ma_nhan_vien, ma_khach_hang), 
--  ho_ten, email, so_dien_thoai, 
--  ngay_sinh, dia_chi.
select ma_nhan_vien, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi from nhan_vien
union all
select ma_khach_hang, ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi from khach_hang
;

-- Câu 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên
--  có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
create view v_nhan_vien as 
select ma_nhan_vien, ho_ten, dia_chi, so_dien_thoai
from nhan_vien
JOIN hop_dong USING(ma_nhan_vien)
WHERE dia_chi like '%Đà Nẵng%' and year(ngay_lam_hop_dong) = 2021;

-- Câu 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
update v_nhan_vien set dia_chi = 'Liên Chiểu';

-- Câu 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
DELIMITER //
CREATE PROCEDURE sp_xoa_khach_hang(p_ma_khach_hang int)
BEGIN
delete from khach_hang WHERE ma_khach_hang = p_ma_khach_hang;
END //
 DELIMITER ;

-- Câu 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong 
-- với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, 
-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.

