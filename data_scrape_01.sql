-- This is the scrape data from  https://www.makaan.com/price-trends/property-rates-for-buy-in-ahmedabad


USE [p2_data_cleaning]
GO

SELECT [ahamedabad_areas]
      ,[avg_price_for_sqft]
  FROM [dbo].[dataScrape$]

GO

select *
from [dataScrape$]  
where ahamedabad_areas = 'Godhavi'



select *
into scrape1
from [dataScrape$]

select *
from scrape1

--- remove null rows - actually this is supporting file
-- use this if we want to get prevoius values we can get it 
begin transaction
delete from scrape1
where avg_price_for_sqft is null
commit;

select *
from scrape1

-- replace' / sqft' as nothing
select *,
replace(avg_price_for_sqft,' / sqft','')
from scrape1

update scrape1
set avg_price_for_sqft = replace(avg_price_for_sqft,' / sqft','')



select *,
replace(avg_price_for_sqft,',','')
from scrape1


update scrape1
set avg_price_for_sqft =replace(avg_price_for_sqft,',','')

update scrape1
set avg_price_for_sqft ='5841'
where ahamedabad_areas = 'Godhavi'

select *
from scrape1


--- now need to get this as float 
select *
into scrape2
from scrape1

select *
from scrape2


alter table scrape2
add AvgPrice float


update scrape2
set AvgPrice = try_cast(avg_price_for_sqft as float)

---------------EDA---------------------------------------------------
select max(AvgPrice)
from scrape2

select min(AvgPrice)
from scrape2



---remove unnesseary column
select *
into scrape3
from scrape2


alter table scrape3
drop column avg_price_for_sqft

select *
from scrape3























