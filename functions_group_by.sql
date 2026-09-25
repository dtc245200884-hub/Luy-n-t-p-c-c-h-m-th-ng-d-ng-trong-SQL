USE QuanLySinhVien;

-- 1. Hiển thị tất cả thông tin môn học có Credit lớn nhất
SELECT *
FROM Subject
WHERE Credit = (
    SELECT MAX(Credit)
    FROM Subject
);


-- 2. Hiển thị thông tin môn học có điểm thi lớn nhất
SELECT S.*, M.Mark
FROM Subject S
JOIN Mark M ON S.SubId = M.SubId
WHERE M.Mark = (
    SELECT MAX(Mark)
    FROM Mark
);


-- 3. Hiển thị thông tin sinh viên và điểm trung bình,
--    xếp theo điểm giảm dần
SELECT S.StudentId,
       S.StudentName,
       AVG(M.Mark) AS DiemTrungBinh
FROM Student S
JOIN Mark M ON S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
ORDER BY DiemTrungBinh DESC;