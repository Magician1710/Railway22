		-- Question 1: Thêm ít nhất 10 record vào mỗi table

		-- Question 2: lấy ra tất cả các phòng ban
SELECT * 	
FROM departments;

		-- Question 3: lấy ra id của phòng ban "Sale"
SELECT	department_id
FROM	departments	
WHERE	department_name="Sale";
      
		-- Question 4: lấy ra thông tin account có full name dài nhất
SELECT	*,length(fullname)
FROM	accounts
WHERE	(length(fullname))=(SELECT MAX(length(fullname)) FROM accounts)
;
        
		-- Question 5: Lấy ra thông tin account có full name dài nhất và thuộc phòng ban có id
		-- = 3

-- SELECT		*, length(fullname) do_dai_ten
-- FROM		accounts
-- GROUP BY	department_id
-- HAVING	department_id=3 AND	
-- HAVING		(length(fullname))=(SELECT MAX(length(fullname)) FROM accounts)


        
		-- Question 6: Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT 	group_name
FROM	`groups`
WHERE	create_date<"2019/12/20";

		-- Question 7: Lấy ra ID của question có >= 4 câu trả lời
SELECT 	question_id
FROM	answers
GROUP BY question_id
HAVING count(question_id)>=4;       
       
		-- Question 8: Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày
		-- 20/12/2019
SELECT	exam_id
FROM	exams
WHERE	duration>=60
	AND	createdate< "2019/12/20";
        
        
        
		-- Question 9: Lấy ra 5 group được tạo gần đây nhất
SELECT		*
FROM		`groups`
ORDER BY	create_date DESC
LIMIT		5;


		-- Question 10: Đếm số nhân viên thuộc department có id = 2
SELECT	count(account_id) so_nhan_vien_cua_phong_ban_2
FROM	accounts
WHERE	department_id=1;
 
		-- Question 11: Lấy ra nhân viên có tên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o"
SELECT	fullname
FROM	`accounts`
WHERE	fullname	LIKE	"D%o" ;
      
		-- Question 12: Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE    
FROM	exams 
WHERE	createdate<"2019-12-20";
 
		-- Question 13: Xóa tất cả các question có nội dung bắt đầu bằng từ "câu hỏi"
DELETE    
FROM	questions 
WHERE	content LIKE	"N'Câu hỏi%";

		-- Question 14: Update thông tin của account có id = 5 thành tên "Nguyễn Bá Lộc" và
		-- email thành loc.nguyenba@vti.com.vn
        
UPDATE	accounts
SET		fullname="N'Nguyễn Bá Lộc",
		email="loc.nguyenba@vti.com.vn"
WHERE	account_id=5;
      
 
		-- Question 15: update account có id = 5 sẽ thuộc group có id = 4
 UPDATE	group_accounts
SET		group_id=4
WHERE	account_id=5;
             
        
        
        