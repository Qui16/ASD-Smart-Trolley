/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  quyda
 * Created: 09/09/2021
 */

CREATE TABLE Customer (
"Customer ID" int not null GENERATED ALWAYS AS IDENTITY (START WITH 1000,  INCREMENT BY 1),
"Customer Email" varchar(255) not null,
"Customer Password" varchar(255) not null,
"Customer Firstname" varchar(255) not null,
"Customer Lastname" varchar(255) not null,
"Customer PhoneNum" varchar(255) not null,
"Customer Address" varchar(255) not null,
"Customer DOB" date ,
primary key ("Customer ID")
);