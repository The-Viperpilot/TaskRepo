-- country 
CREATE TABLE countrydetail (
    cid INT GENERATED BY DEFAULT AS IDENTITY (START WITH 2000 INCREMENT BY 1) PRIMARY KEY,
    country VARCHAR2(20)
);


  INSERT INTO countrydetail (country) VALUES ('India');
  INSERT INTO countrydetail (country) VALUES ('United States');
  INSERT INTO countrydetail (country) VALUES ('France');
  INSERT INTO countrydetail (country) VALUES ('China');
  INSERT INTO countrydetail (country) VALUES ('Canada');


SELECT * FROM countrydetail;


-- state 

CREATE TABLE statedetail (
    sid INT GENERATED BY DEFAULT AS IDENTITY (START WITH 3000 INCREMENT BY 1) PRIMARY KEY,
    state VARCHAR2(20),
    cid INT,
    CONSTRAINT fk_country FOREIGN KEY (cid) REFERENCES countrydetail(cid)
);






  INSERT INTO statedetail (state, cid) VALUES ('Tamilnadu', 2000);
  INSERT INTO statedetail (state, cid) VALUES ('Karnataka', 2000);
  INSERT INTO statedetail (state, cid) VALUES ('West Bengal', 2000);
  INSERT INTO statedetail (state, cid) VALUES ('California', 2001);
  INSERT INTO statedetail (state, cid) VALUES ('Colorado', 2001);
  INSERT INTO statedetail (state, cid) VALUES ('Grand East', 2002);
  INSERT INTO statedetail (state, cid) VALUES ('Fujian', 2003);
  INSERT INTO statedetail (state, cid) VALUES ('Gansu', 2003);
  INSERT INTO statedetail (state, cid) VALUES ('Hunan', 2003);
  INSERT INTO statedetail (state, cid) VALUES ('Yukon', 2004);
  INSERT INTO statedetail (state, cid) VALUES ('Manitoba', 2004);
  

SELECT * FROM statedetail;


-- city

CREATE TABLE citydetail (
      cityid INT GENERATED BY DEFAULT AS IDENTITY (START WITH 4000 INCREMENT BY 1) PRIMARY KEY,
      city VARCHAR2(20),
      sid INT,
      cid INT,
      CONSTRAINT fk_country2 FOREIGN KEY (cid) REFERENCES countrydetail(cid),
      CONSTRAINT fk_state2 FOREIGN KEY (sid) REFERENCES statedetail(sid)
    )
    
    
INSERT INTO citydetail (city, sid, cid) VALUES ('Chennai', 3000, 2000);
  INSERT INTO citydetail (city, sid, cid) VALUES ('Salem', 3000, 2000);
  INSERT INTO citydetail (city, sid, cid) VALUES ('Kolkata', 3002, 2000);
  INSERT INTO citydetail (city, sid, cid) VALUES ('Bangalore', 3001, 2000);
  INSERT INTO citydetail (city, sid, cid) VALUES ('Los Angels', 3003, 2001);
  INSERT INTO citydetail (city, sid, cid) VALUES ('Lead ville', 3004, 2001);
  INSERT INTO citydetail (city, sid, cid) VALUES ('Durango', 3004, 2001);
  INSERT INTO citydetail (city, sid, cid) VALUES ('Metz', 3005, 2002);
  INSERT INTO citydetail (city, sid, cid) VALUES ('Mul House', 3005, 2002);
  INSERT INTO citydetail (city, sid, cid) VALUES ('Nancy', 3005, 2002);
  INSERT INTO citydetail (city, sid, cid) VALUES ('Fuzhov', 3006, 2003);
  INSERT INTO citydetail (city, sid, cid) VALUES ('Lanshou', 3007, 2003);
  INSERT INTO citydetail (city, sid, cid) VALUES ('Xiangton', 3008, 2003);
  INSERT INTO citydetail (city, sid, cid) VALUES ('Mayo', 3009, 2004);
  INSERT INTO citydetail (city, sid, cid) VALUES ('Brandon', 3010, 2004);
  
  
  select * from citydetail
  
  
-- contact
  
CREATE TABLE contactdetail (
    contactid INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1000 INCREMENT BY 1) PRIMARY KEY,
    contact VARCHAR2(10)
);

