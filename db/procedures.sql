CREATE PROCEDURE `createStatusTable`()
BEGIN
	CREATE TABLE statuses (
    id int NOT NULL UNIQUE auto_increment,
    status VARCHAR(255) NOT NULL,
    PRIMARY KEY (id));
END

CREATE PROCEDURE `createuserTable`()
BEGIN
	CREATE TABLE users (
    id int NOT NULL AUTO_INCREMENT UNIQUE, 
    user_name VARCHAR(255),
    crypto_wallet_address VARCHAR(255) UNIQUE,
    status_id int,
    PRIMARY KEY (id),
	FOREIGN KEY (status_id) REFERENCES statuses (id));
END

CREATE PROCEDURE `createCampaignTable`()
BEGIN
	CREATE TABLE campaigns (
    id int NOT NULL UNIQUE auto_increment,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    amount FLOAT NOT NULL,
    remaining_amount FLOAT NOT NULL,
    exp_date DATE NOT NULL,
    status_id int,
    user_id int,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (status_id) REFERENCES statuses (id));
END

CREATE  PROCEDURE `createCurrenciesTable`()
BEGIN 
	CREATE TABLE currencies (
    id int NOT NULL UNIQUE auto_increment,
    code VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY (id));
END

CREATE PROCEDURE `createdonationTable`()
BEGIN
    CREATE TABLE donations (
    id int NOT NULL AUTO_INCREMENT UNIQUE,
    nickname VARCHAR(255),
    amount FLOAT,
    crypto_amount FLOAT,
    state ENUM ('valid', 'invalid') DEFAULT 'valid',
    campaign_id int,
    currency_id int,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaigns (id),
    FOREIGN KEY (currency_id) REFERENCES currencies (id));
END

CREATE PROCEDURE `insertStatusData`()
BEGIN
	Insert into statuses (status) VALUES ('active'),('expired'),('fraud'),('successful');
END

CREATE PROCEDURE `insertUsersData`()
BEGIN
	DECLARE statusId INT;
    Select id Into statusId From statuses where status = 'active';
	INSERT INTO users (user_name, crypto_wallet_address, status_id)
	VALUES ("Hayyat","USD", statusId),
	("Developer","Bitcoin", statusId);
END

CREATE PROCEDURE `insertCampaignsData`()
BEGIN
	DECLARE statusId INT;
    Select id Into statusId From statuses where status = 'active';
	INSERT INTO campaigns (name, description, amount, remaining_amount, exp_date, user_id, status_id)
	VALUES ("Help Needy", "For Helping poors", 200, 200, '2022-12-20',1, statusId),
	("Help Palestine", "For Helping poors in palestine", 300, 300, '2022-12-21',2, statusId),
    ("Help Needy", "For Helping poors", 200, 200, '2022-11-22',1, statusId),
	("Help Palestine", "For Helping poors in palestine", 300, 200, '2022-11-22',2, statusId),
    ("Help Needy", "For Helping poors", 200, 200, '2022-12-26',1, statusId),
	("Help Palestine", "For Helping poors in palestine", 300, 300, '2022-12-25',2, statusId),
    ("Help Needy", "For Helping poors", 200, 200, '2022-12-20',1, statusId),
	("Help Palestine", "For Helping poors in palestine", 300, 300, '2022-12-21',2, statusId),
    ("Help Needy", "For Helping poors", 200, 200, '2022-11-22',1, statusId),
	("Help Palestine", "For Helping poors in palestine", 300, 200, '2022-11-22',2, statusId),
    ("Help Needy", "For Helping poors", 200, 200, '2022-12-26',1, statusId),
	("Help Palestine", "For Helping poors in palestine", 300, 300, '2022-12-25',2, statusId),
    ("Help Needy", "For Helping poors", 200, 200, '2022-12-20',1, statusId),
	("Help Palestine", "For Helping poors in palestine", 300, 300, '2022-12-21',2, statusId),
    ("Help Needy", "For Helping poors", 200, 200, '2022-11-22',1, statusId),
	("Help Palestine", "For Helping poors in palestine", 300, 200, '2022-11-22',2, statusId),
    ("Help Needy", "For Helping poors", 200, 200, '2022-12-26',1, statusId),
	("Help Palestine", "For Helping poors in palestine", 300, 300, '2022-12-25',2, statusId),
    ("Help Needy", "For Helping poors", 200, 200, '2022-12-20',1, statusId),
	("Help Palestine", "For Helping poors in palestine", 300, 300, '2022-12-21',2, statusId),
    ("Help Needy", "For Helping poors", 200, 200, '2022-11-22',1, statusId),
	("Help Palestine", "For Helping poors in palestine", 300, 200, '2022-11-22',2, statusId),
    ("Help Needy", "For Helping poors", 200, 200, '2022-12-26',1, statusId),
	("Help Palestine", "For Helping poors in palestine", 300, 300, '2022-12-25',2, statusId),
    ("Help Needy", "For Helping poors", 200, 200, '2022-12-20',1, statusId),
	("Help Palestine", "For Helping poors in palestine", 300, 300, '2022-12-21',2, statusId),
    ("Help Needy", "For Helping poors", 200, 200, '2022-11-22',1, statusId),
	("Help Palestine", "For Helping poors in palestine", 300, 200, '2022-11-22',2, statusId),
    ("Help Needy", "For Helping poors", 200, 200, '2022-12-26',1, statusId),
	("Help Palestine", "For Helping poors in palestine", 300, 300, '2022-12-25',2, statusId);
