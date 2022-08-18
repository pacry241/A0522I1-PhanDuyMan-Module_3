use quanlysinhvien;

select*from student where  StudentName like"h%";

select*from `class` where month(StartDate)=12;

select*from `Subject` where credit between 3 and 5;

select*from `Student`;
update Student set classID = 2 where StudentName = 'hung';

select s.StudentName, su.SubName, m.mark from student s
join mark m on s.StudentID = m.StudentID
join subject su on m.SubID = su.SubID
order by m.mark desc, s.StudentName;