INSERT INTO contactdetail (contact) VALUES ('1234567890');
INSERT INTO contactdetail (contact) VALUES ('9876543210');
INSERT INTO contactdetail (contact) VALUES ('1112223333');
INSERT INTO contactdetail (contact) VALUES ('4445556666');
INSERT INTO contactdetail (contact) VALUES ('7778889999');
INSERT INTO contactdetail (contact) VALUES ('1234432112');
INSERT INTO contactdetail (contact) VALUES ('9999999999');
INSERT INTO contactdetail (contact) VALUES ('8888888888');
INSERT INTO contactdetail (contact) VALUES ('7777777777');
INSERT INTO contactdetail (contact) VALUES ('6666666666');
INSERT INTO contactdetail (contact) VALUES ('5555555555');
INSERT INTO contactdetail (contact) VALUES ('4444444444');
INSERT INTO contactdetail (contact) VALUES ('3333333333');
INSERT INTO contactdetail (contact) VALUES ('2222222222');
INSERT INTO contactdetail (contact) VALUES ('1111111111');
INSERT INTO contactdetail (contact) VALUES ('1212121212');
INSERT INTO contactdetail (contact) VALUES ('2121212121');
INSERT INTO contactdetail (contact) VALUES ('2323232323');
INSERT INTO contactdetail (contact) VALUES ('3434343434');
INSERT INTO contactdetail (contact) VALUES ('4545454545');


select * from contactdetail


-- companydetail

CREATE TABLE companydetail (
    companyid INT GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    companyname VARCHAR(20),
    companyshortname VARCHAR(10),
    Address VARCHAR(30),
    zipcode INT,
    active VARCHAR(3),
    contactid INT,
    cid INT,
    sid INT,
    cityid INT,
    establish_date DATE,
    revenue DECIMAL(10,2),
    CONSTRAINT fk_country3 FOREIGN KEY (cid) REFERENCES countrydetail(cid),
    CONSTRAINT fk_state3 FOREIGN KEY (sid) REFERENCES statedetail(sid),
    CONSTRAINT fk_city3 FOREIGN KEY (cityid) REFERENCES citydetail(cityid),
    CONSTRAINT fk_contact3 FOREIGN KEY (contactid) REFERENCES contactdetail(contactid)
);

INSERT INTO companydetail (companyname, companyshortname, Address, zipcode, active, contactid, cid, sid, cityid, establish_date, revenue) VALUES ('ABC Corporation', 'ABC Corp', '123 Main St', 12345, 'Yes', 1000, 2000, 3000, 4000, TO_DATE('01-01-2000', 'DD-MM-YYYY'), 92743.43);
INSERT INTO companydetail (companyname, companyshortname, Address, zipcode, active, contactid, cid, sid, cityid, establish_date, revenue) VALUES ('XYZ Industries', 'XYZ Ind', '456 Elm St', 54321, 'Yes', 1001, 2000, 3000, 4001, TO_DATE('15-03-2002', 'DD-MM-YYYY'), 58475.23);
INSERT INTO companydetail (companyname, companyshortname, Address, zipcode, active, contactid, cid, sid, cityid, establish_date, revenue) VALUES ('LMN Enterprises', 'LMN Ent', '789 Oak St', 67890, 'No', 1002, 2000, 3001, 4002, TO_DATE('20-05-2005', 'DD-MM-YYYY'), 102354.67);
INSERT INTO companydetail (companyname, companyshortname, Address, zipcode, active, contactid, cid, sid, cityid, establish_date, revenue) VALUES ('PQR Ltd', 'PQR Ltd', '101 Pine St', 98765, 'Yes', 1003, 2000, 3002, 4003, TO_DATE('10-10-2010', 'DD-MM-YYYY'), 75432.12);
INSERT INTO companydetail (companyname, companyshortname, Address, zipcode, active, contactid, cid, sid, cityid, establish_date, revenue) VALUES ('JKL Co.', 'JKL Co', '202 Cedar St', 23456, 'Yes', 1004, 2001, 3003, 4004, TO_DATE('25-08-2007', 'DD-MM-YYYY'), 62345.89);
INSERT INTO companydetail (companyname, companyshortname, Address, zipcode, active, contactid, cid, sid, cityid, establish_date, revenue) VALUES ('LMN Industries', 'LMN Ind', '303 Maple St', 76543, 'No', 1005, 2001, 3004, 4005, TO_DATE('30-04-2003', 'DD-MM-YYYY'), 89432.76);
INSERT INTO companydetail (companyname, companyshortname, Address, zipcode, active, contactid, cid, sid, cityid, establish_date, revenue) VALUES ('RST Corporation', 'RST Corp', '404 Walnut St', 87654, 'Yes', 1006, 2001, 3004, 4006, TO_DATE('05-12-2001', 'DD-MM-YYYY'), 45236.54);
INSERT INTO companydetail (companyname, companyshortname, Address, zipcode, active, contactid, cid, sid, cityid, establish_date, revenue) VALUES ('JKL Enterprises', 'JKL Ent', '505 Oak St', 34567, 'Yes', 1007, 2002, 3005, 4007, TO_DATE('12-07-2008', 'DD-MM-YYYY'), 78451.32);
INSERT INTO companydetail (companyname, companyshortname, Address, zipcode, active, contactid, cid, sid, cityid, establish_date, revenue) VALUES ('DEF Ltd', 'DEF Ltd', '606 Pine St', 65432, 'No', 1008, 2002, 3005, 4008, TO_DATE('03-03-2006', 'DD-MM-YYYY'), 96325.78);
INSERT INTO companydetail (companyname, companyshortname, Address, zipcode, active, contactid, cid, sid, cityid, establish_date, revenue) VALUES ('GHI Co.', 'GHI Co', '707 Cedar St', 87654, 'Yes', 1009, 2002, 3005, 4008, TO_DATE('18-09-2004', 'DD-MM-YYYY'), 74125.63);
INSERT INTO companydetail (companyname, companyshortname, Address, zipcode, active, contactid, cid, sid, cityid, establish_date, revenue) VALUES ('MNO Corporation', 'MNO Corp', '808 Maple St', 23456, 'Yes', 1010, 2002, 3005, 4009, TO_DATE('22-11-2000', 'DD-MM-YYYY'), 65214.95);

