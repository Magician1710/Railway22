-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các
-- account thuộc phòng ban đó
DROP PROCEDURE IF EXISTS information;
DELIMITER $$
CREATE PROCEDURE information (IN nhap_ten_phong_ban VARCHAR(100) )
BEGIN 
	SELECT		a.account_id,a.email,a.username,a.fullname,a.gender,a.position_id,a.create_date
	FROM		accounts a
	LEFT JOIN	departments d
	ON			a.department_id=d.department_id
	WHERE		a.department_id=nhap_ten_phong_ban;
END$$
DELIMITER ;
-- Question 2: Tạo store để in ra số lượng account trong mỗi group
DROP PROCEDURE IF EXISTS count_acc_of_group;
DELIMITER $$
CREATE PROCEDURE count_acc_of_group()
BEGIN 
	SELECT		group_id,count(account_id) so_account
	FROM		group_accounts
	GROUP BY 	group_id;
END$$
DELIMITER ;

-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo
-- trong tháng hiện tại
DROP PROCEDURE IF EXISTS ques_of_current_month;
DELIMITER $$
CREATE PROCEDURE ques_of_current_month()
BEGIN 
	SELECT		type_id,count(question_id) so_ques_trong_thang
	FROM		questions
    WHERE		month(create_date)=month(now())
	GROUP BY 	type_id;
END$$
DELIMITER ;
-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DROP PROCEDURE IF EXISTS max_ques_of_type;
DELIMITER $$
CREATE PROCEDURE max_ques_of_type()
BEGIN 
	SELECT		type_id AS type_co_nhieu_cau_hoi_nhat
	FROM		questions
	GROUP BY 	type_id
    ORDER BY	count(question_id) DESC
    LIMIT 1
    ;
END$$
DELIMITER ;

-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
DROP PROCEDURE IF EXISTS max_ques_of_type;
DELIMITER $$
CREATE PROCEDURE max_ques_of_type()
BEGIN 
		SELECT 	type_name
        FROM	type_questions
        WHERE	type_id=(SELECT		type_id AS type_co_nhieu_cau_hoi_nhat
						FROM		questions
						GROUP BY 	type_id
						ORDER BY	count(question_id) DESC
						LIMIT 1)
    ;
END$$
DELIMITER ;
-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên
-- chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa
-- chuỗi của người dùng nhập vào







-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và
-- trong store sẽ tự động gán:

-- username sẽ giống email nhưng bỏ phần @..mail đi
-- positionID: sẽ có default là developer
-- departmentID: sẽ được cho vào 1 phòng chờ

-- Sau đó in ra kết quả tạo thành công
-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice
-- để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất
-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử
-- dụng store ở câu 9 để xóa)
-- Sau đó in số lượng record đã remove từ các table liên quan trong khi
-- removing
-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng
-- nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được
-- chuyển về phòng ban default là phòng ban chờ việc
-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm
-- nay

-- 2

-- Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6
-- tháng gần đây nhất
-- (Nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong
-- tháng")