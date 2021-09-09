/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  quyda
 * Created: 09/09/2021
 */

CREATE TABLE Items (
"Item ID" int not null GENERATED ALWAYS AS IDENTITY (START WITH 1000,  INCREMENT BY 1),
"Item Name" varchar(255) not null,
"Item Price" float not null,
"Item Quantity" int not null,
"Item ReceivedDate" date ,
"Item Region" varchar(255),
"Item Description" varchar(255),
"Item Photo" nvarchar(100),
"Photo Data" varbinary(max),
primary key ("Item ID")

);