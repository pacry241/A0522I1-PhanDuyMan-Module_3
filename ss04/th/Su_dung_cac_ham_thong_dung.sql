use quanlysinhvien;
select address, count(StudentID) from Student
group by address;

select s.StudentID, s.StudentName, AVG(Mark)
from Student s join Mark m on s.StudentID = m.StudentID
GROUP BY s.StudentId, s.StudentName;
-- Sử dụng having để xét điều kiện điểm trung bình các môn học phải lớn hơn 15
select s.StudentID, s.StudentName, AVG(Mark)
from Student s join Mark m on s.StudentID = m.StudentID
GROUP BY s.StudentId, s.StudentName
HAVING AVG(Mark)>15;

-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
SELECT S.StudentId, S.StudentName, AVG(Mark)
FROM Student S join Mark M on S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId);

