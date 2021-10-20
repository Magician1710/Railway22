-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale

CREATE VIEW		sale_acc	AS
SELECT			* 
FROM			accounts
WHERE			department_id=2;

SELECT	* FROM sale_acc;
-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE	VIEW	acc_tham_gia_nhieu_nhom AS
SELECT			a.account_id, a.fullname
FROM			


-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ
-- được coi là quá dài) và xóa nó đi
-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
