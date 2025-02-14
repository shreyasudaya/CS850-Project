CREATE DATABASE Bank;
USE Bank;

CREATE TABLE Customer (
	CustomerID INTEGER PRIMARY KEY AUTO_INCREMENT,
	FirstName VARCHAR(100) NOT NULL,
	LastName VARCHAR(100) NOT NULL,
	Email VARCHAR(100) UNIQUE NOT NULL,
	PhoneNumber VARCHAR(20) NOT NULL,
	Address VARCHAR(255) NOT NULL
);

CREATE TABLE Account (
	AccountNumber VARCHAR(20) PRIMARY KEY,
	AccountType VARCHAR(20) NOT NULL,
	Balance DECIMAL(15,2) NOT NULL,
	CustomerID INTEGER NOT NULL,
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Transaction (
	TransactionID INTEGER PRIMARY KEY AUTO_INCREMENT,
	TransactionType VARCHAR(20) NOT NULL,
	Amount DECIMAL(15,2) NOT NULL,
	TransactionDate DATETIME NOT NULL,
	AccountNumber VARCHAR(20) NOT NULL,
	FOREIGN KEY (AccountNumber) REFERENCES Account(AccountNumber)
);

CREATE TABLE Employee (
	EmployeeID INTEGER PRIMARY KEY AUTO_INCREMENT,
	FirstName VARCHAR(100) NOT NULL,
	LastName VARCHAR(100) NOT NULL,
	Position VARCHAR(50) NOT NULL,
	Email VARCHAR(100) UNIQUE NOT NULL,
	PhoneNumber VARCHAR(20) NOT NULL,
	Address VARCHAR(255) NOT NULL
);


INSERT INTO `Employee` VALUES
(1,'Jabari','Ziemann','dolor','manley.runolfsdottir@example.org','1-233-435-7971','980 O\'Keefe Shore Suite 959\nSouth Lance, CT 28322-6959'),
(2,'Yvonne','Kiehn','enim','pfeffer.vance@example.org','03638027632','1770 Stoltenberg Field\nNorth Hazelmouth, WV 43974'),
(3,'Cara','Lueilwitz','consequatur','patrick.pfeffer@example.net','1-333-277-7939','4114 Angelita Heights Suite 104\nRyanport, CO 06432'),
(4,'Pink','Lockman','optio','ischowalter@example.org','410.508.1360','622 O\'Hara Burg Suite 522\nPort Aldenchester, NH 39230-9713'),
(5,'Horace','Baumbach','sint','kuhn.helga@example.org','(218)223-1216','7323 Blaze Fords Suite 374\nBernitabury, WV 12424-0940'),
(6,'Vincenzo','Welch','rerum','aliyah.hoppe@example.net','(639)238-0824x35363','31858 Lottie Plain\nHettingerport, OR 33145'),
(7,'Etha','Dare','veritatis','hilario94@example.com','518-056-6129x9367','21004 Allie Lake\nLake Mandybury, ME 78275'),
(8,'Annamae','Rosenbaum','fugiat','yhilll@example.net','185-223-6134x889','938 Percival Shores\nLake Keven, IL 54008-1209'),
(9,'Olin','Eichmann','esse','apadberg@example.org','(310)624-6229','985 Russel Ridges\nSchmittburgh, DE 97378'),
(10,'Reynold','Howe','omnis','milan87@example.net','474-745-1749x8112','2033 Santino Pine Suite 702\nEast Earlineville, IN 05525-3864');

	 	 	 	

INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (1, 'Joana', 'Abernathy', 'altenwerth.loren@example.net', '492-229-8421', '7397 Rippin Pine\nEast Mae, MI 84141');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (2, 'Titus', 'Hamill', 'shanna53@example.com', '07976049425', '16697 Schmeler Freeway\nPort Damian, OK 23567');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (3, 'Kylee', 'Satterfield', 'alueilwitz@example.com', '(148)108-9395x9323', '833 Williamson Lane Apt. 595\nPort Vivianefurt, AR 95548-5520');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (4, 'Meda', 'Marquardt', 'wilfred.maggio@example.org', '1-136-377-4206x0989', '050 Carroll Spur Suite 489\nPort Marlenport, SD 46526');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (5, 'Oren', 'Olson', 'borer.lexus@example.com', '850.819.6820', '7994 Lind Plains\nMariahfurt, VT 13142-2911');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (6, 'Kali', 'Ullrich', 'vkris@example.com', '576-743-8559', '11816 Braun Harbor\nEast Kaylinton, PA 40408');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (7, 'Nichole', 'Little', 'amos.muller@example.org', '256-903-4023x60396', '5915 Jacobson Plaza\nEldonburgh, SD 43902-5217');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (8, 'Johnson', 'Koch', 'wolff.alysson@example.net', '097.991.5474', '8198 Champlin Fields Apt. 849\nNew Sigridhaven, LA 59722');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (9, 'Christelle', 'Conroy', 'dickens.pasquale@example.net', '(960)174-4771', '7187 McKenzie Spur Suite 339\nPort Sherman, IN 79493-0146');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (10, 'Claud', 'Nader', 'kellie07@example.net', '(040)378-6003x065', '114 Eduardo Cliffs Apt. 233\nLesterfurt, OH 20367-2576');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (11, 'Georgianna', 'Deckow', 'pvonrueden@example.org', '841.011.9734', '430 Vergie Dam\nNew Kole, PA 28869');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (12, 'Prudence', 'Wisozk', 'msatterfield@example.com', '(061)637-4783', '5021 Powlowski Knoll Suite 058\nLake Jovani, TN 56308-3123');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (13, 'Elissa', 'Weber', 'rmarvin@example.com', '+02(0)8357445332', '3920 Bartoletti Prairie Suite 825\nLake Mollieland, AK 01985-8572');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (14, 'Emma', 'Kessler', 'rnicolas@example.org', '05641119887', '067 Reese Isle Apt. 512\nWest Kennedy, IA 53835-0682');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (15, 'Jewel', 'Zemlak', 'satterfield.hiram@example.net', '155.081.0437x51180', '8272 Theodore Creek Apt. 026\nLuettgenville, WI 69221');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (16, 'Michaela', 'Cole', 'heathcote.walton@example.net', '01403524653', '77782 Champlin Branch Suite 854\nHelenamouth, DE 58207');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (17, 'Norris', 'Lesch', 'yolanda.beer@example.org', '+27(0)1851388982', '9251 Annabel Via Suite 658\nAlfredafurt, CA 17683-4879');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (18, 'Lambert', 'Hickle', 'gorczany.myah@example.net', '04104991590', '21153 Jerde Lake\nReynoldstown, WY 83497-1667');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (19, 'Skylar', 'Ratke', 'fschimmel@example.org', '112-988-5458', '32340 Okuneva Pines Suite 669\nWest Winfieldfurt, VT 41779');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (20, 'Kip', 'Kemmer', 'daron05@example.com', '1-417-329-1474', '17090 Schmidt Meadow\nBrakusberg, AR 11870');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (21, 'Jess', 'Brakus', 'elmo.bahringer@example.org', '375-679-8113', '9599 Tito Knolls\nPort Yadiraside, ME 75804');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (22, 'Hattie', 'Bogisich', 'anabelle54@example.net', '(431)211-3197x77732', '4500 Harvey Lights Apt. 139\nCamrontown, TX 36437');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (23, 'Kelsi', 'Dibbert', 'runolfsson.samson@example.com', '1-131-413-1866', '7529 Goodwin Crescent\nBashirianton, KY 28834-6216');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (24, 'Kiley', 'Olson', 'gabriella.west@example.com', '+90(9)2148831622', '411 Kuhlman Radial Apt. 983\nPort Gilbertoton, WV 48178');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (25, 'Edwin', 'Cremin', 'edison81@example.com', '1-132-023-6570', '06473 Nikolas Road\nNorth Hanna, CO 86350');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (26, 'Davon', 'Murazik', 'adriana67@example.com', '278.800.8940', '0050 Harley Lane Suite 648\nBogisichtown, MO 83154-7025');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (27, 'Breanne', 'Watsica', 'auer.max@example.org', '529-783-2689x512', '1168 Perry Crescent Suite 772\nEast Fatimamouth, DC 42151');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (28, 'Gabrielle', 'Lemke', 'muhammad.durgan@example.com', '1-812-389-4817x207', '66955 Pattie Radial Suite 580\nAlleneview, NV 92717-7588');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (29, 'Kip', 'Wilderman', 'murazik.jeanne@example.com', '334.717.0307x01436', '56374 Lucius Forest Suite 712\nGusikowskiport, VT 16169');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (30, 'Armand', 'Huel', 'anita.russel@example.com', '293-487-3639', '4368 Moore Circle Suite 273\nWaltermouth, CO 66220');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (31, 'Earlene', 'Lockman', 'lou.sauer@example.org', '(360)027-6485', '0252 Hirthe Mill Suite 683\nLeschtown, NY 22067');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (32, 'Krista', 'Ziemann', 'elena78@example.org', '932-380-5781x5006', '6672 Blick Trace\nWest Rexview, OK 24929');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (33, 'Stephen', 'Wehner', 'mills.wendell@example.org', '09378749904', '4473 Angelo Port\nRobertsburgh, OH 50538-5619');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (34, 'Caterina', 'Kling', 'nathan.wuckert@example.org', '+03(0)6680423647', '268 Weissnat Fork Suite 276\nWest Selina, NE 99764');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (35, 'Kylie', 'Runolfsson', 'earl33@example.net', '769.917.3219x8090', '718 Jeremy Vista Suite 165\nSouth Vance, WV 62874-2653');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (36, 'Maxie', 'Blick', 'krista88@example.com', '421.911.8872', '79748 Milford Rest Suite 672\nWest Stephen, KS 83306');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (37, 'Abelardo', 'Feeney', 'fay19@example.com', '1-148-294-8271x0771', '7181 Predovic Isle\nAlextown, AL 38516-4199');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (38, 'Willow', 'Gerlach', 'raynor.krystel@example.net', '368.840.2482', '08306 Heathcote Street\nWest Seth, TN 26078-9880');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (39, 'Brady', 'Feest', 'iritchie@example.org', '(219)086-4782', '40512 Willa Forks\nHaleytown, DE 04803');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (40, 'Althea', 'Armstrong', 'jan86@example.org', '695-549-9351x21890', '96919 Millie Springs\nWest Delores, TN 31654-6614');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (41, 'Sister', 'Wyman', 'julian09@example.com', '(229)685-6014x234', '8544 Hickle Throughway Suite 008\nMichellebury, CO 59359');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (42, 'Benjamin', 'Mayert', 'ezequiel87@example.org', '1-148-455-2199', '37281 Blanca Ridge Apt. 653\nHamillville, WI 86118');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (43, 'Joseph', 'Will', 'era.orn@example.net', '262-072-5615', '2508 Schinner Mission\nSouth Adellaview, KS 61156-8379');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (44, 'Lexie', 'Bergstrom', 'cgottlieb@example.net', '673-924-5662', '701 Becker Plain Apt. 576\nSouth Blaze, OR 99048');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (45, 'Bernadette', 'Konopelski', 'anne85@example.com', '1-128-485-4791x795', '305 Johnson Route\nElroyville, WI 73427');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (46, 'Emmalee', 'Feest', 'mrolfson@example.com', '(835)271-2039x53649', '778 Lemke Creek Suite 865\nShanamouth, SD 76102');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (47, 'Abbie', 'Fay', 'kihn.leo@example.com', '+76(4)1883394062', '088 Elissa Pine\nGreenstad, NV 37272-2000');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (48, 'Jovanny', 'Pagac', 'keegan56@example.com', '941.717.7922', '29584 Feest Club Apt. 407\nWeberberg, NV 16966-1902');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (49, 'Kaycee', 'King', 'darren51@example.org', '461.628.8826', '4249 Elinor Inlet\nNew Sadie, WA 42852');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (50, 'Marta', 'Trantow', 'effertz.golden@example.com', '(148)994-7219', '07145 Volkman Island Suite 209\nLuciestad, KY 58762-7032');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (51, 'Mohammed', 'Legros', 'norris.gaylord@example.org', '689.823.2545x8130', '431 Smith Way\nKleinbury, OK 72899');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (52, 'Emmanuelle', 'Willms', 'gferry@example.com', '1-728-578-6422x907', '8097 Lucinda Locks\nGradyland, UT 19477');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (53, 'Moshe', 'Langworth', 'katharina.block@example.com', '(967)647-9978x5169', '68389 Zulauf Valley\nPort Virgie, WV 14705');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (54, 'Alexandre', 'Howell', 'adrianna36@example.com', '1-538-913-9889x28580', '190 Freda Springs Apt. 023\nLake Tessie, WV 28212-4352');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (55, 'Hassan', 'Cummerata', 'ressie.kling@example.net', '760-789-6671', '8556 Hayes View\nDiannastad, IN 42360');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (56, 'Marquise', 'Johnson', 'lpagac@example.net', '687.022.1514x7075', '287 Monica Gateway Apt. 455\nLake Jasonberg, MA 28275-8161');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (57, 'Lura', 'Spinka', 'rjohnston@example.net', '(841)761-1809x27740', '335 Rippin Mall\nEast Kassandra, OH 19765');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (58, 'Dayne', 'Conn', 'sauer.leonard@example.org', '721.367.9855x0536', '00324 Mabel Knoll Suite 794\nNorth Kamren, NE 91921');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (59, 'Florencio', 'Tromp', 'dorris.vonrueden@example.org', '645.158.3451x200', '92021 Miracle Center\nWisozkburgh, NY 15653-9877');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (60, 'Lisandro', 'O\'Keefe', 'noemie.gislason@example.net', '1-742-870-3440', '82923 Schoen Ridge Suite 412\nLilianborough, RI 53521');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (61, 'Meaghan', 'Abbott', 'smcglynn@example.com', '141-967-8676x025', '2780 Celestine Extensions Suite 174\nHeidenreichport, WA 77689-8156');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (62, 'Lulu', 'Gerlach', 'cruickshank.bret@example.net', '1-000-743-3463x25587', '538 Oleta Turnpike Apt. 016\nYundtton, DC 74371');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (63, 'Alexandrea', 'Moore', 'ddare@example.org', '721.756.4411x74579', '577 Leora Crescent\nAiyanafort, WV 07994-5872');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (64, 'Selena', 'D\'Amore', 'lroob@example.net', '1-379-518-7660', '5392 Marielle Club\nBaumbachchester, NJ 88117');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (65, 'Mona', 'Volkman', 'giovanny60@example.com', '07272204789', '06931 Heaney Port Suite 191\nPort Amalia, VT 60712');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (66, 'Graham', 'Purdy', 'bernier.gilberto@example.com', '817-654-2391', '29194 Walsh Cove\nJakubowskiside, KS 12838');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (67, 'Ona', 'Gerlach', 'yasmine40@example.com', '758-589-0075', '7552 Lindgren Drives Apt. 922\nWildermanmouth, OH 67209');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (68, 'Ardith', 'Gleichner', 'stephanie.muller@example.com', '01907974641', '778 Dante Well\nLake Diana, WY 28831');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (69, 'Annie', 'Kutch', 'noe78@example.com', '261-670-9520x70412', '140 Murphy River\nNew Keshawn, LA 07605');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (70, 'Shania', 'Heller', 'ethan.terry@example.com', '01208611346', '039 Considine Square Suite 941\nEast Anahi, IN 02982-2967');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (71, 'Antonio', 'Farrell', 'adrain57@example.net', '+82(1)1592815694', '1471 Herminia Shore\nNorth Sarai, IN 00674');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (72, 'Matilde', 'Crona', 'carolyne40@example.org', '(524)445-0057', '397 Brenda Landing\nSouth Phyllis, HI 64190');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (73, 'Felicita', 'Metz', 'hane.melyssa@example.net', '105-062-0317x050', '6873 Labadie Lodge Suite 284\nNorth Meaganhaven, HI 82334-7576');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (74, 'Elnora', 'Beahan', 'davis.newell@example.net', '04580365781', '217 Wisozk Isle Suite 753\nDuBuquefurt, NC 16666');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (75, 'Keyon', 'Carter', 'lubowitz.nicholaus@example.net', '(795)729-6906x9153', '994 Claudine Club Apt. 047\nEast Novamouth, WI 15544');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (76, 'Dillan', 'Conroy', 'romaguera.liliane@example.org', '1-096-634-3046', '7752 Hattie Lane Suite 406\nSouth Connie, ID 40017-5769');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (77, 'Catalina', 'Lindgren', 'leffler.brayan@example.com', '01342369835', '7003 Tomasa Mountains Apt. 208\nHauckstad, IL 43544-1697');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (78, 'Sabina', 'Gutkowski', 'wschneider@example.com', '+02(2)4070843541', '59932 Lang Haven Apt. 441\nPort Sigridchester, RI 05970-0319');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (79, 'Jovanny', 'Orn', 'satterfield.floyd@example.net', '1-011-453-6779', '63593 Clarissa Creek\nAlfredfort, AL 05282');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (80, 'Heather', 'Green', 'gleason.juvenal@example.org', '470.907.5578x06553', '4319 Daryl Turnpike\nArmstrongmouth, MT 15538');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (81, 'Caitlyn', 'Medhurst', 'nannie90@example.org', '08591770321', '12765 Ashlee Roads Apt. 066\nSouth Lisa, NY 61952-7827');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (82, 'Roslyn', 'Mertz', 'yo\'kon@example.net', '620.047.9091', '50525 Bonita Stream Apt. 434\nWest Kelsie, VA 87467-1734');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (83, 'Abigayle', 'Durgan', 'emmerich.jannie@example.org', '1-861-727-7824', '86080 Bashirian Center Apt. 110\nRennertown, ME 33039-4583');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (84, 'Wava', 'Rippin', 'dibbert.eloise@example.org', '1-491-900-6965', '328 Brenda Burgs\nCarmineland, WY 95333');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (85, 'Dina', 'Lesch', 'zspinka@example.com', '944-713-1291x51108', '05684 Makenzie Ferry\nSouth Annamaeville, LA 81934');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (86, 'Murl', 'Gerlach', 'howe.leann@example.org', '(306)961-0294x48847', '322 Nolan Fork Suite 703\nNew Abigayle, IL 90154-5834');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (87, 'Katheryn', 'Kiehn', 'cchamplin@example.org', '753-057-7979x29747', '931 Leannon Haven Apt. 145\nMaryjaneshire, LA 11430');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (88, 'Monserrate', 'Larkin', 'darian90@example.com', '460.445.5749x4852', '98936 Wisoky Glen\nMelynamouth, AZ 33674');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (89, 'Adele', 'Fadel', 'medhurst.anissa@example.net', '706-898-6084x177', '96667 Anderson Via Suite 047\nLake Geovanny, NM 75650-0448');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (90, 'Belle', 'Lemke', 'valentina.lakin@example.com', '395-862-9724', '72045 Jazlyn Walks\nRatkeshire, TX 54033');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (91, 'Donato', 'Paucek', 'hveum@example.net', '195.120.4514x2043', '6791 Daugherty Underpass Suite 866\nPort Sherman, IN 21354');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (92, 'Gerry', 'Dietrich', 'gerhold.ricardo@example.org', '1-391-012-2019x776', '28608 Wunsch Green Suite 430\nMrazside, IL 80759-0053');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (93, 'Maxwell', 'Heathcote', 'joanie51@example.org', '05357647053', '4226 Harvey Locks Suite 298\nPort Rozella, TX 38224');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (94, 'Gerald', 'Kiehn', 'rcrist@example.com', '(308)269-9136x0468', '960 Mohr Well\nNovafort, DC 63595-9969');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (95, 'Ara', 'Watsica', 'morissette.karelle@example.com', '(710)841-2676x153', '2321 Wisoky Roads Suite 331\nMarksville, SD 67240');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (96, 'Kamille', 'Wolf', 'larson.braden@example.com', '(791)638-8706x1453', '2891 Bergstrom Lodge\nNorth Nanniehaven, GA 68303');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (97, 'Ian', 'Daugherty', 'fae.rogahn@example.net', '008.408.1266x168', '7576 Wava Valleys Apt. 427\nBorermouth, MO 44040');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (98, 'Irma', 'Mills', 'eritchie@example.com', '1-080-074-8776x9167', '35115 Ondricka Glens\nSouth Micaela, OR 22724-3499');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (99, 'Magdalena', 'Murray', 'boris.kub@example.com', '1-644-687-9418x744', '5157 Veum Lodge\nSouth Onie, CT 77193');
INSERT INTO `Customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`) VALUES (100, 'Chasity', 'Klein', 'xmills@example.org', '070.604.9502', '442 Wilber Neck Apt. 445\nZoilamouth, SD 57742');


