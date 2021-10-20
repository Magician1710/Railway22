-- Question 1: Viết lệnh để lấy ra danh sách nhân viên và thông tin phòng ban của họ
SELECT 	a.fullname,	d.department_name  
FROM	accounts a
LEFT JOIN	departments d
ON		d.department_id=a.department_id;

-- Question 2: Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT 	* 
FROM 	accounts
WHERE	create_date>"2010/12/20";

-- Question 3: Viết lệnh để lấy ra tất cả các developer
SELECT 	*
FROM	positions p
RIGHT	JOIN	accounts a
ON		p.position_id=a.position_id
WHERE	p.position_id=1;

-- Question 4: Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT 		department_name, count(a.department_id)
FROM 		departments d
RIGHT JOIN	accounts a
ON 			a.department_id=d.department_id
GROUP BY 	a.department_id
HAVING 		count(a.department_id)>=3;

-- Question 5: Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều
-- nhất
SELECT		q.content,count(q.content) demsode
FROM		questions q
RIGHT JOIN	exam_questions e
ON			q.question_id=e.question_id
GROUP BY	q.content
ORDER BY	demsode	DESC
LIMIT		1;

-- Question 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT			q.question_id,q.content,q.category_id, count(q.content) So_cau_hoi_su_dung_cate_nay
FROM			category_questions c
RIGHT	JOIN	questions q
ON				c.category_id= q.category_id
GROUP BY		c.category_id;
	
-- Question 7: Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT q.content,q.question_id,count(e.question_id) so_ques, GROUP_CONCAT(e.exam_id) cac_exam_dc_su_dung
FROM	exam_questions	e
LEFT	JOIN	questions	q
ON		q.question_id=e.question_id
GROUP BY q.question_id;

-- Question 8: Lấy ra Question có nhiều câu trả lời nhất
SELECT 		q.question_id,q.content , count(a.answer_id)
FROM		answers		a
RIGHT JOIN	questions	q	
ON			a.question_id=q.question_id
GROUP BY	a.question_id
ORDER BY	count(a.answer_id)	DESC
LIMIT		1
;

-- Question 9: Thống kê số lượng account trong mỗi group
SELECT	g.group_id,group_name ,count(a.account_id) so_account
FROM	group_accounts	a
RIGHT	JOIN	`groups` g
ON		a.group_id=g.group_id
GROUP BY	g.group_id
ORDER BY	g.group_id
;

-- Question 10: Tìm chức vụ có ít người nhất
SELECT p.position_name, count(a.account_id)	so_nhan_vien_cua_chuc_vu
FROM	accounts a
RIGHT	JOIN	positions p
ON			p.position_id=a.position_id
GROUP BY	a.position_id
ORDER BY	so_nhan_vien_cua_chuc_vu
LIMIT		2

;

-- Question 11: Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT d.department_name, p.position_name, count(p.position_name) 
FROM	((accounts a 
INNER 	JOIN	departments d ON 	d.department_id=a.department_id)
INNER	JOIN	positions	p ON	p.position_id=a.position_id)
GROUP BY	d.department_name, p.position_name
ORDER BY	d.department_id
;


-- Question 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của
-- question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, ...
SELECT *
FROM	questions;

SELECT q.question_id,q.content,category_name,ac.fullname,a.isCorrect,q.create_date
FROM	((((questions q
RIGHT	JOIN	category_questions  c	ON q.category_id=c.category_id)
LEFT 	JOIN	answers a 				ON q.question_id=a.question_id)
RIGHT	JOIN	type_questions t		ON q.type_id=t.type_id)
RIGHT	JOIN	accounts ac				ON q.creator_id=ac.account_id)
;

-- Question 13: Lấy ra số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT	t.type_id,t.type_name,count(q.question_id) so_luong_cau
FROM	type_questions t
LEFT	JOIN	questions q
ON		q.type_id=t.type_id
GROUP BY	t.type_id
;

-- Question 14:Lấy ra group không có account nào
SELECT g.group_id, g.group_name, ga.account_id
FROM	`groups` g
LEFT	JOIN	group_accounts ga
ON	g.group_id=ga.group_id
WHERE	ga.account_id	IS	NULL
;
-- Question 15: Lấy ra group không có account nào
-- Question 16: Lấy ra question không có answer nào
SELECT q.question_id,q.content, a.isCorrect
FROM	questions q
LEFT 	JOIN	answers a 				ON q.question_id=a.question_id
WHERE	a.isCorrect	IS	NULL
;


-- Exercise 2: Union
-- Question 17:
-- a) Lấy các account thuộc nhóm thứ 1
SELECT	*
FROM	accounts a
LEFT	JOIN group_accounts g
ON		a.account_id= g.account_id
WHERE 	g.group_id=1
;


-- b) Lấy các account thuộc nhóm thứ 2
SELECT	*
FROM	accounts a
LEFT	JOIN group_accounts g
ON		a.account_id= g.account_id
WHERE 	g.group_id=2
;
-- c) Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT	*
FROM	accounts a
LEFT	JOIN group_accounts g
ON		a.account_id= g.account_id
WHERE 	g.group_id=2
UNION
SELECT	*
FROM	accounts a
LEFT	JOIN group_accounts g
ON		a.account_id= g.account_id
WHERE 	g.group_id =1;





-- Question 18:
-- a) Lấy các group có lớn hơn 5 thành viên
SELECT	ga.group_id,g.group_name,count(ga.account_id) so_thanh_vien
FROM	`groups` g
RIGHT	JOIN group_accounts ga
ON		ga.group_id= g.group_id
GROUP BY	ga.group_id
HAVING	count(ga.account_id)>5
;
-- b) Lấy các group có nhỏ hơn 7 thành viên
SELECT	ga.group_id,g.group_name, count(ga.account_id) so_thanh_vien
FROM	`groups` g
RIGHT	JOIN group_accounts ga
ON		ga.group_id= g.group_id
GROUP BY	ga.group_id
HAVING	count(ga.account_id)<7;

-- c) Ghép 2 kết quả từ câu a) và câu b)
SELECT	ga.group_id,g.group_name,count(ga.account_id) so_thanh_vien
FROM	`groups` g
RIGHT	JOIN group_accounts ga
ON		ga.group_id= g.group_id
GROUP BY	ga.group_id
HAVING	count(ga.account_id)>5
UNION
SELECT	ga.group_id,g.group_name,count(ga.account_id) so_thanh_vien
FROM	`groups` g
RIGHT	JOIN group_accounts ga
ON		ga.group_id= g.group_id
GROUP BY	ga.group_id
HAVING	count(ga.account_id)<7;