use quanlysinhvien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select SubId , SubName, Status, max(credit) from `subject`

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select s.SubName, s.Credit, s.Status, max(m.Mark) as `diem` from `subject`s
join Mark m on s.SubID = m.SubId
group by s.SubName
having max(m.Mark) >=(select max(Mark) from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select s.StudentName, s.address, s.Phone, avg(m.mark) as`DiemTB` from Student s 
join Mark m on s.StudentID = m.StudentID
group by s.StudentID
ORDER BY avg(mark) DESC;
