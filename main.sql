

create table if not exists supplier(
  SUPP_ID int primary key,
  SUPP_NAME varchar(50),
  SUPP_CITY varchar(50),
  SUPP_PHONE varchar(10)
);

INSERT INTO supplier (SUPP_ID, SUPP_NAME, SUPP_CITY,SUPP_PHONE) VALUES (1,"Rajesh Retails","Delhi",1234567890);
INSERT INTO supplier (SUPP_ID, SUPP_NAME, SUPP_CITY,SUPP_PHONE) VALUES (2,"Appario Ltd.","Mumbai",2589631470);
INSERT INTO supplier (SUPP_ID, SUPP_NAME, SUPP_CITY,SUPP_PHONE) VALUES (3,"Knome products","Banglore",9785462315);
INSERT INTO supplier (SUPP_ID, SUPP_NAME, SUPP_CITY,SUPP_PHONE) VALUES (4,"Bansal Retails","Kochi",8975463285);
INSERT INTO supplier (SUPP_ID, SUPP_NAME, SUPP_CITY,SUPP_PHONE) VALUES (5,"Mittal Ltd.","Lucknow",7898456532);

SELECT * FROM supplier;

create table if not exists customer(
  CUS_ID int not null,
  CUS_NAME varchar(20) null default null,
  CUS_PHONE VARCHAR(10),
  CUS_CITY varchar(30),
  CUS_GENDER char,
  PRIMARY KEY(CUS_ID)
);


INSERT INTO customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) VALUES (1,"AAKASH",9999999999,"DELHI","M");
INSERT INTO customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) VALUES (2,"AMAN",9785463215,"NOIDA","M");
INSERT INTO customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) VALUES (3,"NEHA",9999999999,"MUMBAI","F");
INSERT INTO customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) VALUES (4,"MEGHA",9994562399,"KOLKATA","F");
INSERT INTO customer (CUS_ID, CUS_NAME, CUS_PHONE, CUS_CITY, CUS_GENDER) VALUES (5,"PULKIT",7895999999,"LUCKNOW","M");

SELECT * FROM customer;

CREATE TABLE IF NOT EXISTS category(
  CAT_ID INT NOT NULL,
  CAT_NAME VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`CAT_ID`)
  );

INSERT INTO category (CAT_ID, CAT_NAME) VALUES ( 1,"BOOKS");
INSERT INTO category (CAT_ID, CAT_NAME) VALUES (2,"GAMES");
INSERT INTO category (CAT_ID, CAT_NAME) VALUES (3,"GROCERIES");
INSERT INTO category (CAT_ID, CAT_NAME) VALUES (4,"ELECTRONICS");
INSERT INTO category (CAT_ID, CAT_NAME) VALUES (5,"CLOTHES");

select * from category;

CREATE TABLE IF NOT EXISTS product (
  PRO_ID INT NOT NULL,
  PRO_NAME VARCHAR(20) NULL DEFAULT NULL,
  PRO_DESC VARCHAR(60) NULL DEFAULT NULL,
  CAT_ID INT NOT NULL,
  PRIMARY KEY (PRO_ID),
  FOREIGN KEY (CAT_ID) REFERENCES category (CAT_ID)
  );

INSERT INTO product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) VALUES (1,"GTA V","DFJDJFDJFDJFDJFJF",2);
INSERT INTO product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) VALUES (2,"TSHIRT","DFDFJDFJDKFD",5);
INSERT INTO product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) VALUES (3,"ROG LAPTOP","DFNTTNTNTERND",4);
INSERT INTO product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) VALUES (4,"OATS","REURENTBTOTH",3);
INSERT INTO product (PRO_ID, PRO_NAME, PRO_DESC, CAT_ID) VALUES (5,"HARRY POTTER","NBEMCTHTJTH",1);

select * from product;

CREATE TABLE IF NOT EXISTS product_details (
  PROD_ID INT NOT NULL,
  PRO_ID INT NOT NULL,
  SUPP_ID INT NOT NULL,
  PROD_PRICE INT NOT NULL,
  PRIMARY KEY (PROD_ID),
  FOREIGN KEY (PRO_ID) REFERENCES product (PRO_ID),
  FOREIGN KEY (SUPP_ID) REFERENCES supplier (SUPP_ID)
  );

