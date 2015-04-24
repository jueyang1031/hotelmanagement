CREATE TABLE FACILITYCONFIG(
id INT AUTO_INCREMENT,
facilityName VARCHAR(255),
description VARCHAR(255),
PRIMARY KEY(id));

CREATE TABLE AMENITYCONFIG(
id INT AUTO_INCREMENT,
amenityName VARCHAR(255),
description VARCHAR(255),
PRIMARY KEY(id));

CREATE TABLE SERVICECONFIG(
id INT AUTO_INCREMENT,
serviceName VARCHAR(255),
description VARCHAR(255),
PRIMARY KEY(id));

CREATE TABLE HOTELBOOKING.RESERVATION(
id INT AUTO_INCREMENT,
checkinDate DATE,
checkoutDate DATE,
description VARCHAR(255),
guestNumber INT,
ifCheckin BOOLEAN,
orderNo VARCHAR(255),
totalPrice FLOAT,
roomAmount INT,
cId INT,
rId INT,
PRIMARY KEY(id),
FOREIGN KEY(cId) REFERENCES CUSTOMER(id),
FOREIGN KEY(rId) REFERENCES ROOMTYPE(id));


CREATE TABLE HOTELBOOKING.occupier(
id INT AUTO_INCREMENT,
occupiedDate DATE,
rtId INT,
PRIMARY KEY(id),
FOREIGN KEY(rtId) references ROOMTYPE(id));



CREATE TABLE HOTELBOOKING.FACILITY(
id INT AUTO_INCREMENT,
rtId INT,
fcId INT,
PRIMARY KEY(id),
FOREIGN KEY(rtId) references ROOMTYPE(id),
FOREIGN KEY(fcId) references FACILITYCONFIG(id));



CREATE TABLE HOTELBOOKING.AMENITY(
id INT auto_increment,
ifCharge VARCHAR(255),
openTime VARCHAR(255),
hId INT,
acId INT,
PRIMARY KEY(id),
FOREIGN KEY(hId) REFERENCES HOTEL(id),
FOREIGN KEY(acId) REFERENCES AMENITYCONFIG(id));



CREATE TABLE HOTELBOOKING.ROOMTYPE(
id INT AUTO_INCREMENT,
capacity INT,
description VARCHAR(255),
price FLOAT,
typeName VARCHAR(255),
imageURL VARCHAR(255),
hId INT,
PRIMARY KEY(id),
FOREIGN KEY(hId) REFERENCES HOTEL(id));




CREATE TABLE HOTELBOOKING.SURROUNDING(
id INT auto_increment,
description VARCHAR(255),
distance FLOAT,
surroundingName VARCHAR(255),
hId INT,
PRIMARY KEY(id),
FOREIGN KEY(hId) REFERENCES HOTEL(id));



CREATE TABLE HOTELBOOKING.SERVICE(
id INT AUTO_INCREMENT,
ifCharge VARCHAR(255),
hId INT,
scId INT,
PRIMARY KEY(id),
FOREIGN KEY(hId) REFERENCES HOTEL(id),
FOREIGN KEY(scId) REFERENCES SERVICECONFIG(id));



CREATE TABLE HOTELBOOKING.HOTEL(
id INT AUTO_INCREMENT,
address VARCHAR(255),
checkinTime VARCHAR(255),
checkoutTime VARCHAR(255),
city VARCHAR(255),
country VARCHAR(255),
description VARCHAR(255),
hotelName VARCHAR(255),
rating INT,
star INT,
state VARCHAR(255),
huId INT,
PRIMARY KEY(id),
FOREIGN KEY(huId) references HOTELUSER(id));



CREATE TABLE HOTELBOOKING.ADMIN(
id INT AUTO_INCREMENT,
password VARCHAR(255),
sponsorAccount VARCHAR(255),
username VARCHAR(255) NOT null,
PRIMARY KEY(id));


CREATE TABLE HOTELBOOKING.HOTELUSER(
id INT AUTO_INCREMENT,
password VARCHAR(255),
regDate DATE,
ssn VARCHAR(255),
username VARCHAR(255) NOT NULL,
PRIMARY KEY(id));



CREATE TABLE HOTELBOOKING.CUSTOMER(
id INT AUTO_INCREMENT,
firstName VARCHAR(255),
lastName VARCHAR(255),
password VARCHAR(255),
regDate DATE,
telephone VARCHAR(255),
username VARCHAR(255) NOT NULL,
PRIMARY KEY(id));