INSERT INTO companydetail (companyname, companyshortname, Address, zipcode, active, contactid, cid, sid, cityid, establish_date, revenue) VALUES ('ABC Corporation', 'ABC Corp', '123 Main St', 12345, 'Yes', 1000, 2003, 3006, 4010, TO_DATE('01-01-2000', 'DD-MM-YYYY'), 92743.43);
INSERT INTO companydetail (companyname, companyshortname, Address, zipcode, active, contactid, cid, sid, cityid, establish_date, revenue) VALUES ('XYZ Industries', 'XYZ Ind', '456 Elm St', 54321, 'Yes', 1001, 2003, 3007, 4011, TO_DATE('15-03-2002', 'DD-MM-YYYY'), 58475.23);
INSERT INTO companydetail (companyname, companyshortname, Address, zipcode, active, contactid, cid, sid, cityid, establish_date, revenue) VALUES ('LMN Enterprises', 'LMN Ent', '789 Oak St', 67890, 'No', 1002, 2003, 3008, 4012, TO_DATE('20-05-2005', 'DD-MM-YYYY'), 102354.67);
INSERT INTO companydetail (companyname, companyshortname, Address, zipcode, active, contactid, cid, sid, cityid, establish_date, revenue) VALUES ('PQR Ltd', 'PQR Ltd', '101 Pine St', 98765, 'Yes', 1003, 2003, 3008, 4012, TO_DATE('10-10-2010', 'DD-MM-YYYY'), 75432.12);
INSERT INTO companydetail (companyname, companyshortname, Address, zipcode, active, contactid, cid, sid, cityid, establish_date, revenue) VALUES ('JKL Co.', 'JKL Co', '202 Cedar St', 23456, 'Yes', 1004, 2003, 3008, 4012, TO_DATE('25-08-2007', 'DD-MM-YYYY'), 62345.89);
INSERT INTO companydetail (companyname, companyshortname, Address, zipcode, active, contactid, cid, sid, cityid, establish_date, revenue) VALUES ('LMN Industries', 'LMN Ind', '303 Maple St', 76543, 'No', 1005, 2004, 3009, 4013, TO_DATE('30-04-2003', 'DD-MM-YYYY'), 89432.76);
INSERT INTO companydetail (companyname, companyshortname, Address, zipcode, active, contactid, cid, sid, cityid, establish_date, revenue) VALUES ('RST Corporation', 'RST Corp', '404 Walnut St', 87654, 'Yes', 1006, 2004, 3009, 4013, TO_DATE('05-12-2001', 'DD-MM-YYYY'), 45236.54);
INSERT INTO companydetail (companyname, companyshortname, Address, zipcode, active, contactid, cid, sid, cityid, establish_date, revenue) VALUES ('JKL Enterprises', 'JKL Ent', '505 Oak St', 34567, 'Yes', 1007, 2004, 3010, 4014, TO_DATE('12-07-2008', 'DD-MM-YYYY'), 78451.32);
INSERT INTO companydetail (companyname, companyshortname, Address, zipcode, active, contactid, cid, sid, cityid, establish_date, revenue) VALUES ('DEF Ltd', 'DEF Ltd', '606 Pine St', 65432, 'No', 1008, 2004, 3010, 4014, TO_DATE('03-03-2006', 'DD-MM-YYYY'), 96325.78);
INSERT INTO companydetail (companyname, companyshortname, Address, zipcode, active, contactid, cid, sid, cityid, establish_date, revenue) VALUES ('GHI Co.', 'GHI Co', '707 Cedar St', 87654, 'Yes', 1009, 2004, 3010, 4014, TO_DATE('18-09-2004', 'DD-MM-YYYY'), 74125.63);
INSERT INTO companydetail (companyname, companyshortname, Address, zipcode, active, contactid, cid, sid, cityid, establish_date, revenue) VALUES ('MNO Corporation', 'MNO Corp', '808 Maple St', 23456, 'Yes', 1010, 2004, 3010, 4014, TO_DATE('22-11-2000', 'DD-MM-YYYY'), 65214.95);
-- Add more INSERT statements for additional sample records