END

CREATE PROCEDURE `insertCurrenciesData`()
BEGIN 
    INSERT INTO currencies (`code`, `name`) VALUES
    ('AFA', 'Afghan Afghani'),
	('ALL', 'Albanian Lek'),
	('DZD', 'Algerian Dinar'),
	('AOA', 'Angolan Kwanza'),
	('ARS', 'Argentine Peso'),
	('AMD', 'Armenian Dram'),
	('AWG', 'Aruban Florin'),
	('AUD', 'Australian Dollar'),
	('AZN', 'Azerbaijani Manat'),
	('BSD', 'Bahamian Dollar'),
	('BHD', 'Bahraini Dinar'),
	('BDT', 'Bangladeshi Taka'),
	('BBD', 'Barbadian Dollar'),
	('BYR', 'Belarusian Ruble'),
	('BEF', 'Belgian Franc'),
	('BZD', 'Belize Dollar'),
	('BMD', 'Bermudan Dollar'),
	('BTN', 'Bhutanese Ngultrum'),
	('BTC', 'Bitcoin'),
	('BOB', 'Bolivian Boliviano'),
	('BAM', 'Bosnia-Herzegovina Convertible Mark'),
	('BWP', 'Botswanan Pula'),
	('BRL', 'Brazilian Real'),
	('GBP', 'British Pound Sterling'),
	('BND', 'Brunei Dollar'),
	('BGN', 'Bulgarian Lev'),
	('BIF', 'Burundian Franc'),
	('KHR', 'Cambodian Riel'),
	('CAD', 'Canadian Dollar'),
	('CVE', 'Cape Verdean Escudo'),
	('KYD', 'Cayman Islands Dollar'),
	('XOF', 'CFA Franc BCEAO'),
	('XAF', 'CFA Franc BEAC'),
	('XPF', 'CFP Franc'),
	('CLP', 'Chilean Peso'),
	('CNY', 'Chinese Yuan'),
	('COP', 'Colombian Peso'),
	('KMF', 'Comorian Franc'),
	('CDF', 'Congolese Franc'),
	('CRC', 'Costa Rican ColÃ³n'),
	('HRK', 'Croatian Kuna'),
	('CUC', 'Cuban Convertible Peso'),
	('CZK', 'Czech Republic Koruna'),
	('DKK', 'Danish Krone'),
	('DJF', 'Djiboutian Franc'),
	('DOP', 'Dominican Peso'),
	('XCD', 'East Caribbean Dollar'),
	('EGP', 'Egyptian Pound'),
	('ERN', 'Eritrean Nakfa'),
	('EEK', 'Estonian Kroon'),
	('ETB', 'Ethiopian Birr'),
	('EUR', 'Euro'),
	('FKP', 'Falkland Islands Pound'),
	('FJD', 'Fijian Dollar'),
	('GMD', 'Gambian Dalasi'),
	('GEL', 'Georgian Lari'),
	('DEM', 'German Mark'),
	('GHS', 'Ghanaian Cedi'),
	('GIP', 'Gibraltar Pound'),
	('GRD', 'Greek Drachma'),
	('GTQ', 'Guatemalan Quetzal'),
	('GNF', 'Guinean Franc'),
	('GYD', 'Guyanaese Dollar'),
	('HTG', 'Haitian Gourde'),
	('HNL', 'Honduran Lempira'),
	('HKD', 'Hong Kong Dollar'),
	('HUF', 'Hungarian Forint'),
	('ISK', 'Icelandic KrÃ³na'),
	('INR', 'Indian Rupee'),
	('IDR', 'Indonesian Rupiah'),
	('IRR', 'Iranian Rial'),
	('IQD', 'Iraqi Dinar'),
	('ILS', 'Israeli New Sheqel'),
	('ITL', 'Italian Lira'),
	('JMD', 'Jamaican Dollar'),
	('JPY', 'Japanese Yen'),
	('JOD', 'Jordanian Dinar'),
	('KZT', 'Kazakhstani Tenge'),
	('KES', 'Kenyan Shilling'),
	('KWD', 'Kuwaiti Dinar'),
	('KGS', 'Kyrgystani Som'),
	('LAK', 'Laotian Kip'),
	('LVL', 'Latvian Lats'),
	('LBP', 'Lebanese Pound'),
	('LSL', 'Lesotho Loti'),
	('LRD', 'Liberian Dollar'),
	('LYD', 'Libyan Dinar'),
	('LTL', 'Lithuanian Litas'),
	('MOP', 'Macanese Pataca'),
	('MKD', 'Macedonian Denar'),
	('MGA', 'Malagasy Ariary'),
	('MWK', 'Malawian Kwacha'),
	('MYR', 'Malaysian Ringgit'),
	('MVR', 'Maldivian Rufiyaa'),
	('MRO', 'Mauritanian Ouguiya'),
	('MUR', 'Mauritian Rupee'),
	('MXN', 'Mexican Peso'),
	('MDL', 'Moldovan Leu'),
	('MNT', 'Mongolian Tugrik'),
	('MAD', 'Moroccan Dirham'),
	('MZM', 'Mozambican Metical'),
	('MMK', 'Myanmar Kyat'),
	('NAD', 'Namibian Dollar'),
	('NPR', 'Nepalese Rupee'),
	('ANG', 'Netherlands Antillean Guilder'),
	('TWD', 'New Taiwan Dollar'),
	('NZD', 'New Zealand Dollar'),
	('NIO', 'Nicaraguan CÃ³rdoba'),
	('NGN', 'Nigerian Naira'),
	('KPW', 'North Korean Won'),
	('NOK', 'Norwegian Krone'),
	('OMR', 'Omani Rial'),
	('PKR', 'Pakistani Rupee'),
	('PAB', 'Panamanian Balboa'),
	('PGK', 'Papua New Guinean Kina'),
	('PYG', 'Paraguayan Guarani'),
	('PEN', 'Peruvian Nuevo Sol'),
	('PHP', 'Philippine Peso'),
	('PLN', 'Polish Zloty'),
	('QAR', 'Qatari Rial'),
	('RON', 'Romanian Leu'),
	('RUB', 'Russian Ruble'),
	('RWF', 'Rwandan Franc'),
	('SVC', 'Salvadoran ColÃ³n'),
	('WST', 'Samoan Tala'),
	('SAR', 'Saudi Riyal'),
	('RSD', 'Serbian Dinar'),
	('SCR', 'Seychellois Rupee'),
	('SLL', 'Sierra Leonean Leone'),
	('SGD', 'Singapore Dollar'),
	('SKK', 'Slovak Koruna'),
	('SBD', 'Solomon Islands Dollar'),
	('SOS', 'Somali Shilling'),
	('ZAR', 'South African Rand'),
	('KRW', 'South Korean Won'),
	('XDR', 'Special Drawing Rights'),
	('LKR', 'Sri Lankan Rupee'),
	('SHP', 'St. Helena Pound'),
	('SDG', 'Sudanese Pound'),
	('SRD', 'Surinamese Dollar'),
	('SZL', 'Swazi Lilangeni'),
	('SEK', 'Swedish Krona'),
	('CHF', 'Swiss Franc'),
	('SYP', 'Syrian Pound'),
	('STD', 'São Tomé and Príncipe Dobra'),
	('TJS', 'Tajikistani Somoni'),
	('TZS', 'Tanzanian Shilling'),
	('THB', 'Thai Baht'),
	('TOP', 'Tongan paanga'),
	('TTD', 'Trinidad & Tobago Dollar'),
	('TND', 'Tunisian Dinar'),
	('TRY', 'Turkish Lira'),
	('TMT', 'Turkmenistani Manat'),
	('UGX', 'Ugandan Shilling'),
	('UAH', 'Ukrainian Hryvnia'),
	('AED', 'United Arab Emirates Dirham'),
	('UYU', 'Uruguayan Peso'),
	('USD', 'US Dollar'),
	('UZS', 'Uzbekistan Som'),
	('VUV', 'Vanuatu Vatu'),
	('VEF', 'Venezuelan BolÃ­var'),
	('VND', 'Vietnamese Dong'),
	('YER', 'Yemeni Rial'),
	('ZMK', 'Zambian Kwacha');