INSERT INTO Account (AccountNumber, AccountType, Balance, CustomerID) VALUES
('ACC100001', 'Savings', 4523.75, 1),
('ACC100002', 'Checking', 1250.50, 2),
('ACC100003', 'Savings', 7890.30, 3),
('ACC100004', 'Checking', 3020.00, 4),
('ACC100005', 'Savings', 9560.20, 5),
('ACC100006', 'Checking', 1450.75, 6),
('ACC100007', 'Savings', 6325.40, 7),
('ACC100008', 'Checking', 785.20, 8),
('ACC100009', 'Savings', 9400.60, 9),
('ACC100010', 'Checking', 2500.90, 10),
('ACC100011', 'Savings', 5123.80, 11),
('ACC100012', 'Checking', 3105.65, 12),
('ACC100013', 'Savings', 8740.95, 13),
('ACC100014', 'Checking', 460.25, 14),
('ACC100015', 'Savings', 12350.10, 15),
('ACC100016', 'Checking', 2520.80, 16),
('ACC100017', 'Savings', 6400.45, 17),
('ACC100018', 'Checking', 1500.90, 18),
('ACC100019', 'Savings', 9320.70, 19),
('ACC100020', 'Checking', 3405.35, 20),
('ACC100021', 'Savings', 4523.75, 21),
('ACC100022', 'Checking', 1250.50, 22),
('ACC100023', 'Savings', 7890.30, 23),
('ACC100024', 'Checking', 3020.00, 24),
('ACC100025', 'Savings', 9560.20, 25),
('ACC100026', 'Checking', 1450.75, 26),
('ACC100027', 'Savings', 6325.40, 27),
('ACC100028', 'Checking', 785.20, 28),
('ACC100029', 'Savings', 9400.60, 29),
('ACC100030', 'Checking', 2500.90, 30),
('ACC100031', 'Savings', 5123.80, 31),
('ACC100032', 'Checking', 3105.65, 32),
('ACC100033', 'Savings', 8740.95, 33),
('ACC100034', 'Checking', 460.25, 34),
('ACC100035', 'Savings', 12350.10, 35),
('ACC100036', 'Checking', 2520.80, 36),
('ACC100037', 'Savings', 6400.45, 37),
('ACC100038', 'Checking', 1500.90, 38),
('ACC100039', 'Savings', 9320.70, 39),
('ACC100040', 'Checking', 3405.35, 40),
('ACC100041', 'Savings', 4523.75, 41),
('ACC100042', 'Checking', 1250.50, 42),
('ACC100043', 'Savings', 7890.30, 43),
('ACC100044', 'Checking', 3020.00, 44),
('ACC100045', 'Savings', 9560.20, 45),
('ACC100046', 'Checking', 1450.75, 46),
('ACC100047', 'Savings', 6325.40, 47),
('ACC100048', 'Checking', 785.20, 48),
('ACC100049', 'Savings', 9400.60, 49),
('ACC100050', 'Checking', 2500.90, 50),
('ACC100051', 'Savings', 5123.80, 51),
('ACC100052', 'Checking', 3105.65, 52),
('ACC100053', 'Savings', 8740.95, 53),
('ACC100054', 'Checking', 460.25, 54),
('ACC100055', 'Savings', 12350.10, 55),
('ACC100056', 'Checking', 2520.80, 56),
('ACC100057', 'Savings', 6400.45, 57),
('ACC100058', 'Checking', 1500.90, 58),
('ACC100059', 'Savings', 9320.70, 59),
('ACC100060', 'Checking', 3405.35, 60),
('ACC100061', 'Savings', 4523.75, 61),
('ACC100062', 'Checking', 1250.50, 62),
('ACC100063', 'Savings', 7890.30, 63),
('ACC100064', 'Checking', 3020.00, 64),
('ACC100065', 'Savings', 9560.20, 65),
('ACC100066', 'Checking', 1450.75, 66),
('ACC100067', 'Savings', 6325.40, 67),
('ACC100068', 'Checking', 785.20, 68),
('ACC100069', 'Savings', 9400.60, 69),
('ACC100070', 'Checking', 2500.90, 70),
('ACC100071', 'Savings', 5123.80, 71),
('ACC100072', 'Checking', 3105.65, 72),
('ACC100073', 'Savings', 8740.95, 73),
('ACC100074', 'Checking', 460.25, 74),
('ACC100075', 'Savings', 12350.10, 75),
('ACC100076', 'Checking', 2520.80, 76),
('ACC100077', 'Savings', 6400.45, 77),
('ACC100078', 'Checking', 1500.90, 78),
('ACC100079', 'Savings', 9320.70, 79),
('ACC100080', 'Checking', 3405.35, 80),
('ACC100081', 'Savings', 4523.75, 81),
('ACC100082', 'Checking', 1250.50, 82),
('ACC100083', 'Savings', 7890.30, 83),
('ACC100084', 'Checking', 3020.00, 84),
('ACC100085', 'Savings', 9560.20, 85),
('ACC100086', 'Checking', 1450.75, 86),
('ACC100087', 'Savings', 6325.40, 87),
('ACC100088', 'Checking', 785.20, 88),
('ACC100089', 'Savings', 9400.60, 89),
('ACC100090', 'Checking', 2500.90, 90),
('ACC100091', 'Savings', 5123.80, 91),
('ACC100092', 'Checking', 3105.65, 92),
('ACC100093', 'Savings', 8740.95, 93),
('ACC100094', 'Checking', 460.25, 94),
('ACC100095', 'Savings', 12350.10, 95),
('ACC100096', 'Checking', 2520.80, 96),
('ACC100097', 'Savings', 6400.45, 97),
('ACC100098', 'Checking', 1500.90, 98),
('ACC100099', 'Savings', 9320.70, 99),
('ACC100100', 'Checking', 3405.35, 100);


	 	 	 	

INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 2770.78, '2025-06-17 07:58:00', 'ACC100045');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 5093.29, '2025-06-21 16:50:00', 'ACC100069');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 1258.31, '2025-06-26 23:24:00', 'ACC100063');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 1018.94, '2025-06-25 03:45:00', 'ACC100096');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 921.54, '2025-06-06 10:30:00', 'ACC100030');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 1526.75, '2025-07-03 03:59:00', 'ACC100070');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 1678.73, '2025-06-07 12:12:00', 'ACC100050');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 1310.72, '2025-06-22 17:20:00', 'ACC100033');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 3201.77, '2025-06-25 00:53:00', 'ACC100047');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 947.2, '2025-06-08 17:15:00', 'ACC100046');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 3126.53, '2025-06-11 20:20:00', 'ACC100057');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 203.91, '2025-07-05 10:00:00', 'ACC100075');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 624.85, '2025-06-21 13:05:00', 'ACC100012');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4967.66, '2025-06-25 08:29:00', 'ACC100022');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 424.8, '2025-06-18 19:52:00', 'ACC100034');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 3135.8, '2025-06-30 04:22:00', 'ACC100043');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 146.39, '2025-07-05 23:21:00', 'ACC100012');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 508.94, '2025-06-09 01:25:00', 'ACC100015');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 2380.6, '2025-06-12 21:55:00', 'ACC100052');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 819.46, '2025-06-15 05:23:00', 'ACC100026');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 3048.51, '2025-06-09 03:18:00', 'ACC100022');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 933.51, '2025-07-03 08:04:00', 'ACC100029');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4290.44, '2025-06-10 15:07:00', 'ACC100004');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4625.4, '2025-06-22 22:55:00', 'ACC100055');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4066.24, '2025-06-07 15:38:00', 'ACC100074');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 3715.49, '2025-06-06 06:30:00', 'ACC100053');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 3794.05, '2025-06-21 13:18:00', 'ACC100022');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 3289.47, '2025-06-25 17:19:00', 'ACC100097');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4615.14, '2025-06-06 10:39:00', 'ACC100023');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 1417.38, '2025-06-17 10:42:00', 'ACC100049');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 2435.9, '2025-07-04 18:00:00', 'ACC100099');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 5921.0, '2025-06-19 12:29:00', 'ACC100097');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4107.63, '2025-06-20 05:35:00', 'ACC100063');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 1003.95, '2025-06-20 08:45:00', 'ACC100078');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 3521.65, '2025-06-23 16:18:00', 'ACC100060');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 2325.78, '2025-06-19 10:18:00', 'ACC100009');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 3943.37, '2025-06-19 13:21:00', 'ACC100038');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 4983.1, '2025-06-23 09:28:00', 'ACC100014');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 616.22, '2025-06-26 11:34:00', 'ACC100015');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 1343.54, '2025-07-05 21:29:00', 'ACC100061');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 173.86, '2025-06-24 01:36:00', 'ACC100086');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 2552.82, '2025-06-26 19:28:00', 'ACC100038');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4068.16, '2025-06-29 15:59:00', 'ACC100017');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 3389.5, '2025-06-13 15:05:00', 'ACC100080');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 1414.55, '2025-06-21 11:53:00', 'ACC100097');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 2737.56, '2025-06-25 13:57:00', 'ACC100074');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 957.11, '2025-06-17 01:31:00', 'ACC100059');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 337.95, '2025-06-18 01:31:00', 'ACC100064');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 1078.35, '2025-06-17 22:18:00', 'ACC100090');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 1016.69, '2025-06-06 02:25:00', 'ACC100087');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 4541.69, '2025-07-05 11:58:00', 'ACC100076');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 2200.09, '2025-06-10 00:42:00', 'ACC100050');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 585.68, '2025-06-16 16:05:00', 'ACC100093');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 490.02, '2025-06-25 23:43:00', 'ACC100090');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 697.5, '2025-06-20 01:26:00', 'ACC100086');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 2818.25, '2025-07-03 22:42:00', 'ACC100013');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 986.42, '2025-06-21 18:06:00', 'ACC100011');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 2316.47, '2025-07-04 09:55:00', 'ACC100001');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 3308.29, '2025-06-24 06:46:00', 'ACC100077');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 214.45, '2025-06-16 08:57:00', 'ACC100069');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 1503.09, '2025-07-04 04:20:00', 'ACC100020');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 2025.61, '2025-06-22 12:23:00', 'ACC100083');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 6564.5, '2025-06-09 05:43:00', 'ACC100032');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 1533.96, '2025-06-27 09:33:00', 'ACC100036');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4892.87, '2025-06-28 20:38:00', 'ACC100060');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 2086.25, '2025-06-11 22:45:00', 'ACC100089');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4290.4, '2025-06-07 14:15:00', 'ACC100028');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 3475.62, '2025-06-12 16:48:00', 'ACC100032');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 1683.35, '2025-06-09 10:36:00', 'ACC100033');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 721.65, '2025-06-25 19:44:00', 'ACC100072');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 3758.85, '2025-06-27 10:39:00', 'ACC100077');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 762.62, '2025-06-30 05:28:00', 'ACC100066');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4448.48, '2025-07-05 05:22:00', 'ACC100052');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 488.97, '2025-07-03 11:44:00', 'ACC100088');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 4182.14, '2025-06-26 14:24:00', 'ACC100095');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 260.67, '2025-06-10 05:19:00', 'ACC100002');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 731.81, '2025-06-17 23:12:00', 'ACC100010');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 2040.09, '2025-06-08 00:31:00', 'ACC100005');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 1558.29, '2025-06-28 07:17:00', 'ACC100074');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 2630.14, '2025-06-19 09:40:00', 'ACC100061');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 411.03, '2025-06-22 16:06:00', 'ACC100001');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 3638.71, '2025-07-01 01:25:00', 'ACC100025');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4920.2, '2025-06-24 02:27:00', 'ACC100096');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4602.52, '2025-06-28 15:29:00', 'ACC100075');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 339.47, '2025-06-16 21:27:00', 'ACC100062');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 1003.1, '2025-07-03 23:13:00', 'ACC100009');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 653.6, '2025-06-28 02:26:00', 'ACC100024');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 3642.19, '2025-06-19 00:09:00', 'ACC100045');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 333.77, '2025-06-22 02:03:00', 'ACC100005');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 379.33, '2025-06-22 11:39:00', 'ACC100036');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 389.39, '2025-06-17 02:38:00', 'ACC100048');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4192.8, '2025-06-26 13:16:00', 'ACC100008');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 151.33, '2025-06-11 03:01:00', 'ACC100025');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 2921.33, '2025-06-18 05:31:00', 'ACC100062');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4203.12, '2025-06-21 07:01:00', 'ACC100065');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 3615.23, '2025-07-04 18:13:00', 'ACC100007');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 715.9, '2025-06-19 19:17:00', 'ACC100003');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 2444.96, '2025-07-01 08:06:00', 'ACC100098');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 961.26, '2025-06-29 12:26:00', 'ACC100041');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 689.37, '2025-07-02 05:57:00', 'ACC100004');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 281.48, '2025-06-30 09:16:00', 'ACC1000100');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 570.65, '2025-06-11 03:56:00', 'ACC100049');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 1814.36, '2025-06-11 08:22:00', 'ACC100093');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4020.46, '2025-06-20 08:26:00', 'ACC100031');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 2363.5, '2025-06-17 06:17:00', 'ACC100068');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 6344.28, '2025-06-25 18:38:00', 'ACC100057');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 628.43, '2025-06-23 15:30:00', 'ACC100082');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 634.43, '2025-06-25 18:54:00', 'ACC100056');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 2248.74, '2025-07-02 12:50:00', 'ACC100035');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4801.43, '2025-07-01 17:29:00', 'ACC100023');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 694.61, '2025-06-21 20:15:00', 'ACC100056');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 1081.46, '2025-06-29 14:36:00', 'ACC100016');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 3988.21, '2025-06-19 19:50:00', 'ACC100090');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 397.49, '2025-06-21 09:56:00', 'ACC100033');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4373.9, '2025-07-04 15:32:00', 'ACC100094');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 3527.9, '2025-06-11 17:18:00', 'ACC100076');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4824.98, '2025-06-18 19:27:00', 'ACC1000100');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4192.75, '2025-06-11 07:53:00', 'ACC100061');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 6329.5, '2025-06-25 10:14:00', 'ACC100049');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 3733.63, '2025-07-04 09:42:00', 'ACC100085');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 635.27, '2025-06-19 04:12:00', 'ACC100028');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 2242.2, '2025-06-30 22:51:00', 'ACC100049');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 333.1, '2025-06-08 06:33:00', 'ACC100037');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 1784.77, '2025-06-13 22:26:00', 'ACC100058');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 2346.82, '2025-06-29 06:32:00', 'ACC100094');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 1903.68, '2025-06-11 05:37:00', 'ACC100081');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 1408.62, '2025-06-14 21:28:00', 'ACC100053');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 1438.4, '2025-06-24 08:57:00', 'ACC100033');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 665.83, '2025-06-23 02:45:00', 'ACC100035');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 3368.57, '2025-06-08 13:24:00', 'ACC100064');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 1945.31, '2025-06-26 10:33:00', 'ACC100035');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 3416.49, '2025-06-06 17:26:00', 'ACC100007');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 3565.5, '2025-07-03 01:43:00', 'ACC100086');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 586.28, '2025-06-13 11:22:00', 'ACC100064');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 1196.24, '2025-06-18 03:50:00', 'ACC100059');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 873.52, '2025-06-13 19:27:00', 'ACC100059');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4481.57, '2025-06-11 19:23:00', 'ACC100057');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 2074.88, '2025-06-09 12:14:00', 'ACC100021');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 3521.89, '2025-07-05 08:30:00', 'ACC100086');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 506.92, '2025-06-28 00:27:00', 'ACC100016');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 3696.84, '2025-06-26 13:58:00', 'ACC100022');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 3491.12, '2025-06-09 19:17:00', 'ACC100028');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 1215.19, '2025-06-06 22:18:00', 'ACC100029');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 250.94, '2025-06-14 11:47:00', 'ACC100078');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 1292.02, '2025-06-27 06:54:00', 'ACC100046');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4407.93, '2025-06-28 14:49:00', 'ACC100045');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 2094.58, '2025-06-27 12:11:00', 'ACC100098');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 5002.06, '2025-06-13 05:27:00', 'ACC100050');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 616.2, '2025-06-07 17:44:00', 'ACC100099');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 2321.39, '2025-06-13 08:47:00', 'ACC100078');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 2031.2, '2025-06-06 09:04:00', 'ACC100080');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 1655.39, '2025-06-14 19:13:00', 'ACC100034');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 3792.73, '2025-06-13 05:47:00', 'ACC100024');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 2686.61, '2025-06-25 21:30:00', 'ACC100023');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 2947.82, '2025-07-04 00:29:00', 'ACC100005');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 2829.29, '2025-07-02 21:41:00', 'ACC100042');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4355.25, '2025-06-23 13:20:00', 'ACC100071');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 635.67, '2025-06-28 07:39:00', 'ACC100081');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4488.99, '2025-06-30 12:42:00', 'ACC100024');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 1711.76, '2025-06-06 16:16:00', 'ACC100089');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 2787.39, '2025-06-24 07:29:00', 'ACC100029');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 2975.27, '2025-06-07 16:08:00', 'ACC100080');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 2450.07, '2025-07-02 07:50:00', 'ACC100024');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 295.79, '2025-06-21 22:44:00', 'ACC100072');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4347.75, '2025-06-14 05:55:00', 'ACC100099');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 3890.68, '2025-06-17 22:55:00', 'ACC100017');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 2235.25, '2025-06-08 10:44:00', 'ACC100036');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 197.06, '2025-06-22 10:32:00', 'ACC100083');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 1157.06, '2025-07-03 05:40:00', 'ACC100070');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 96.33, '2025-06-14 05:40:00', 'ACC100067');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 380.32, '2025-06-27 16:44:00', 'ACC100034');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4736.15, '2025-06-16 16:25:00', 'ACC100097');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 238.09, '2025-06-13 02:46:00', 'ACC100093');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 10172.72, '2025-06-17 07:33:00', 'ACC100022');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 3230.92, '2025-06-12 06:35:00', 'ACC100035');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 1899.8, '2025-06-25 23:33:00', 'ACC100028');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4485.62, '2025-06-10 20:28:00', 'ACC100047');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 3656.35, '2025-06-10 12:32:00', 'ACC100005');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 3584.15, '2025-06-25 12:50:00', 'ACC100075');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 915.34, '2025-06-08 12:05:00', 'ACC100042');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 2994.8, '2025-06-12 01:07:00', 'ACC1000100');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 1722.51, '2025-06-28 20:19:00', 'ACC100058');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 2869.6, '2025-06-10 05:04:00', 'ACC100086');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 1523.18, '2025-06-09 09:48:00', 'ACC100023');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 1023.28, '2025-06-23 22:37:00', 'ACC100037');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 3477.87, '2025-07-03 15:37:00', 'ACC100047');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4350.21, '2025-06-08 20:23:00', 'ACC100025');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 2415.9, '2025-06-25 05:21:00', 'ACC100037');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4878.22, '2025-06-12 20:06:00', 'ACC100030');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 1140.63, '2025-06-14 09:56:00', 'ACC100009');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 4593.52, '2025-06-25 19:24:00', 'ACC100009');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 2083.51, '2025-06-09 10:46:00', 'ACC100078');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 850.8, '2025-06-23 03:47:00', 'ACC100069');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 2567.81, '2025-06-12 16:34:00', 'ACC100090');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 3311.05, '2025-06-24 12:01:00', 'ACC100029');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 1311.48, '2025-06-19 10:21:00', 'ACC100038');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 2347.64, '2025-06-28 17:57:00', 'ACC100045');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Withdrawal', 9107.21, '2025-06-07 17:57:00', 'ACC100023');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 2392.98, '2025-07-02 22:01:00', 'ACC100049');
INSERT INTO Transaction (TransactionType, Amount, TransactionDate, AccountNumber) VALUES ('Deposit', 3776.53, '2025-06-13 20:49:00', 'ACC100074');