select * from  companydetail



--PACKAGE CREATION

CREATE OR REPLACE PACKAGE COMPANYDETAIL_PACKAGE AS
 PROCEDURE getCountry (OUT_COUNTRY OUT SYS_REFCURSOR);
 PROCEDURE getState (OUT_STATE OUT SYS_REFCURSOR);
 PROCEDURE getCity (OUT_CITY OUT SYS_REFCURSOR);
 PROCEDURE getAllCompany (OUT_ALLCOMPANY OUT SYS_REFCURSOR);
END COMPANYDETAIL_PACKAGE;

CREATE OR REPLACE PACKAGE BODY COMPANYDETAIL_PACKAGE AS
    PROCEDURE getCountry(OUT_COUNTRY OUT SYS_REFCURSOR) IS
        BEGIN 
            OPEN OUT_COUNTRY FOR
            select * from countrydetail;
        END getCountry;
        
    PROCEDURE getState(OUT_STATE OUT SYS_REFCURSOR) IS
        BEGIN 
            OPEN OUT_STATE FOR
            Select * from statedetail;
        END getState;
        
    PROCEDURE getCity(OUT_CITY OUT SYS_REFCURSOR) IS
        BEGIN 
            OPEN OUT_CITY FOR
            Select * from citydetail;
        END getCity;
        
    PROCEDURE getAllCompany(OUT_ALLCOMPANY OUT SYS_REFCURSOR) IS
        BEGIN 
            OPEN OUT_ALLCOMPANY FOR
            SELECT  cd.companyid, cd.companyname,  con.contact, cd.companyshortname,
            cd.address, cd.zipcode, cd.active, co.country, st.state, ci.city,cd.establish_date,cd.REVENUE
            FROM companydetail cd
            JOIN countrydetail co ON co.cid = cd.cid
            JOIN statedetail st ON st.sid = cd.sid
            JOIN citydetail ci ON ci.cityid = cd.cityid
            join contactdetail con On con.contactid = cd.contactid;
        END getAllCompany;
    
    
END COMPANYDETAIL_PACKAGE;



--INSERT PACKAGE

            
CREATE OR REPLACE PACKAGE company_management AS
    PROCEDURE insert_company_detail (
        p_contact IN VARCHAR2,
        p_companyname IN VARCHAR2,
        p_companyshortname IN VARCHAR2,
        p_address IN VARCHAR2,
        p_zipcode IN NUMBER,
        p_active IN VARCHAR2,
        p_cid IN NUMBER,
        p_sid IN NUMBER,
        p_cityid IN NUMBER,
        p_revenue IN NUMBER
    );
