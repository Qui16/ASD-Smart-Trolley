CREATE TABLE "ORDERS" (
    ORDER_ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 100, INCREMENT BY 1),
    TOTAL_PRICE DOUBLE NOT NULL,
    ORDER_DATE VARCHAR(255) NOT NULL,
    PRIMARY KEY(ORDER_ID)
);

CREATE TABLE "PAYMENT" (
    PAY_ID INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY(START WITH 100, INCREMENT BY 1),
    ORDER_ID INTEGER NOT NULL,
    PAYMENT_METHOD VARCHAR(255) NOT NULL,
    TOTAL_PRICE DOUBLE NOT NULL,
    CREDIT_CARD_NO VARCHAR(255) NOT NULL,
    EXPIRY_DATE VARCHAR(255) NOT NULL,
    SECURITY_NO VARCHAR(255) NOT NULL,
    OWNER_NAME VARCHAR(255) NOT NULL,
    DATE_PAID VARCHAR(255) NOT NULL,
    PRIMARY KEY(PAY_ID),
    CONSTRAINT PAYMENT_FK FOREIGN KEY (ORDER_ID) REFERENCES "ORDERS"(ORDER_ID) ON DELETE CASCADE
);

CREATE TABLE Items (
"Item ID" int not null ,
"Item Name" varchar(255) not null,
"Item Price" float not null,
"Item Quantity" int not null,
"Item ReceivedDate" date ,
"Item Region" varchar(255),
"Item Description" varchar(255),
primary key ("Item ID")
);

CREATE TABLE Customer (
"Customer ID" int not null GENERATED ALWAYS AS IDENTITY (START WITH 1000,  INCREMENT BY 1),
"Customer Email" varchar(255) not null,
"Customer Password" varchar(255) not null,
"Customer Firstname" varchar(255) ,
"Customer Lastname" varchar(255) ,
"Customer PhoneNum" varchar(255) ,
"Customer Address" varchar(255) ,
"Customer DOB" date ,
"Customer Point" int,
primary key ("Customer ID")
);

CREATE TABLE Staff (
"Staff ID" int not null GENERATED ALWAYS AS IDENTITY (START WITH 1000,  INCREMENT BY 1),
"Staff Email" varchar(255) not null,
"Staff Password" varchar(255) not null,
"Staff Firstname" varchar(255) ,
"Staff Lastname" varchar(255) ,
"Staff PhoneNum" varchar(255) ,
"Staff Address" varchar(255) ,
"Staff DOB" date ,
"Staff Role" varchar(255),
primary key ("Staff ID")
);

CREATE TABLE "PAYMENT_HISTORY" (
    CUSTOMER_ID INTEGER NOT NULL,
    PAY_ID INTEGER NOT NULL,
    ORDER_ID INTEGER NOT NULL,
    PAYMENT_METHOD VARCHAR(255) NOT NULL,
    ORDER_LINE_PRICE DOUBLE NOT NULL,
    CREDIT_CARD_NO VARCHAR(255) NOT NULL,
    OWNER_NAME VARCHAR(255) NOT NULL,
    DATE_PAID VARCHAR(255) NOT NULL,
    CONSTRAINT HISTORY_FK FOREIGN KEY (CUSTOMER_ID) REFERENCES "CUSTOMER"("Customer ID") ON DELETE CASCADE,
    CONSTRAINT HISTORY_FK2 FOREIGN KEY (PAY_ID) REFERENCES PAYMENT(PAY_ID) ON DELETE CASCADE
);