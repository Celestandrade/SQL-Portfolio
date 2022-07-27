/**********************************************************/
/*Script Name: Relias Healthcare Data Definition Language (DDL) Script*/
/*Author: Celest Andrade*/
/*********************************************************/

-- Note: Some of the data used in this DDL script was taken from the Relias --
-- Healthcare website. The provider hire data and salary data are not actual. --

/****************/
/*Create Tables*/
/**************/

CREATE TABLE facilities (
facility_id INTEGER PRIMARY KEY,
facility_name VARCHAR(75),
facility_address TEXT,
facility_city VARCHAR(25),
facility_state VARCHAR(2),
facility_zip INTEGER);

CREATE TABLE providers (
provider_id SERIAL PRIMARY KEY,
first_name VARCHAR(25),
last_name VARCHAR(50),
title VARCHAR(25),
facility_id INTEGER,
hire_date DATE,
salary INTEGER);

/***************************/
/*Establishing Foreign Keys*/
/*************************/

ALTER TABLE providers
ADD CONSTRAINT fk_facility
FOREIGN KEY(facility_id)
REFERENCES facilities(facility_id);

/*************************************/
/*Insert Data Into Facilitites Table*/
/***********************************/

INSERT INTO facilities
VALUES
(101, 'Forrest General Hospital', '6051 US 49', 'Hattiesburg', 'MS', 39401),
(102, 'North Mississippi Medical Center Amory', '1105 Earl Frye Blvd', 'Amory', 'MS', 38821),
(103, 'North Mississippi Medical Center Pontotoc', '176 S Main St', 'Pontotoc', 'MS', 38863),
(104, 'North Mississippi Medical Center Tupelo', '830 S Gloster St', 'Tupelo', 'MS', 38801),
(105, 'North Mississippi Medical Center West Point', '150 Medical Center Dr', 'West Point', 'MS', 39773),
(106, 'DCH Fayette', '1653 Temple Ave N', 'Fayette', 'AL', 35555),
(107, 'DCH Northport', '2700 Hospital Dr', 'Northport', 'AL', 35476),
(108, 'DCH Regional Medical Center', '809 University Blvd E', 'Tuscaloosa', 'AL', 35401),
(109, 'North Mississippi Medical Center Hamilton', '1256 Military St S', 'Hamilton', 'AL', 35570);

SELECT * FROM facilities;

facility_id |                facility_name                |   facility_address    | facility_city | facility_state | facility_zip
-------------+---------------------------------------------+-----------------------+---------------+----------------+--------------
        101 | Forrest General Hospital                    | 6051 US 49            | Hattiesburg   | MS             |        39401
        102 | North Mississippi Medical Center Amory      | 1105 Earl Frye Blvd   | Amory         | MS             |        38821
        103 | North Mississippi Medical Center Pontotoc   | 176 S Main St         | Pontotoc      | MS             |        38863
        104 | North Mississippi Medical Center Tupelo     | 830 S Gloster St      | Tupelo        | MS             |        38801
        105 | North Mississippi Medical Center West Point | 150 Medical Center Dr | West Point    | MS             |        39773
        106 | DCH Fayette                                 | 1653 Temple Ave N     | Fayette       | AL             |        35555
        107 | DCH Northport                               | 2700 Hospital Dr      | Northport     | AL             |        35476
        108 | DCH Regional Medical Center                 | 809 University Blvd E | Tuscaloosa    | AL             |        35401
        109 | North Mississippi Medical Center Hamilton   | 1256 Military St S    | Hamilton      | AL             |        35570

/***********************************/
/*Insert Data Into Providers Table*/
/*********************************/

