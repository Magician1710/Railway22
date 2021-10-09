INSERT INTO departments(department_name)
VALUES 	("marketing"),
		("sale"),
        ("lol"),
        ("exp"),
        ("lmht"),
        ("ironman"),
        ("blackwidow"),
        ("faker"),
        ("cloud"),
        ("c2");
INSERT INTO positions(position_name)
VALUES  ("Dev"),
		("Test"),
		("Scrum Master"),
        ("PM");
INSERT INTO accounts	(email,						username,		fullname,			gender,	department_id,	position_id,	create_date)
VALUES					("1111111111@gmail.com",	"thanhthu",		"huynh thanh thu",	"", 	"1",			"1",			"2021/10/10"),
						("2222222222@gmail.com",	"magician",		"tran tuan anh"	,	"",	"2",			"3",			"2021/10/09");
        
INSERT INTO `groups`	(group_name,			creator_id,			create_date)
VALUES					("nhom 1",				"1",				"2021/10/11"),
						("nhom 2",				"1",				"2021/10/15");
INSERT INTO    group_accounts	(group_id,		account_id,		join_date)
VALUES							("1",				"1",		"2021/10/11"),
								("2",				"1",		"2021/10/15"),
                                ("1",				"3",		"2021/10/16"),
                                ("1",				"4",		"2021/10/17"),
                                ("1",				"5",		"2021/10/18");
                                
                        

        
        