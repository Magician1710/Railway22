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
						("2222222222@gmail.com",	"magician",		"tran tuan anh"	,	"",		"2",			"3",			"2021/10/09"),
                        ("3333333333@gmail.com",	"iamfaker",		"choisanghook",		"",		"10",			"4",			"2021/10/12"),
                        ("4444444444@gmail.com",	"longdragon",	"long chun",		"",		"7",			"1",			"2021/10/12"),
                        ("5555555555@gmail.com",	"parkboyoung",	"choisanghook",		"",		"9",			"4",			"2021/10/12"),
                        ("6666666666@gmail.com",	"parkminyoung",	"young1",			"",		"6",			"2",			"2021/10/12"),
                        ("7777777777@gmail.com",	"huynhnhathoa",	"hoachibi",			"",		"1",			"1",			"2021/10/12"),
                        ("8888888888@gmail.com",	"lisa",			"blackpink1",		"",		"3",			"4",			"2021/10/12"),
                        ("99999999999@gmail.com",	"jenny",		"blackpink2",		"",		"3",			"2",			"2021/10/12"),
                        ("010101010101@gmail.com",	"rose",			"blackpink3",		"",		"1",			"1",			"2021/10/12");
                        
                        
        
INSERT INTO `groups`	(group_name,			creator_id,			create_date)
VALUES					("nhom 1",				"1",				"2021/10/11"),
						("nhom 2",				"2",				"2021/10/12"),
                        ("nhom 3",				"5",				"2021/10/14"),
                        ("nhom 4",				"3",				"2021/10/15"),
                        ("nhom 5",				"4",				"2021/10/14"),
                        ("nhom 6",				"2",				"2021/10/12"),
                        ("nhom 7",				"6",				"2021/10/11"),
                        ("nhom 8",				"7",				"2021/10/17"),
                        ("nhom 9",				"8",				"2021/10/18"),
						("nhom 10",				"9",				"2021/10/20");
INSERT INTO    group_accounts	(group_id,		account_id,		join_date)
VALUES							("1",				"1",		"2021/10/11"),
								("1",				"2",		"2021/10/15"),
                                ("2",				"2",		"2021/10/16"),
                                ("3",				"5",		"2021/10/17"),
                                ("4",				"5",		"2021/10/18"),
								("4",				"1",		"2021/10/18"),
								("7",				"7",		"2021/10/18"),
								("9",				"8",		"2021/10/18"),
								("9",				"4",		"2021/10/18"),  
								("10",				"1",		"2021/10/18");
                                
INSERT INTO		type_questions		(type_name)    
VALUES								("essay"),
									("essay"),
                                    ("essay"),
                                    ("essay"),
                                    ("multiple_choice"),
                                    ("multiple_choice"),
                                    ("multiple_choice"),
                                    ("essay"),
                                    ("essay"),
                                    ("multiple_choice"),
                                    ("essay");
INSERT	INTO	category_questions	(category_name)
VALUES								("dolores"),
                                    ("nihil"),
                                    ("enim"),
                                    ("rem"),
                                    ("dolores"),
                                    ("aspernatur"),
                                    ("temporibus"),
                                    ("et"),
                                    ("corporis"),
                                    ("cumque"),
                                    ("laudantium");
INSERT INTO	     questions          (content,	category_id,	type_id,	creator_id,	create_date)               
VALUES                              ("lst",			"1",			"2",			"1",			"2021/10/1"),													   
                                    ("lck",			"2",			"4",			"7",			"2021/10/2"),	
                                    ("vcs",			"3",			"1",			"8",			"2021/10/3"),	
									("lpl",			"4",			"5",			"3",			"2021/10/4"),	
									("wildcard",	"5",			"6",			"2",			"2021/10/5"),	
									("eu",			"6",			"7",			"6",			"2021/10/6"),	
									("tl",			"7",			"8",			"4",			"2021/10/7"),	
									("lec",			"8",			"10",			"5",			"2021/10/8"),	
									("ljl",			"9",			"9",			"10",			"2021/10/9"),	
                                    ("lms",			"10",			"3",			"9",			"2021/10/11");
                                    

INSERT INTO answers	(  content		, question_id	, iscorrect	)
VALUES 				('answer  01'	,   1			,	0		),
					('answer 02'	,   1			,	1		),
                    ('answer 03'	,   1			,	0		),
                    ('answer 04'	,   1			,	1		),
                    ('answer 05'	,   2			,	1		),
                    ('answer 06'	,   3			,	1		),
                    ('answer 07'	,   4			,	0		),
                    ('answer 08'	,   8			,	0		),
                    ('answer 09'	,   9			,	1		);
                   
                    
INSERT INTO exams	(`code`			, title					, category_id	, duration	, creator_id		, create_date )
VALUES 				('001'		, 'kill 5 dragon'			,	1			,	60		,   '5'			,'2019-04-05'),
					('002'		, 'kill 3  baron'			,	7			,	60		,   '2'			,'2019-04-05'),
                    ('003'		, 'assit 15'				,	6			,	120		,   '2'			,'2019-04-07'),
                    ('004'		, 'desstroy 15 tower'		,	6			,	60		,   '3'			,'2020-04-08'),
                    ('005'		, 'win with 20 kill'		,	5			,	120		,   '4'			,'2020-04-10'),
                    ('006'		, 'kill enemy with 15 heath',	3			,	60		,   '6'			,'2020-04-05'),
                    ('007'		, 'colect 15 red buff'		,	2			,	60		,   '7'			,'2020-04-05'),
                    ('008'		, 'corret 15 blue buff'		,	8			,	60		,   '8'			,'2020-04-07'),
                    ('009'		, 'colect 15 pentakill'		,	4			,	90		,   '4'			,'2020-04-07'),
                    ('010'		, 'support with janna'		,	7			,	90		,   '8'			,'2020-04-08');

INSERT	INTO exam_questions		(exam_id	,question_id)
VALUES							("1",		"3"),
								("5",		"7"),
                                ("2",		"4"),
                                ("1",		"5"),
                                ("4",		"7"),
                                ("8",		"9"),
                                ("3",		"2"),
                                ("10",		"6"),
                                ("9",		"1"),
                                ("6",		"10");
                                

                                    
                                    
                                    
                                    
                                    