INSERT INTO providers (first_name, last_name, title, facility_id, hire_date, salary)
VALUES
('Adeniyi', 'Koiki', 'MD', 104, '2021-12-16', 200000),
('Matthew', 'Harris', 'FNP', 101, '2018-02-07', 105000),
('Heather', 'Evans', 'DO', 101, '2020-09-01', 168000),
('Griffen', 'Sharpe', 'MD', 106, '2022-01-20', 180000),
('Malorie', 'Devaughn', 'ACNPC', 109, '2021-01-31', 98000),
('Cole', 'Young', 'MD', 101, '2022-07-01', 168000),
('Christopher', 'Billsby', 'DO', 105, '2019-03-21', 177000),
('Jimmy', 'Tu', 'MD', 109, '2020-09-05', 204000),
('Christopher', 'Mann', 'MD', 103, '2020-05-27', 172000),
('Michael', 'Farmer', 'DO', 102, '2018-12-09', 150000),
('Jordan', 'Steele', 'DO', 101, '2022-03-02', 166000),
('John', 'Newcomb', 'MD', 106, '2019-01-30', 180000),
('Courtney', 'Sessums', 'NP', 107, '2021-06-15', 110000),
('Kiley', 'Shafer', 'MD', 103, '2022-08-01', 182000),
('Adrian', 'Roberts', 'CRNP', 109, '2018-03-24', 95000),
('Reid', 'Gaylon', 'CRNP', 106, '2020-10-16', 99000),
('Hannah', 'Smith', 'PA', 106, '2021-09-28', 120000),
('Michael', 'Gleason', 'MD', 101, '2021-07-12', 175000),
('Lisa', 'Leek', 'MD', 109, '2022-01-01', 210000),
('Christie', 'Ladner', 'NP', 102, '2021-04-09', 89000),
('Kathy', 'Richards', 'NP', 102, '2019-08-28', 96000),
('Sarah', 'Bryan', 'MD', 108, '2021-04-25', 162000),
('Hiliary', 'Glover', 'DNP', 105, '2022-03-12', 103000),
('Nathan', 'Hadley', 'MD', 108, '2021-10-01', 149000),
('Charles', 'Frye', 'MD', 108, '2018-06-28', 153000);

SELECT * FROM providers;

provider_id | first_name  | last_name | title | facility_id | hire_date  | salary
-------------+-------------+-----------+-------+-------------+------------+--------
          1 | Adeniyi     | Koiki     | MD    |         104 | 2021-12-16 | 200000
          2 | Matthew     | Harris    | FNP   |         101 | 2018-02-07 | 105000
          3 | Heather     | Evans     | DO    |         101 | 2020-09-01 | 168000
          4 | Griffen     | Sharpe    | MD    |         106 | 2022-01-20 | 180000
          5 | Malorie     | Devaughn  | ACNPC |         109 | 2021-01-31 |  98000
          6 | Cole        | Young     | MD    |         101 | 2022-07-01 | 168000
          7 | Christopher | Billsby   | DO    |         105 | 2019-03-21 | 177000
          8 | Jimmy       | Tu        | MD    |         109 | 2020-09-05 | 204000
          9 | Christopher | Mann      | MD    |         103 | 2020-05-27 | 172000
         10 | Michael     | Farmer    | DO    |         102 | 2018-12-09 | 150000
         11 | Jordan      | Steele    | DO    |         101 | 2022-03-02 | 166000
         12 | John        | Newcomb   | MD    |         106 | 2019-01-30 | 180000
         13 | Courtney    | Sessums   | NP    |         107 | 2021-06-15 | 110000
         14 | Kiley       | Shafer    | MD    |         103 | 2022-08-01 | 182000
         15 | Adrian      | Roberts   | CRNP  |         109 | 2018-03-24 |  95000
         16 | Reid        | Gaylon    | CRNP  |         106 | 2020-10-16 |  99000
         17 | Hannah      | Smith     | PA    |         106 | 2021-09-28 | 120000
         18 | Michael     | Gleason   | MD    |         101 | 2021-07-12 | 175000
         19 | Lisa        | Leek      | MD    |         109 | 2022-01-01 | 210000
         20 | Christie    | Ladner    | NP    |         102 | 2021-04-09 |  89000
         21 | Kathy       | Richards  | NP    |         102 | 2019-08-28 |  96000
         22 | Sarah       | Bryan     | MD    |         108 | 2021-04-25 | 162000
         23 | Hiliary     | Glover    | DNP   |         105 | 2022-03-12 | 103000
         24 | Nathan      | Hadley    | MD    |         108 | 2021-10-01 | 149000
         25 | Charles     | Frye      | MD    |         108 | 2018-06-28 | 153000
