USE [p2_data_cleaning]

----------in here we use all rows included table - 6416 rows included one 

select *
into final_01
from test_09

-- 6416 rows 
select *
from final_01

--- rename columns 
-- EXEC sp_rename 'TableName.OldColumnName', 'NewColumnName', 'COLUMN';

EXEC sp_rename 'final_01.location_test_02', 'Location_area' , 'COLUMN'
EXEC sp_rename 'final_01.status_test', 'Property_status' , 'COLUMN'
EXEC sp_rename 'final_01.floor_test', 'Apartment_floor' , 'COLUMN'
EXEC sp_rename 'final_01.furnishing_test', 'Furnishing' , 'COLUMN'
EXEC sp_rename 'final_01.type_area_test', 'Area_type' , 'COLUMN'
EXEC sp_rename 'final_01.No_Bedrooms', 'Bedrooms' , 'COLUMN'

alter table final_01
add Property_Description nvarchar(max)

alter table final_01
drop column desct



update final_01
set Property_Description = desct

--F1 - float,null
--[Title] -nvarchar(255),null








----------------------------------------------- now add all data into another duplicate file search for description - test_12

select *
into test_12
from final_01

select * 
from test_12

select distinct location_area
from test_12

select distinct Property_status
from test_12
--Ready to Move
--New Property
--Under Construction
--Call for Details
--Resale

select distinct transaction_test
from test_12
--New Property
--Other
--Resale
--Rent/Lease


select distinct Furnishing
from test_12
--- add Furnishing null as 'Call for Details'
update test_12
set Furnishing = 'Call for Details'
where Furnishing is Null


--Unfurnished
--Furnished
--Call for Details
--Semi-Furnished


select distinct facing_direction
from test_12
--North
--North - East
--NULL
--East
--South - East
--South
--South - West
--North - West
--West

select distinct Area_type
from test_12
--Super Area
--Under Construction
--Transaction
--Built Area
--Carpet Area

select distinct type_of_property
from test_12
--Apartment
--Builder Floor
--Penthouse
--Studio

select distinct Bedrooms
from test_12
--0 --> Call for Details 
--9
--3
--6
--7
--1
--4
--5
--2
--8

select *
from test_12
where Bedrooms = 0


select distinct Location_area
from test_12
-- 414 locations 

select * 
from test_12

--- penthouses - traditionaly A penthouse is an apartment or unit traditionally on the highest floor of an apartment building
-- so we can add apartment floor column to 'Top floor' (basically) if its not contain any floors 
select *
from test_12
where type_of_property = 'Penthouse'


select *
into test_13
from test_12


select *
from test_13
where type_of_property = 'Penthouse' 
and Apartment_floor not like '%out of%'

update test_13
set Apartment_floor = 'Top floor'
where type_of_property = 'Penthouse' 
and Apartment_floor not like '%out of%'


select *
from test_13
where title like '%Sale in%'


-- get only address part - in here had only address
SELECT 
    Title,
    SUBSTRING(Title, CHARINDEX('Sale in', Title) + LEN('Sale in ') + 1, LEN(Title)) AS title_after_sale_in
FROM 
    test_13


-------------------------------------------------- i want get this address in another table - for_address
select *
into for_address
from test_13


-- add column - location_address
alter table for_address
add location_address varchar(255)

update for_address
set location_address =  SUBSTRING(Title, CHARINDEX('Sale in', Title) + LEN('Sale in ') + 1, LEN(Title))


select *
from for_address


























































































































