END company_management;
/

CREATE OR REPLACE PACKAGE BODY company_management AS
    PROCEDURE insert_company_detail (
        p_contact IN VARCHAR2,
        p_companyname IN VARCHAR2,
        p_companyshortname IN VARCHAR2,
        p_address IN VARCHAR2,
        p_zipcode IN NUMBER,
        p_active IN VARCHAR2,
        p_cid IN NUMBER,
        p_sid IN NUMBER,
        p_cityid IN NUMBER,
        p_revenue IN NUMBER
    ) IS
        v_contactid contactdetail.contactid%TYPE;
    BEGIN
        -- Insert into contactdetail table
        INSERT INTO contactdetail (contact) VALUES (p_contact);
        
        -- Retrieve the contactid using a SELECT statement
        SELECT contactid INTO v_contactid FROM contactdetail WHERE contact = p_contact;
        
        -- Insert into companydetail table using the retrieved contactid
        INSERT INTO companydetail (
            companyname,
            companyshortname,
            address,
            zipcode,
            active,
            contactid,
            cid,
            sid,
            cityid,
            revenue
        ) VALUES (
            p_companyname,
            p_companyshortname,
            p_address,
            p_zipcode,
            p_active,
            v_contactid,
            p_cid,
            p_sid,
            p_cityid,
            p_revenue
        );
    END insert_company_detail;
END company_management;
/




-- GET BY ID

CREATE OR REPLACE PACKAGE getcompany AS
PROCEDURE getcompanybyid(id IN NUMBER, OUT_COMPANY OUT SYS_REFCURSOR);

PROCEDURE update_company (
    p_contact         IN VARCHAR2,
    p_companyname     IN VARCHAR2,
    p_companyshortname IN VARCHAR2,
    p_address         IN VARCHAR2,
    p_zipcode         IN NUMBER,
    p_active          IN VARCHAR2,
    p_cid             IN NUMBER,
    p_sid             IN NUMBER,
    p_cityid          IN NUMBER,
    p_revenue         IN NUMBER,
    p_contactid       IN NUMBER
  );
END getcompany;

CREATE OR REPLACE PACKAGE BODY getcompany AS
  procedure getcompanybyid(id IN NUMBER, OUT_COMPANY OUT SYS_REFCURSOR) is 
  BEGIN 
    OPEN OUT_COMPANY for
    SELECT 
        cd.companyid, cd.companyname, con.contact,con.contactid, cd.companyshortname,
        cd.address, cd.zipcode, cd.active, co.country, st.state, ci.city,
        cd.establish_date, cd.REVENUE , cd.cid, cd.sid, cd.cityid
    FROM 
        companydetail cd
    JOIN 
        countrydetail co ON co.cid = cd.cid
    JOIN 
        statedetail st ON st.sid = cd.sid
    JOIN 
        citydetail ci ON ci.cityid = cd.cityid
    JOIN 
        contactdetail con ON con.contactid = cd.contactid
    WHERE cd.companyid = id;
  end getcompanybyid;
  
  
PROCEDURE update_company (
    p_contact         IN VARCHAR2,
    p_companyname     IN VARCHAR2,
    p_companyshortname IN VARCHAR2,
    p_address         IN VARCHAR2,
    p_zipcode         IN NUMBER,
    p_active          IN VARCHAR2,
    p_cid             IN NUMBER,
    p_sid             IN NUMBER,
    p_cityid          IN NUMBER,
    p_revenue         IN NUMBER,
    p_contactid       IN NUMBER,
     p_currencyid     IN NUMBER
  ) IS
  BEGIN
    -- Update company details
    UPDATE companydetail
    SET
      companyname       = p_companyname,
      companyshortname  = p_companyshortname,
      address           = p_address,
      zipcode           = p_zipcode,
      active            = p_active,
      cid               = p_cid,
      sid               = p_sid,
      cityid            = p_cityid,
      revenue           = p_revenue,
      currencyid        =P_currencyid
    WHERE
      contactid = p_contactid;

    -- Update contact details
    UPDATE contactdetail
    SET
      contact = p_contact
    WHERE
      contactid = p_contactid;
  END update_company;
