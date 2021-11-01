--  1. Tạo table với các ràng buộc và kiểu dữ liệu
-- Thêm ít nhất 3 bản ghi vào table
CREATE DATABASE IF NOT EXISTS thuc_tap;
USE	thuc_tap;
DROP	TABLE IF EXISTS
		giang_vien,
        sinh_vien,
        de_tai,
        huong_dan;
        
CREATE TABLE giang_vien (
	ma_gv  			TINYINT  UNSIGNED AUTO_INCREMENT,
	ho_ten_gv	  	VARCHAR(100),
    luong			INT NOT NULL,
    PRIMARY KEY 	(ma_gv)
);
CREATE TABLE sinh_vien (
	ma_sv		  	TINYINT  UNSIGNED AUTO_INCREMENT,
	ho_ten_sv	  	VARCHAR(100),
    nam_sinh		DATE	NOT	NULL,
    que_quan		VARCHAR(100) NOT NULL,
    PRIMARY KEY 	(ma_sv)
);

CREATE TABLE de_tai (
	ma_dt		  	TINYINT  UNSIGNED AUTO_INCREMENT,
	ten_dt		  	VARCHAR(100),
    kinh_phi		INT	NOT	NULL,
    noi_thuc_tap	VARCHAR(100) NOT NULL,
    PRIMARY KEY 	(ma_dt)
);

CREATE TABLE huong_dan (
	id			TINYINT  UNSIGNED AUTO_INCREMENT,
	ma_sv	  	TINYINT	UNSIGNED,
    ma_dt		TINYINT	UNSIGNED,
    ma_gv		TINYINT	UNSIGNED,
    ket_qua		VARCHAR(100),
    PRIMARY KEY 	(id),
    FOREIGN KEY		(ma_sv)	REFERENCES	sinh_vien(ma_sv),
    FOREIGN KEY		(ma_dt)	REFERENCES	de_tai(ma_dt),
    FOREIGN KEY		(ma_gv)	REFERENCES	giang_vien(ma_gv)
);


INSERT INTO 	giang_vien 		(ho_ten_gv, 					luong)
VALUES 							(	"tran thi thuy",			"15000000"),
								(	"vuong van viet",			"16000000"),
                                (	"dao thanh tu",				"17000000");

INSERT INTO 	sinh_vien 	(ho_ten_sv, 						nam_sinh, 					que_quan)
VALUES 							("tran tuan anh",				"1995/10/17",				"trieu son,iwate"	),
								("huynh thanh thu",				"1989/1/1",					"ben tre, kanagawa"	),
                                ("nguyen duy luc",				"1996/10/11",				"viet nam, viet nam"	);
                             
INSERT INTO 	de_tai		 	(ten_dt, 						kinh_phi, 					noi_thuc_tap)
VALUES 							("my sql",						"5000000",					"tokyo"	),
								("cong nghe sinh hoc",						"7000000",					"kanagawa"	),
                                ("python",						"11000000",					"viet nam"	);
                                
INSERT INTO 	huong_dan		(ma_sv, 						ma_dt, 						ma_gv,				ket_qua)
VALUES 							("1",							NULL,						"2"				,NULL),
								("2",							"2",						"1"				,"da dat yeu cau"),
                                ("3",							"1",						"3"				,"chua dat yeu cau");    
                                
-- 1. Viết lệnh để
-- a) Lấy tất cả các sinh viên chưa có đề tài hướng dẫn
SELECT	s.ma_sv, s.ho_ten_sv, h.ma_dt
FROM	sinh_vien s
RIGHT	JOIN	huong_dan h
ON		s.ma_sv=h.ma_sv
WHERE	ma_dt IS NULL;
-- b) Lấy ra số sinh viên làm đề tài ‘CONG NGHE SINH HOC’
SELECT	d.ma_dt, d.ten_dt, count(ma_sv) so_sv_lam_de_tai
FROM	huong_dan h
RIGHT	JOIN	de_tai d
ON	d.ma_dt= h.ma_dt
WHERE h.ma_dt=2
GROUP BY h.ma_dt;

-- 3.Tạo view có tên là "SinhVienInfo" lấy các thông tin về học sinh bao gồm:
-- mã số, họ tên và tên đề tài
-- (Nếu sinh viên chưa có đề tài thì column tên đề tài sẽ in ra "Chưa có")

DROP	VIEW	IF	EXISTS	sinh_vien_info;
CREATE	VIEW	sinh_vien_info AS
	SELECT	s.ma_sv,	s.ho_ten_sv,	d.ten_dt
    FROM	((huong_dan h
    RIGHT	JOIN	sinh_vien s ON s.ma_sv= h.ma_sv)
    LEFT	JOIN	de_tai	d ON	d.ma_dt=h.ma_dt);

-- 4.Tạo trigger cho table SinhVien khi insert sinh viên có năm sinh <= 1900
-- thì hiện ra thông báo "năm sinh phải > 1900"
DROP TRIGGER IF EXISTS loi_nam_sinh;
DELIMITER $$

CREATE TRIGGER loi_nam_sinh
BEFORE	INSERT	ON	sinh_vien
FOR EACH ROW
	BEGIN 
		DECLARE	nhap_nam_sinh DATE;
        SELECT	nam_sinh	INTO	nhap_nam_sinh
        FROM	sinh_vien;
        
        IF NEW.year(nam_sinh)<1900 THEN
        SIGNAL	SQLSTATE	'99999'
        SET		MESSAGE_TEXT	=	'năm sinh phai > 1900';
        END IF;
	END $$
    
DELIMITER ;

-- 5. Hãy cấu hình table sao cho khi xóa 1 sinh viên nào đó thì sẽ tất cả thông
-- tin trong table HuongDan liên quan tới sinh viên đó sẽ bị xóa đi

DROP PROCEDURE IF EXISTS xoa_thong_tin_sinh_vien;

DELIMITER $$ 
CREATE PROCEDURE xoa_thong_tin_sinh_vien (IN ma_sinh_vien	TINYINT  UNSIGNED)
			BEGIN
				SELECT	ma_sv INTO	ma_sinh_vien
                FROM	sinh_vien;
                DELETE
                FROM	huong_dan
                WHERE	ma_sv=ma_sinh_vien;
                DELETE
                FROM	sinh_vien
                WHERE	ma_sv=ma_sinh_vien;
			END$$
DELIMITER ;



                               