END

CREATE PROCEDURE `insertIntoDonation`(IN currencyCode varchar(255), donationName varchar(255), donationAmount float, campaignId int, cryptoAmount float)
BEGIN
	DECLARE currencyId INT;
    DECLARE remainingAmount FLOAT;
    DECLARE statusId INT;
    Select id Into currencyId From currencies where code = currencyCode;
    
    Insert Into donations (nickname, amount, crypto_amount, campaign_id, currency_id)
    Values (donationName, donationAmount, cryptoAmount, campaignId, currencyId);

	Update campaigns set remaining_amount = remaining_amount - donationAmount where id = campaignId;    
	
    Select remaining_amount Into remainingAmount From campaigns where id = campaignId;

	IF remainingAmount <= 0 Then
		Select id Into statusId From statuses where status = 'successful';
	
		Update campaigns set status_id = statusId where id = campaignId;
	END IF;
END

CREATE PROCEDURE `getAllCampaigns`()
BEGIN
	Select campaigns.id, campaigns.name, campaigns.description, campaigns.amount 
    from campaigns
    inner join statuses on campaigns.status_id = statuses.id 
    where statuses.status = 'active';
END

CREATE PROCEDURE `getStatusOfCampaign`(In campaignId int)
BEGIN
    Select statuses.status
    from campaigns
    inner join statuses on campaigns.status_id = statuses.id
    Where campaigns.id = campaignId;
END

CREATE PROCEDURE `MarkAsExpired`()
BEGIN
	DECLARE statusId INT;
    Select id Into statusId From statuses where status = 'expired';
	SET SQL_SAFE_UPDATES=0;
	Update campaigns Set status_id = statusId Where DATE(exp_date) <= DATE(NOW());
	SET SQL_SAFE_UPDATES=1;
END

CREATE PROCEDURE `MarkCampaignAsFraud`(IN campaignId int)
BEGIN
	DECLARE userId INT;
	DECLARE statusId INT;
    SET SQL_SAFE_UPDATES=0;
    Select user_id Into userId From campaigns where id = campaignId;
    Select id Into statusId From statuses where status = 'fraud';
    -- Mark the user as fraud and Mark all the campaigns of that user as fraud
    UPDATE users, campaigns
	SET users.status_id = statusId, campaigns.status_id = statusId
	WHERE users.id = userId AND campaigns.user_id = userId;
    -- Mark all the donations of that user as invalid
	UPDATE donations, campaigns
	SET donations.state = 2
	WHERE donations.campaign_id = campaigns.id AND campaigns.status_id = statusId;
    SET SQL_SAFE_UPDATES=1;
END