end getcompany;

drop package update_company

-- Update Package


drop package getcompany;



update companydetail set
companyname = 'companyname',
companyshortname = 'companyshortname',
address = 'address',
zipcode = 'zipcode',
active = 'active',
cid = 'cid',
sid = 'sid',
cityid = 'cityid',
revenue = 'revenue'
(update contactdetail set contact='contact' where contactid = 'contactid')




SELECT 
    cd.companyid, cd.companyname, con.contact, cd.companyshortname,
    cd.address, cd.zipcode, cd.active, co.country, st.state, ci.city,
    cd.establish_date, cd.REVENUE,
    COUNT(*) OVER() AS total_records
    
FROM 
    companydetail cd
JOIN 
    countrydetail co ON co.cid = cd.cid
JOIN 
    statedetail st ON st.sid = cd.sid
JOIN 
    citydetail ci ON ci.cityid = cd.cityid
JOIN 
    contactdetail con ON con.contactid = cd.contactid
    
WHERE  
    (
        lower(country) like lower('%co%') OR
        lower(companyname) like lower('%co%') OR
        lower(contact) like lower('%co%') OR
        lower(companyshortname) like lower('%co%') OR
        lower(address) like lower('%co%') OR
        lower(zipcode) like lower('%co%') OR
        lower(state) like lower('%co%') OR
        lower(city) like lower('%co%') OR
        lower(establish_date) like lower('%co%') OR
        lower(REVENUE) like lower('%co%')
    )
    AND
    lower(country) like lower('%india%')
    AND 
    co.cid IN (2000) 
    AND st.sid IN (3000,3001,3002) 
    AND ci.cityid IN (4000,4001,4002,4003)
    
ORDER BY ci.city;




SELECT 
    cd.companyid, cd.companyname, con.contact, cd.companyshortname,
    cd.address, cd.zipcode, cd.active, co.country, st.state, ci.city,
    cd.establish_date, cd.REVENUE,
    COUNT(*) OVER() AS total_records
    
FROM 
    companydetail cd
JOIN 
    countrydetail co ON co.cid = cd.cid
JOIN 
    statedetail st ON st.sid = cd.sid
JOIN 
    citydetail ci ON ci.cityid = cd.cityid
JOIN 
    contactdetail con ON con.contactid = cd.contactid
    
WHERE  
    (
        lower(country) like lower('%india%') AND
        (
            lower(country) like lower('%co%') OR
            lower(companyname) like lower('%co%') OR
            lower(contact) like lower('%co%') OR
            lower(companyshortname) like lower('%co%') OR
            lower(address) like lower('%co%') OR
            lower(zipcode) like lower('%co%') OR
            lower(state) like lower('%co%') OR
            lower(city) like lower('%co%') OR
            lower(establish_date) like lower('%co%') OR
            lower(REVENUE) like lower('%co%')
        )
    )
    AND 
    co.cid IN (2000) 
    AND st.sid IN (3000,3001,3002) 
    AND ci.cityid IN (4000,4001,4002,4003)
    
ORDER BY ci.city;



--BUdget detail




CREATE TABLE budgetdetail (
    budgetid INT GENERATED BY DEFAULT AS IDENTITY (START WITH 7400 INCREMENT BY 1) PRIMARY KEY,
    description VARCHAR(20),
    currency VARCHAR(10),
    active VARCHAR(5),
    createdate DATE,
    companyid INT,
    CONSTRAINT fk_compid_budget FOREIGN KEY (companyid) REFERENCES companydetail(companyid)
);


select * from budgetdetail


CREATE OR REPLACE PACKAGE budget_package AS
PROCEDURE getBudgetData(OUT_BUDGET OUT SYS_REFCURSOR);
END budget_package;

CREATE OR REPLACE PACKAGE BODY budget_package AS
    procedure getBudgetData(OUT_BUDGET OUT SYS_REFCURSOR) IS
    BEGIN 
    OPEN OUT_BUDGET FOR 
    SELECT * FROM BUDGETDETAIL;
    END getBudgetData;
END budget_package;

INSERT INTO budgetdetail (
    description,
    currency,
    active,
    createdate,
    companyid
) VALUES (
    'Sample Budget',
    'INR',
    'True', 
    TO_DATE('2024-05-02', 'YYYY-MM-DD'),
    1
);


