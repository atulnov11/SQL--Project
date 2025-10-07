-- Database Creation --

create database flight_analysis;

-- creating table for meta_data----

CREATE TABLE meta_data (
    PASSENGERS             INT,
    FREIGHT                INT,   -- contains 'Null' as text, so better keep as string unless cleaned
    MAIL                   INT,
    DISTANCE               INT,
    UNIQUE_CARRIER         VARCHAR(10),
    AIRLINE_ID             INT,
    UNIQUE_CARRIER_NAME    VARCHAR(100),
    UNIQUE_CARRIER_ENTITY  VARCHAR(50),
    REGION                 VARCHAR(10),
    CARRIER                VARCHAR(10),
    CARRIER_NAME           VARCHAR(100),
    CARRIER_GROUP          INT,
    CARRIER_GROUP_NEW      INT,
    ORIGIN_AIRPORT_ID      INT,
    ORIGIN_AIRPORT_SEQ_ID  INT,
    ORIGIN_CITY_MARKET_ID  INT,
    ORIGIN                 VARCHAR(10),
    ORIGIN_CITY_NAME       VARCHAR(100),
    ORIGIN_STATE_ABR       VARCHAR(10),
    ORIGIN_STATE_FIPS      INT,
    ORIGIN_STATE_NM        VARCHAR(50),
    ORIGIN_WAC             INT,
    DEST_AIRPORT_ID        INT,
    DEST_AIRPORT_SEQ_ID    INT,
    DEST_CITY_MARKET_ID    INT,
    DEST                   VARCHAR(10),
    DEST_CITY_NAME         VARCHAR(100),
    DEST_STATE_ABR         VARCHAR(10),
    DEST_STATE_FIPS        INT,
    DEST_STATE_NM          VARCHAR(50),
    DEST_WAC               INT,
    YEAR                   INT,
    QUARTER                INT,
    MONTH                  INT,
    DISTANCE_GROUP         INT,
    CLASS                  VARCHAR(10)
);


-- bulk insert into the table --

SHOW VARIABLES LIKE 'local_infile';

set	global local_infile=1;

SHOW VARIABLES LIKE 'local_infile';

SHOW VARIABLES LIKE 'secure_file_priv';

LOAD DATA LOCAL INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Airport_Project_Data.csv'
into table meta_Data
fields terminated by ',' enclosed by '"'
lines terminated  by '\n'
IGNORE 1 LINES
(
    PASSENGERS,
    FREIGHT,
    MAIL,
    DISTANCE,
    UNIQUE_CARRIER,
    AIRLINE_ID,
    UNIQUE_CARRIER_NAME,
    UNIQUE_CARRIER_ENTITY,
    REGION,
    CARRIER,
    CARRIER_NAME,
    CARRIER_GROUP,
    CARRIER_GROUP_NEW,
    ORIGIN_AIRPORT_ID,
    ORIGIN_AIRPORT_SEQ_ID,
    ORIGIN_CITY_MARKET_ID,
    ORIGIN,
    ORIGIN_CITY_NAME,
    ORIGIN_STATE_ABR,
    ORIGIN_STATE_FIPS,
    ORIGIN_STATE_NM,
    ORIGIN_WAC,
    DEST_AIRPORT_ID,
    DEST_AIRPORT_SEQ_ID,
    DEST_CITY_MARKET_ID,
    DEST,
    DEST_CITY_NAME,
    DEST_STATE_ABR,
    DEST_STATE_FIPS,
    DEST_STATE_NM,
    DEST_WAC,
    YEAR,
    QUARTER,
    MONTH,
    DISTANCE_GROUP,
    CLASS
);

SHOW WARNINGS LIMIT 20;

select * from meta_Data;
select count(PASSENGERS) from meta_data;
-- Relational Table creation --
CREATE TABLE Airline (
    AIRLINE_ID INT PRIMARY KEY,
    UNIQUE_CARRIER VARCHAR(10),
    UNIQUE_CARRIER_NAME VARCHAR(100),
    UNIQUE_CARRIER_ENTITY VARCHAR(10)
);

CREATE TABLE Airport (
    AIRPORT_ID INT PRIMARY KEY,
    AIRPORT_SEQ_ID INT,
    CITY_MARKET_ID INT,
    AIRPORT_CODE VARCHAR(10),
    CITY_NAME VARCHAR(100),
    STATE_ABR CHAR(2),
    STATE_FIPS INT,
    STATE_NM VARCHAR(100),
    WAC INT
);


CREATE TABLE Flight (
    FLIGHT_ID INT AUTO_INCREMENT PRIMARY KEY,
    AIRLINE_ID INT,
    ORIGIN_AIRPORT_ID INT,
    DEST_AIRPORT_ID INT,
    DISTANCE FLOAT,
    DISTANCE_GROUP INT,
    YEAR INT,
    QUARTER INT,
    MONTH INT,
    CLASS CHAR(1),
    FOREIGN KEY (AIRLINE_ID) REFERENCES  airline(AIRLINE_ID),
    FOREIGN KEY (ORIGIN_AIRPORT_ID) REFERENCES airport(AIRPORT_ID),
    FOREIGN KEY (DEST_AIRPORT_ID) REFERENCES Airport(AIRPORT_ID)
);


CREATE TABLE FlightMetrics (
    FLIGHT_ID INT,
    PASSENGERS FLOAT,
    FREIGHT FLOAT,
    MAIL FLOAT,
    FOREIGN KEY (FLIGHT_ID) REFERENCES Flight(FLIGHT_ID)
);


Alter table FlightMetrics
modify PASSENGERS int;

CREATE TABLE City (
	City_id INT AUTO_INCREMENT PRIMARY KEY,
    CityName VARCHAR(100),
    STATE_ABR CHAR(2),
    State_NM varchar(100) 
);
    

