-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale

CREATE VIEW		sale_acc	AS
SELECT			* 
FROM			accounts
WHERE			department_id=2;

SELECT	* FROM sale_acc;
-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE	VIEW	nguoi_tham_gia_nhieu_nhom AS
SELECT			a.account_id, a.email,a.username,a.fullname,a.gender,a.department_id,a.position_id,count(ga.group_id) so_nhom_tham_gia
FROM			group_accounts ga
INNER	JOIN	accounts a
ON				a.account_id=ga.account_id
GROUP BY 		ga.account_id 
ORDER BY		so_nhom_tham_gia DESC
LIMIT			1
;

SELECT			*	FROM nguoi_tham_gia_nhieu_nhom;

-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 30 kí tự
-- được coi là quá dài) và xóa nó đi
CREATE VIEW content_tren_30char AS
SELECT		question_id, content, length(content)
FROM		questions
WHERE		length(content)>30
;

DROP VIEW	content_tren_30char;

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
CREATE	VIEW	cac_phong_ban_nhieu_nhan_vien AS
SELECT		a.department_id, d.department_name, count(a.account_id) so_nhan_vien
FROM		`accounts` a
RIGHT	JOIN	departments d
ON			d.department_id=a.department_id
GROUP BY	department_id
ORDER BY	count(a.account_id)	DESC
LIMIT 		1
;
	
SELECT		*
FROM		cac_phong_ban_nhieu_nhan_vien;

-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo

CREATE	VIEW	gia_toc_ho_nguyen	AS
SELECT			a.fullname, q.content
FROM			accounts a
LEFT	JOIN	questions q
ON				q.creator_id=a.account_id
WHERE	fullname	LIKE	"nguyen%"
;

SELECT * 
FROM	gia_toc_ho_nguyen;