SELECT 
    b.budgetid, b.description, b.currency,
    b.startamount, b.limitamount, b.active,
    b.createdate, b.manhour, b.containertype,
    b.containersize, c.companyid,
    COUNT(*) OVER() AS total_records
    
FROM 
    budgetdetail b
JOIN 
    companydetail c ON c.companyid = b.companyid
    
WHERE  
    (
        LOWER(currency) LIKE LOWER('%u%') AND
        (
            LOWER(b.description) LIKE LOWER('%co%') OR
            LOWER(b.currency) LIKE LOWER('%u%') OR
            LOWER(b.containertype) LIKE LOWER('%co%') OR
            LOWER(TO_CHAR(b.createdate, 'YYYY-MM-DD')) LIKE LOWER('%co%') OR
            LOWER(b.active) LIKE LOWER('%co%') OR
            LOWER(TO_CHAR(b.startamount)) LIKE LOWER('%co%') OR
            LOWER(TO_CHAR(b.limitamount)) LIKE LOWER('%co%') OR
            LOWER(TO_CHAR(b.manhour)) LIKE LOWER('%co%') OR
            LOWER(TO_CHAR(b.containersize)) LIKE LOWER('%co%')
        )
    )
    
ORDER BY currency;

select * from budgetdetail where
LOWER(createdate) LIKE LOWER('%2%');

update companydetail set budgetid = 7400 where companyid = 1
    


alter table companydetail drop column budgetid


select * from budgetdetail


CREATE TABLE budgetdetailline (
    budgetdetailid INT GENERATED BY DEFAULT AS IDENTITY (START WITH 8500 INCREMENT BY 1) PRIMARY KEY,
    startamount INT,
      limitamount INT,
    manhour  INT,
    containertype VARCHAR(20),
    containersize int,
    budgetid int,
    CONSTRAINT fk_compid_budgetdeatil FOREIGN KEY (budgetid) REFERENCES budgetdetail(budgetid)
);




INSERT INTO budgetdetailline (
    startamount,
    limitamount,
    manhour,
    containertype,
    containersize,
    budgetid
) VALUES (
    1000,
    3000,
    15,
    'General Purpose ',
    22,
    7401
);
INSERT INTO budgetdetailline (
    startamount,
    limitamount,
    manhour,
    containertype,
    containersize,
    budgetid
) VALUES (
    2000,
    6000,
    20,
    'Refrigerated  ',
    20,
    7401
);


select * from budgetdetailline


SELECT c.cid AS CountryId, c.country AS CountryName, 
       s.sid AS StateId, s.state AS StateName,
       ci.cityid, ci.city as CityName
FROM countrydetail c
JOIN statedetail s ON s.cid = c.cid
JOIN citydetail ci ON ci.cid = c.cid;

SELECT c.cid AS CountryId, c.country AS CountryName, 
               s.sid AS StateId, s.state AS StateName,
               ci.cityid AS CityId, ci.city AS CityName
        FROM countrydetail c
        JOIN statedetail s ON s.cid = c.cid
        JOIN citydetail ci ON ci.sid = s.sid


select * from citydetail



CREATE TABLE currencydetail(
currencyid INT GENERATED BY DEFAULT AS IDENTITY (START WITH 100 INCREMENT BY 1) PRIMARY KEY,
currency varchar(3)
)

insert into currencydetail(currency) values ('NOK')

select * from currencydetail

select * from companydetail


alter table companydetail add currencyid int

UPDATE companydetail
SET currencyid = 100



SELECT 
                        cd.companyid, cd.companyname, con.contact, cd.companyshortname,
                        cd.address, cd.zipcode, cd.active, co.country, st.state, ci.city,
                        cd.establish_date, cd.REVENUE,cu.currency,
                        COUNT(*) OVER() AS total_records
                        FROM 
                            companydetail cd
                        JOIN 
                            countrydetail co ON co.cid = cd.cid
                        JOIN 
                            statedetail st ON st.sid = cd.sid
                        JOIN 
                            citydetail ci ON ci.cityid = cd.cityid
                        JOIN 
                            contactdetail con ON con.contactid = cd.contactid
                        JOIN
                            currencydetail cu on cu.currencyid = cd.currencyid



