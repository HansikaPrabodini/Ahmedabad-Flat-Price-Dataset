USE [p2_data_cleaning]
----------------------------------------------for cleaned floors - 5932 rows---------------------------
select *
into final_02
from test_11

select *
from final_02

EXEC sp_rename 'final_02.location_test_02', 'Location_area' , 'COLUMN'
EXEC sp_rename 'final_02.status_test', 'Property_status' , 'COLUMN'

EXEC sp_rename 'final_02.furnishing_test', 'Furnishing' , 'COLUMN'
EXEC sp_rename 'final_02.type_area_test', 'Area_type' , 'COLUMN'
EXEC sp_rename 'final_02.No_Bedrooms', 'Bedrooms' , 'COLUMN'


alter table final_02
add Property_Description nvarchar(max)

update final_02
set Property_Description = description


alter table final_02
drop column description


---- In here used Cleared Floor table ------- cl_01
select *
from final_02

select *
into cl_01
from final_02

select *
from cl_01


-- apartment floor has ground , upper basement and lower basement so for calculations 
-- ground - 0
-- upper basement - -1
-- lower basement - -2
-- this two get as basements
update cl_01
set apartment_floor = 0
where apartment_floor ='Ground' --133 rows

update cl_01
set apartment_floor = -1
where apartment_floor ='Upper Basement' --22 rows

update cl_01
set apartment_floor = -2
where apartment_floor ='Lower Basement' --39 rows

select *
from cl_01

---------------------add location_address column - create alternative table and column 
select *
into cl_02
from cl_01


-- add column - location_address
alter table cl_02
add location_address varchar(255)

update cl_02
set location_address =  SUBSTRING(Title, CHARINDEX('Sale in', Title) + LEN('Sale in ') + 1, LEN(Title))


------Check count of Null values ---
select *
from cl_02
where area_value is null
-- 1 row


select *
from cl_02
where price_per_sqft is null
--279 rows


select *
from cl_02
where apartment_price is null
-- no null


select *
from cl_02
where Property_status is null
-- no null


select *
from cl_02
where transaction_test is null
-- no null

select *
from cl_02
where Furnishing is null
-- 16  rows

select *
from cl_02
where apartment_floor =-1
or apartment_floor =-2


-- in here we update all Upper and Lower Basements as one Basement = -1
update cl_02
set apartment_floor = -1
where apartment_floor =-2

-- now we only have -1 , 
-- need to convert apartment floor, building floors to float
alter table cl_02
add ApartmentFloor1 int

alter table cl_02
add BuildFloors float

update cl_02
set ApartmentFloor1 = CAST(apartment_floor as int)


update cl_02
set BuildFloors = TRY_CAST(building_floors as float)



----------this can't happened so update 175 as 17 ----------------------------------------

select Max(BuildFloors)
from cl_02

select *
from cl_02
where BuildFloors=175

select *
from ahmedabad$
where F1=2553

update cl_02
set BuildFloors = 17
where BuildFloors=175
----------------------------------------------------------------------------------------
select * 
into cl_03
from cl_02


-- 
alter table cl_03
drop column apartment_floor,building_floors

alter table cl_03
add apartment_floor int

alter table cl_03
add building_floors float

update cl_03
set apartment_floor = ApartmentFloor1

update cl_03
set building_floors = BuildFloors


select *
from cl_03




----------------
select * 
into cl_04
from cl_03


-- 
alter table cl_04
drop column ApartmentFloor1,BuildFloors

select *
from cl_04




select *
from cl_04
where Furnishing is null
-- 16  rows


select distinct(apartment_floor)
from cl_04

---- Apartment Bedrooms become Zero cannot happend - i need to get connection to fulfill it 
select *
from cl_04
where Bedrooms = 0


select *
from  ahmedabad$
where F1=2378

select *
from cl_04
where location_area = 'Gota'
and apartment_floor =1
and type_of_property='Apartment'
and Area_type ='Super Area'
and transaction_test ='Resale'
and location_address ='Gota Ahmedabad'
--if we consider all this we can add F1=2378 has 2 bedrooms 


------ outlier - area_value
select max(area_value)
from cl_04

select *
from cl_04
where area_value = 750000

select *
from  ahmedabad$
where F1=6291

-- in python this is outlier no any connection to data set -its better to remove this and add F1=2378 has 2 bedrooms 
select *
into cl_05
from cl_04


select *
from cl_05

-- use this if we want to get prevoius values we can get it 
begin transaction
delete from cl_05
where area_value = 750000
commit;


update cl_05
set Bedrooms =2
where location_area = 'Gota'
and apartment_floor =1
and type_of_property='Apartment'
and Area_type ='Super Area'
and transaction_test ='Resale'
and location_address ='Gota Ahmedabad'
and Bedrooms =0




-- now have 5931 rows
select *
from cl_05


select max(building_floors)
from cl_05

select *
from cl_05
where building_floors = 52




-- in the area location we can devided - have a list based on web search  add it as location_quality
--High-End Areas
--Middle Range Areas
--Affordable Areas

