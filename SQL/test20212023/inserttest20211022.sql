INSERT INTO		CUSTOMER 	(`Name`,			Phone,			Email,						Address,		Note)
VALUES						("shibata",			"07011112222",		"shibata@gmail",		"JPN,tokyo",	"loeloet"),
							("kaneko",			"07047474747",		"kaneko@gmail",			"JPN,osaka",	"dongian"),
                            ("itou",			"07039393939",		"itou@icloud", 			"JPN,tochigi",	"lichlam"),
                            ("tsunematsu",		"07016871687",		"irohana@tsunematsu", 	"JPN,fukuoka",	"sangtrong"),
                            ("obara",			"08047714771",		"shinananai@obara",		"JPN,iwate",	"benbi");
    
INSERT	INTO CAR_ORDER    	(Maker,Model,`Year`,Color,Note)
VALUES						("ToYOTA","toyota86","1998/10/10","black","sangxinmin"),
							("HONDA","HONDAFREED","2010/10/10","red","binhdan"),
                            ("TOYOTA","TOYOTAARPHARD","2005/09/09","white","chuyencomatdat"),
                            ("NISSAN","NISSANLEAF","2015/01/01","white_black","xedien"),
                            ("TOYOTA","TOYOTAPRIUS","2021/09/27","blackedition","xelaidien");
INSERT	INTO	`ORDER`		(CustumerID,	CarID,	Amount,		SalePrice,	OrderDate,		DeliveryDate,	DeliveryAddress,	`Status`,	Note)
VALUES						("1",			"1",	"4000000",	"3950000",	"2021/10/10",	"2021/10/30",	"JPN,tokyo",		"dagiao",	"xechayngon"),
							("4",			"2",	"2500000",	"2300000",	"2021/10/09",	"2021/10/31",	"JPN,fukuoka",		"dagiao",	"tamchapnhan"),
                            ("2",			"3",	"5000000",	"4600000",	"2021/1/10",	"2021/2/28",	"JPN,osaka",		"dagiao",	"perfect"),
                            ("5",			"4",	"3200000",	"3000000",	"2021/1/1",		"2021/1/1",				"JPN,iwate",		"dahuy",	"xebiloi"),
                            ("3",			"3",		"2950000",	"2840000",	"2021/5/5",		"2021/2/2",				"JPN,tochigi",		"dahuy",			"chogiaoxe");