INSERT INTO product_details (PROD_ID, PRO_ID, SUPP_ID, PROD_PRICE) VALUES (1,1,2,1500);
INSERT INTO product_details (PROD_ID, PRO_ID, SUPP_ID, PROD_PRICE) VALUES (2,3,5,30000);
INSERT INTO product_details (PROD_ID, PRO_ID, SUPP_ID, PROD_PRICE) VALUES (3,5,1,3000);
INSERT INTO product_details (PROD_ID, PRO_ID, SUPP_ID, PROD_PRICE) VALUES (4,2,3,2500);
INSERT INTO product_details (PROD_ID, PRO_ID, SUPP_ID, PROD_PRICE) VALUES (5,4,1,1000);

SELECT * FROM product_details;

CREATE TABLE IF NOT EXISTS order (
  ORD_ID INT NOT NULL,
  ORD_AMOUNT INT NOT NULL,
  ORD_DATE DATE,
  CUS_ID INT NOT NULL,
  PROD_ID INT NOT NULL,
  PRIMARY KEY (ORD_ID),
  FOREIGN KEY (CUS_ID) REFERENCES customer (CUS_ID),
  FOREIGN KEY (PROD_ID) REFERENCES product_details(PROD_ID)
  );

INSERT INTO order (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PROD_ID) VALUES (50,2000,"2021-10-06",2,1);
INSERT INTO order (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PROD_ID) VALUES (20,1500,"2021-10-12",3,5);
INSERT INTO order (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PROD_ID) VALUES (25,30500,"2021-09-16",5,2);
INSERT INTO order (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PROD_ID) VALUES (26,2000,"2021-10-05",1,1);
INSERT INTO order (ORD_ID, ORD_AMOUNT, ORD_DATE, CUS_ID, PROD_ID) VALUES (30,3500,"2021-08-16",4,3);

SELECT * FROM order;

CREATE TABLE IF NOT EXISTS rating (
  RAT_ID INT NOT NULL,
  CUS_ID INT NOT NULL,
  SUPP_ID INT NOT NULL,
  RAT_RATSTARS INT NOT NULL,
  PRIMARY KEY (RAT_ID),
  FOREIGN KEY (SUPP_ID) REFERENCES supplier (SUPP_ID),
  FOREIGN KEY (CUS_ID) REFERENCES customer (CUS_ID)
  );

INSERT INTO rating (RAT_ID, CUS_ID, SUPP_ID, RAT_RATSTARS) VALUES (1,2,2,4);
INSERT INTO rating (RAT_ID, CUS_ID, SUPP_ID, RAT_RATSTARS) VALUES (2,3,4,3);
INSERT INTO rating (RAT_ID, CUS_ID, SUPP_ID, RAT_RATSTARS) VALUES (3,5,1,5);
INSERT INTO rating (RAT_ID, CUS_ID, SUPP_ID, RAT_RATSTARS) VALUES (4,1,3,2);
INSERT INTO rating (RAT_ID, CUS_ID, SUPP_ID, RAT_RATSTARS) VALUES (5,4,5,4);

SELECT * FROM rating;

select customer.cus_gender, count(customer.cus_gender) as count
from customer
inner join `order`
on customer.cus_id= `order`.cus_id
where `order`.ord_amount>=3000
group by customer.cus_gender;

select `order`.*,product.pro_name 
from `order` ,product_details,product 
where `order`.cus_id=2 and `order`.prod_id=product_details.prod_id and product_details.pro_id=product.pro_id;


select supplier.*
from supplier, product_details
where supplier.supp_id in (
	select product_details.supp_id
	from product_details
    group by product_details.supp_id
    having count(product_details.supp_id) > 1
	)
group by supplier.supp_id;

select supplier.*
from supplier, product_details
where supplier.supp_id in (
	select product_details.supp_id
	from product_details
    group by product_details.supp_id
    having count(product_details.supp_id) > 1
	)
group by supplier.supp_id;


select product.pro_id, product.pro_name, `order`.ord_id
from `order`
inner join product_details
on product_details.prod_id = `order`.prod_id
inner join product
on product.pro_id = product_details.pro_id
where `order`.ORD_DATE > "2021-10-05";


select cus_name,cus_gender from customer 
where  ( customer.CUS_NAME like 'A%') OR ( customer.CUS_NAME like '%A');


DELIMITER &&
CREATE PROCEDURE proc()
BEGIN
select supplier.supp_id, supplier.supp_name, rating.rat_ratstars,
case 
	when rating.rat_ratstars > 4 THEN 'GENUINE SUPPLIER'
    when rating.rat_ratstars > 2 THEN 'AVERAGE SUPPLIER'
    ELSE 'Supplier should not be considered'
END AS verdict from rating inner join supplier on supplier.supp_id=rating.supp_id;
END &&
DELIMITER ; 

call proc();