alter table cl_05
add location_quality varchar(255)

update cl_05
set location_quality='High End Areas'
where location_address like '%SG Highway%'
or location_address like '%Thaltej%' 
or location_address like '%Science City%'
or location_address like '%Ambli%'
or location_address like '%Prahlad Nagar%'
or location_address like '%Sindhu Bhavan Road%'
or location_address like '%Chandkheda%'
or location_address like '%Satellite City%'
or location_address like '%CG Road%'
or location_address like '%Navrangpura%'
or location_address like '%Jagatpur%'
or location_address like '%Vastrapur%'
or location_address like '%Prahladnagar%'
or location_address like '%Shela%'
or location_address like '%Vaishnodevi%'
or location_address like '%Bopal%'
--2518 rows


update cl_05
set location_quality='Middle Range Areas'
where location_address like '%Ghatlodia%'
or location_address like '%Sola%' 
or location_address like '%Gota%'
or location_address like '%vejalpur%'
or location_address like '%jivrajr%'
or location_address like '%paldi%'
or location_address like '%vasna%'
or location_address like '%dharnidhar%'
or location_address like '%chandlodia%'
or location_address like '%sabarmati%'
or location_address like '%bodakdev%'
or location_address like '%ambavadi%'
or location_address like '%memnaga%'
or location_address like '%vadaj%'
-- 800 rows



update cl_05
set location_quality='Affordable Areas'
where location_address like '%Gomatipur%'
or location_address like '%Bapunagar%' 
or location_address like '%Rakhiyal%'
or location_address like '%Odhav%'
or location_address like '%Amraiwadi%'
or location_address like '%Ramol%'
or location_address like '%Chhipa Vada%'
or location_address like '%Lal Darvaja%'
or location_address like '%Relied Road%'
or location_address like '%Kalupur%'
or location_address like '%Saurashtra%'
or location_address like '%Nicol%'
or location_address like '%Nikol%'
or location_address like '%Naroda%'
or location_address like '%Vatva%'
or location_address like '%Narol%'
or location_address like '%Khokhara%'
or location_address like '%Meghaninagar%'
or location_address like '%Rabaricolony%'
or location_address like '%Rakhial%'
or location_address like '%vastral%'
or location_address like '%hatkeshwar%'
--519 rows



select *
from cl_05
where location_quality is null



------------------------Final data set 
select *
from cl_06


update cl_06 
set location_quality = NULL
where location_quality = 'Call For Details' 

select *
from cl_06 
where Bedrooms = 0

--update bedrooms

update cl_06
set Bedrooms =2
where location_address = 'Gota Ahmedabad'
and apartment_floor =1
and type_of_property='Apartment'
and Area_type ='Super Area'
and transaction_test ='Resale'
and Bedrooms =0


select *
from cl_06
where location_address = 'Gota Ahmedabad'
and apartment_floor =1
and type_of_property='Apartment'
and Area_type ='Super Area'
and transaction_test ='Resale'
and Bedrooms =0


select *
from cl_06 
where area_value = 750000



select distinct Furnishing
from cl_06 

---- need to drop that 
select *
from cl_06 
where F1=1251



select *
from cl_06
where Property_status is not null 
and transaction_test is not null
and Area_type is not  null 
and location_quality is not null


----create new table cl_07

select *
into cl_07
from cl_06

select *
from cl_07


---drop where F1=1251 - outlier
BEGIN TRANSACTION;

DELETE 
FROM cl_07 
where F1=1251

-- Realize it was a mistake
--ROLLBACK;



select *
from cl_07
-- now need to remove all the null values including rows 




select *
from cl_07
where Property_status is null 
or transaction_test is null
or Area_type is null 
or location_quality is null
or price_per_sqft is null



BEGIN TRANSACTION;
DELETE 
FROM cl_07 
where Property_status is null 
or transaction_test is null
or Area_type is null 
or location_quality is null
or price_per_sqft is null
-- 469 rows 




select *
from cl_07

---select all the data to cl_08
select *
into cl_08
from cl_07


-- add column for calculate estimated_apartment_price 
alter table cl_08
add estimated_apartment_price float


update cl_08
set estimated_apartment_price = area_value  * price_per_sqft


select *
from cl_08



-- add column for get difference in actual price vs estimated_apartment_price as difference_to


alter table cl_08
add difference_to float


update cl_08
set difference_to = apartment_price - estimated_apartment_price


select *
from cl_08
where Property_status = 'Call for Details'


update cl_08
set Property_status = NULL  
where Property_status = 'Call for Details'



BEGIN TRANSACTION;
DELETE 
FROM cl_08 
where Property_status is null 
or transaction_test is null
or Area_type is null 
or location_quality is null
or price_per_sqft is null
or Furnishing is null
or area_value is null



select *
from cl_08
-- all 5387 rows

select distinct Bedrooms
from cl_08



select max(difference_to)
from cl_08

select *
from cl_08





-- get data into another data set 
select *
into cl_09
from cl_08


























































