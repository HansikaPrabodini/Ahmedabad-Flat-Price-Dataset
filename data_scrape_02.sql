USE [p2_data_cleaning]

SELECT TOP (1000) [ahamedabad_areas]
      ,[AvgPrice]
      ,[Category]
      ,[F4]
      ,[F5]
      ,[F6]
      ,[F7]
      ,[F8]
      ,[F9]
      ,[F10]
      ,[F11]
  FROM [p2_data_cleaning].[dbo].[Sheet1$]


select *
into location_categories 
from [Sheet1$] 




select *
from location_categories 

--introduce row number for sort out duplicates 
select 
row_number() over (partition by ahamedabad_areas,AvgPrice,Category  order by (select NULL) ) as row_num, 
*
from location_categories



-- delete duplicates 
with get_duplicate as(
select 
row_number() over (partition by ahamedabad_areas,AvgPrice,Category  order by (select NULL) ) as row_num, 
*
from location_categories
)
delete
from get_duplicate
where row_num > 1


select *
from location_categories 

-- drop columns F4 to F11
alter table location_categories
drop column F4,F5,F6,F7,F8,F9,F10,F11


-- get all High location areas - 41 rows 
select *
from location_categories 
where Category ='High'


select *
into for_get_locations 
from cl_04


select *
from for_get_locations 


alter table for_get_locations
add location_quality varchar(255)

update for_get_locations
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


or location_address like '%Sindhubhavan Road%'
or location_address like '%Ellisbridge%' 
or location_address like '%Ghodsar%'
or location_address like '%Ambli%'
or location_address like '%Prahlad Nagar%'
or location_address like '%Shahibaug%'
or location_address like '%Chharodi%'
or location_address like '%Sola Village%'
or location_address like '%CG Road%'
or location_address like '%Iscon Ambli Road%'
or location_address like '%Memar%'
or location_address like '% Zydus Hospital Road  %'
or location_address like '%Bopal%'
or location_address like '%South Bopal%'
or location_address like '%Shilaj%'
or location_address like '%Vejalpur%'

or location_address like '%Ambavadi%'
or location_address like '%Jodhpur Village%' 
or location_address like '%Memnagar%'
or location_address like '%Nikol%'
or location_address like '%Prahlad Nagar%'
or location_address like '%Maninagar%'
or location_address like '%Chharodi%'
or location_address like '%Vasna%'
or location_address like '%CG Road%'
or location_address like '%Solad%'
or location_address like '%Tragad%'
or location_address like '%Chanakyapuri%'
or location_address like '%Gulbai Tekra%'
or location_address like '%Shahibuag%'
or location_address like '%Isanpur%'
or location_address like '%Sabarmati%'

or location_address like '%Hebatpur%'
or location_address like '%Judges Bungalow Road%'
or location_address like '%University Area%'
or location_address like '%Bodakdev  %'
or location_address like '% Ahmedabad Cantonment  %'
or location_address like '%gota%'
or location_address like '%Satellite%'

--3220 rows 

update for_get_locations
set location_quality='High End Areas'
where location_address like '%SG Highway%'
or Property_Description like '%Thaltej%' 
or Property_Description like '%Science City%'
or Property_Description like '%Ambli%'
or Property_Description like '%Prahlad Nagar%'
or Property_Description like '%Sindhu Bhavan Road%'
or Property_Description like '%Chandkheda%'
or Property_Description like '%Satellite City%'
or Property_Description like '%CG Road%'
or Property_Description like '%Navrangpura%'
or Property_Description like '%Jagatpur%'
or Property_Description like '%Vastrapur%'
or Property_Description like '%Prahladnagar%'
or Property_Description like '%Shela%'
or Property_Description like '%Vaishnodevi%'
or Property_Description like '%Bopal%'


or Property_Description like '%Sindhubhavan Road%'
or Property_Description like '%Ellisbridge%' 
or Property_Description like '%Ghodsar%'
or Property_Description like '%Ambli%'
or Property_Description like '%Prahlad Nagar%'
or Property_Description like '%Shahibaug%'
or Property_Description like '%Chharodi%'
or Property_Description like '%Sola Village%'
or Property_Description like '%CG Road%'
or Property_Description like '%Iscon Ambli Road%'
or Property_Description like '%Memar%'
or Property_Description like '% Zydus Hospital Road  %'
or Property_Description like '%Bopal%'
or Property_Description like '%South Bopal%'
or Property_Description like '%Shilaj%'
or Property_Description like '%Vejalpur%'

or Property_Description like '%Ambavadi%'
or Property_Description like '%Jodhpur Village%' 
or Property_Description like '%Memnagar%'
or Property_Description like '%Nikol%'
or Property_Description like '%Prahlad Nagar%'
or Property_Description like '%Maninagar%'
or Property_Description like '%Chharodi%'
or Property_Description like '%Vasna%'
or Property_Description like '%CG Road%'
or Property_Description like '%Solad%'
or Property_Description like '%Tragad%'
or Property_Description like '%Chanakyapuri%'
or Property_Description like '%Gulbai Tekra%'
or Property_Description like '%Shahibuag%'
or Property_Description like '%Isanpur%'
or Property_Description like '%Sabarmati%'

or Property_Description like '%Hebatpur%'
or Property_Description like '%Judges Bungalow Road%'
or Property_Description like '%University Area%'
or Property_Description like '%Bodakdev  %'
or Property_Description like '% Ahmedabad Cantonment  %'
or Property_Description like '%gota%'


update for_get_locations
set location_quality='High End Areas'
where location_address like '%Bodakdev%'
or location_address like '%Sola Village%'
or location_address like '%Sola%'
or location_address like '%Ambawadi%'
or location_address like '%sardar%'
or location_address like '%Law Garden%'




select *
from location_categories 
where Category ='Medium'

update for_get_locations
set location_quality='Middle Range Areas'
where location_address like '%Nava Naroda%'
or location_address like '%New Ranip%' 
or location_address like '%Gurukul%'
or location_address like '%Vatva%'
or location_address like '%Juhapura%'
or location_address like '%Usman Pura%'
or location_address like '%Bhat%'
or location_address like '%Ognaj%'
or location_address like '%Naryanpura%'
or location_address like '%Nirnay Nagar%'
or location_address like '%Sarkhej%'
or location_address like '%Koteshwar%'
or location_address like '%Chandlodiya%'
or location_address like '%Koba%'

or location_address like '%Makarba%'
or location_address like '%Sanand%' 
or location_address like '%Ghatlodiya%'
or location_address like '%Bhadaj%'
or location_address like '%Maninagar East%'
or location_address like '%Kankaria%'
or location_address like '%New C G Road%'
or location_address like '%Hansol%'
or location_address like '%Nana Chiloda%'
or location_address like '%Vaishnodevi%'
or location_address like '%Shahpur%'
or location_address like '%Khodiyar%'
or location_address like '%Jashoda Nagar%'
or location_address like '%Ramol%'

or location_address like '%Wadaj%'
or location_address like '%Aslali%' 
or location_address like '%Bareja%'
or location_address like '%Meghani Nagar%'
or location_address like '%Vishala%'
or location_address like '%Hatkeshwar%'
or location_address like '%vasna%'
or location_address like '%India Colony%'
or location_address like '%Maninagar West%'
or location_address like '%CTM%'
or location_address like '%Keshav Nagar%'
or location_address like '%Behrampura%'
or location_address like '%Chharodi Ahmedabad West%'
or location_address like '%Ghodasar Road%'
--782


update for_get_locations
set location_quality='Middle Range Areas'
where Property_Description like '%Nava Naroda%'
or Property_Description like '%New Ranip%' 
or Property_Description like '%Gurukul%'
or Property_Description like '%Vatva%'
or Property_Description like '%Juhapura%'
or Property_Description like '%Usman Pura%'
or Property_Description like '%Bhat%'
or Property_Description like '%Ognaj%'
or Property_Description like '%Naryanpura%'
or Property_Description like '%Nirnay Nagar%'
or Property_Description like '%Sarkhej%'
or Property_Description like '%Koteshwar%'
or Property_Description like '%Chandlodiya%'
or Property_Description like '%Koba%'

or Property_Description like '%Makarba%'
or Property_Description like '%Sanand%' 
or Property_Description like '%Ghatlodiya%'
or Property_Description like '%Bhadaj%'
or Property_Description like '%Maninagar East%'
or Property_Description like '%Kankaria%'
or Property_Description like '%New C G Road%'
or Property_Description like '%Hansol%'
or Property_Description like '%Nana Chiloda%'
or Property_Description like '%Vaishnodevi%'
or Property_Description like '%Shahpur%'
or Property_Description like '%Khodiyar%'
or Property_Description like '%Jashoda Nagar%'
or Property_Description like '%Ramol%'

or Property_Description like '%Wadaj%'
or Property_Description like '%Aslali%' 
or Property_Description like '%Bareja%'
or Property_Description like '%Meghani Nagar%'
or Property_Description like '%Vishala%'
or Property_Description like '%Hatkeshwar%'
or Property_Description like '%vasna%'
or Property_Description like '%India Colony%'
or Property_Description like '%Maninagar West%'
or Property_Description like '%CTM%'
or Property_Description like '%Keshav Nagar%'
or Property_Description like '%Behrampura%'
or Property_Description like '%Chharodi Ahmedabad West%'
or Property_Description like '%Ghodasar Road%'



update for_get_locations
set location_quality='Middle Range Areas'
where location_address like '%Khadia%'
or location_address like '%Ranip%' 
or location_address like '%Mithakhali%'
or location_address like '%Shyamal Cross Road%'
or location_address like '%Ashram Road%'
or location_address like '%Judges Bungalow%'
or location_address like '%Bhairavnath%'
or location_address like '%Kalikund%'
or location_address like '%Kuha%'
or location_address like '%Nirnay Nagar%'
or location_address like '%Naroda Dehgam Road%'
or location_address like '%Nasmed%'
or location_address like '%Nikol Gam Rd%'
or location_address like '%Raysan%'

or location_address like '%Shilaj Circle%'
or location_address like '%Azad Society%' 
or location_address like '%gota SG higway%'
or location_address like '%Hirawadi%'
or location_address like '%Panjarapole%'
or location_address like '%Kankaria%'
or location_address like '%subhash Bridge%'
or location_address like '%Motera%'
or location_address like '%Ghuma%'
or location_address like '%Ranip%'
or location_address like '%Jagatpur%'
or location_address like '%Khodiyar%'
or location_address like '%Sanathal%'
or location_address like '%Narolgam%'

or location_address like '%Naroda%'
or location_address like '%Amraiwadi%' 
or location_address like '%Manipur%'
or location_address like '%Kudasanr%'
or location_address like '%Chandlodia%'
or location_address like '%Odhav%'
or location_address like '%vasna%'
or location_address like '%New Maninagar%'
or location_address like '%Maninagar West%'
or location_address like '%Godhavi%'
or location_address like '%Ghatlodia%'
or location_address like '%Sughad%'
or location_address like '%Changodar%'
or location_address like '%Khokhra%'
--652



update for_get_locations
set location_quality='Middle Range Areas'
where Property_Description like '%Khadia%'
or Property_Description like '%Ranip%' 
or Property_Description like '%Mithakhali%'
or Property_Description like '%Shyamal Cross Road%'
or Property_Description like '%Ashram Road%'
or Property_Description like '%Judges Bungalow%'
or Property_Description like '%Bhairavnath%'
or Property_Description like '%Kalikund%'
or Property_Description like '%Kuha%'
or Property_Description like '%Nirnay Nagar%'
or Property_Description like '%Naroda Dehgam Road%'
or Property_Description like '%Nasmed%'
or Property_Description like '%Nikol Gam Rd%'
or Property_Description like '%Raysan%'

or Property_Description like '%Shilaj Circle%'
or Property_Description like '%Azad Society%' 
or Property_Description like '%gota SG higway%'
or Property_Description like '%Hirawadi%'
or Property_Description like '%Panjarapole%'
or Property_Description like '%Kankaria%'
or Property_Description like '%subhash Bridge%'
or Property_Description like '%Motera%'
or Property_Description like '%Ghuma%'
or Property_Description like '%Ranip%'
or Property_Description like '%Jagatpur%'
or Property_Description like '%Khodiyar%'
or Property_Description like '%Sanathal%'
or Property_Description like '%Narolgam%'

or Property_Description like '%Naroda%'
or Property_Description like '%Amraiwadi%' 
or Property_Description like '%Manipur%'
or Property_Description like '%Kudasanr%'
or Property_Description like '%Chandlodia%'
or Property_Description like '%Odhav%'
or Property_Description like '%vasna%'
or Property_Description like '%New Maninagar%'
or Property_Description like '%Maninagar West%'
or Property_Description like '%Godhavi%'
or Property_Description like '%Ghatlodia%'
or Property_Description like '%Sughad%'
or Property_Description like '%Changodar%'
or Property_Description like '%Khokhra%'



update for_get_locations
set location_quality='Middle Range Areas'
where location_address like '%Mahadev Nagar%'
or location_address like '%Shrinand Nagar%' 
or location_address like '%Thakkarbapa Nagar%'
or location_address like '%Kotarpur%'
or location_address like '%Nehru Nagar%'
or location_address like '%Judges Bungalow%'
or location_address like '%Saijpur Bogha%'
or location_address like '%Vadsar%'
or location_address like '%Naranpura%'
or location_address like '%Adraj%'
or location_address like '%Dani Limda%'
or location_address like '%Shantipura%'
or location_address like '%Zundal%'
or location_address like '%Saraspur%'

or location_address like '%Ayojan Nagar%'
or location_address like '%Kathwada%' 
or location_address like '%Old Wadaj%'
or location_address like '%Parimal Garden%'
or location_address like '%Visalpur%'
or location_address like '%Kankaria%'
or location_address like '%Dudheshwar%'
or location_address like '%Hirawadi Road%'
or location_address like '%Ghuma%'
or location_address like '%Ranip%'
or location_address like '%Jagatpur%'
or location_address like '%Khodiyar%'
or location_address like '%Ambli Bopal Road%'
or location_address like '%Shivranjni Cross Roads%'
or location_address like '%Ghodasar%'

update for_get_locations
set location_quality='Middle Range Areas'
where Property_Description like '%Mahadev Nagar%'
or Property_Description like '%Shrinand Nagar%' 
or Property_Description like '%Thakkarbapa Nagar%'
or Property_Description like '%Kotarpur%'
or Property_Description like '%Nehru Nagar%'
or Property_Description like '%Judges Bungalow%'
or Property_Description like '%Saijpur Bogha%'
or Property_Description like '%Vadsar%'
or Property_Description like '%Naranpura%'
or Property_Description like '%Adraj%'
or Property_Description like '%Dani Limda%'
or Property_Description like '%Shantipura%'
or Property_Description like '%Zundal%'
or Property_Description like '%Saraspur%'

or Property_Description like '%Ayojan Nagar%'
or Property_Description like '%Kathwada%' 
or Property_Description like '%Old Wadaj%'
or Property_Description like '%Parimal Garden%'
or Property_Description like '%Visalpur%'
or Property_Description like '%Kankaria%'
or Property_Description like '%Dudheshwar%'
or Property_Description like '%Hirawadi Road%'
or Property_Description like '%Ghuma%'
or Property_Description like '%Ranip%'
or Property_Description like '%Jagatpur%'
or Property_Description like '%Khodiyar%'
or Property_Description like '%Ambli Bopal Road%'
or Property_Description like '%Shivranjni Cross Roads%'
or Property_Description like '%Ghodasar%'


update for_get_locations
set location_quality='Middle Range Areas'
where location_address like '%Shrinand%'
or location_address like '%Dani%'
or location_address like '%jivrajr%'
or location_address like '%dharnidhar%'
or location_address like '%chandlodia%'
or location_address like '%old%'



select *
from location_categories 
where Category ='Low'

update for_get_locations
set location_quality='Affordable Areas'
where location_address like '%Prahlad Nagar%'
or location_address like '%Jodhpurr%' 
or location_address like '%Thakkarbapa Nagar%'
or location_address like '%Vastralr%'
or location_address like '%Paldi%'
or location_address like '%Naranpuraa%'
or location_address like '%Santej%'
or location_address like '%Satlasana%'
or location_address like '%Moraiya%'
or location_address like '%Adraj%'
or location_address like '%Lambha%'
or location_address like '%Sachana%'
or location_address like '%Zundal%'
or location_address like '%Maninagar Railway%'

or location_address like '%Vinzol%' 
or location_address like '%Zundal Circle%'
or location_address like '%Kathwara%'
or location_address like '%Rambaug%'
or location_address like '%Vithalapur%'
or location_address like '%Digvijaynagar%'
or location_address like '%Satlasana%'
or location_address like '%Geratpur%'
or location_address like '%Krishnanagar%'
or location_address like '%New India Colony%'
or location_address like '%Sachana%'
or location_address like '%Zundal%'
or location_address like '%Sanand Heights Society%'

or location_address like '%Near Nirma University On SG Highway%'
or location_address like '%Jivraj Park%'
or location_address like '%Nava Vadaj%'
or location_address like '%Satlasana%'
or location_address like '%Hathijan%'
or location_address like '%Sarkhej Okaf%'
or location_address like '%New India Colony%'
or location_address like '%Sachana%'
or location_address like '%Zundal%'
or location_address like '%Sanand Heights Society%'

or location_address like '%Gomatipur%'
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

-- 793 based on two



update for_get_locations
set location_quality='Affordable Areas'
where Property_Description like '%Prahlad Nagar%'
or Property_Description like '%Jodhpurr%' 
or Property_Description like '%Thakkarbapa Nagar%'
or Property_Description like '%Vastralr%'
or Property_Description like '%Paldi%'
or Property_Description like '%Naranpuraa%'
or Property_Description like '%Santej%'
or Property_Description like '%Satlasana%'
or Property_Description like '%Moraiya%'
or Property_Description like '%Adraj%'
or Property_Description like '%Lambha%'
or Property_Description like '%Sachana%'
or Property_Description like '%Zundal%'
or Property_Description like '%Maninagar Railway%'

or Property_Description like '%Vinzol%' 
or Property_Description like '%Zundal Circle%'
or Property_Description like '%Kathwara%'
or Property_Description like '%Rambaug%'
or Property_Description like '%Vithalapur%'
or Property_Description like '%Digvijaynagar%'
or Property_Description like '%Satlasana%'
or Property_Description like '%Geratpur%'
or Property_Description like '%Krishnanagar%'
or Property_Description like '%New India Colony%'
or Property_Description like '%Sachana%'
or Property_Description like '%Zundal%'
or Property_Description like '%Sanand Heights Society%'

or Property_Description like '%Near Nirma University On SG Highway%'
or Property_Description like '%Jivraj Park%'
or Property_Description like '%Nava Vadaj%'
or Property_Description like '%Satlasana%'
or Property_Description like '%Hathijan%'
or Property_Description like '%Sarkhej Okaf%'
or Property_Description like '%New India Colony%'
or Property_Description like '%Sachana%'
or Property_Description like '%Zundal%'
or Property_Description like '%Sanand Heights Society%'

or Property_Description like '%Gomatipur%'
or Property_Description like '%Bapunagar%' 
or Property_Description like '%Rakhiyal%'
or Property_Description like '%Odhav%'
or Property_Description like '%Amraiwadi%'
or Property_Description like '%Ramol%'
or Property_Description like '%Chhipa Vada%'
or Property_Description like '%Lal Darvaja%'
or Property_Description like '%Relied Road%'
or Property_Description like '%Kalupur%'
or Property_Description like '%Saurashtra%'
or Property_Description like '%Nicol%'
or Property_Description like '%Nikol%'
or Property_Description like '%Naroda%'
or Property_Description like '%Vatva%'
or Property_Description like '%Narol%'
or Property_Description like '%Khokhara%'
or Property_Description like '%Meghaninagar%'
or Property_Description like '%Rabaricolony%'
or Property_Description like '%Rakhial%'
or Property_Description like '%vastral%'
or Property_Description like '%hatkeshwar%'



update for_get_locations
set location_quality='Affordable Areas'
where location_address like '%Jodhpur%'
or location_address like '%Meghaninagar%'
or location_address like '%Rabaricolony%'
or location_address like '%Rakhial%'
or location_address like '%Rakhiyal%'
or location_address like '%Odhav%'
or location_address like '%Amraiwadi%'
or location_address like '%Ramol%'
or location_address like '%Chhipa Vada%'
or location_address like '%Lal Darvaja%'
or location_address like '%Relied Road%'
or location_address like '%Kalupur%'
or location_address like '%Saurashtra%'

select *
from location_categories 
where ahamedabad_areas like '%naroda%'







select *
from for_get_locations
where location_quality is null

-------------------get these details to another file 

--Sainath Avenue, Kasindra Ahmedabad -sardar patel
--santinagar Ahmedabad - Usmanpura
--Rajarhat Ahmedabad -
--sarjan tower Ahmedabad - mamnagar
--Parsi Dungarvadi Ahmedabad - 
select *
from location_categories 
where ahamedabad_areas like '%patel%'

select *
from for_get_locations2
where location_quality is null


select *
into for_get_locations2
from for_get_locations

select *
from for_get_locations2

update for_get_locations2
set location_address = 'Tragad'
where location_address like '%Tulsi status%'

update for_get_locations2
set location_address = 'South Bopal'
where location_address like '%Mahadev Lavish%'
or  location_address like '%Chittavan%'

update for_get_locations2
set location_address = 'Ghatlodia'
where location_address like '%samarpan Avenue%'

update for_get_locations2
set location_address = 'Isanpur'
where location_address like '%Dev Castle%'

update for_get_locations2
set location_address = 'Hathijan'
where location_address like '%Paradise Park%'

update for_get_locations2
set location_address = 'Vadsar'
where location_address like '%shubhgriha%'


update for_get_locations2
set location_address = 'Naranpura Road'
where location_address like '%Satyam%'

update for_get_locations2
set location_address = 'Jivraj Park'
where location_address like '%jay shefali%'


update for_get_locations2
set location_address = 'Nikol Gam Rd'
where location_address like '%Pavan A Appartment%'

update for_get_locations2
set location_address = 'Narolgam'
where location_address like '%Akruti%'
or location_address like '%Karnavati%'


update for_get_locations2
set location_address = 'Thaltej'
where location_address like '%Bhaikakanaga%'
or location_address like '%Ambe Nagar%'



update for_get_locations2
set location_address = 'India Colony  '
where location_address like '%Bindu%'
or location_address like '%Thakkarbapanagar%'

update for_get_locations2
set location_address = 'Satellite  '
where location_address like '%Ramdev Nagar%'

update for_get_locations2
set location_address = 'Khanpur'
where location_address like '%Cama Hotel%'


update for_get_locations2
set location_address = 'Ranip'
where location_address like '%Ganesh Green%'
or location_address like '%Chainpur%'
or location_address like '%Castle Villa%'
or location_address like '%GST%'


update for_get_locations2
set location_address = 'Ramol'
where location_address like '%Naiya Apartment%'



update for_get_locations2
set location_address = 'Maninagar'
where location_address like '%maniyasha%'
or location_address like '%Mihir Tower%'
or location_address like '%jawahar%'

update for_get_locations2
set location_address = 'CG Road'
where location_address like '%Rushabh%'
or location_address like '%NURSARY ROAD%'
or location_address like '%Chimanlal Girdharlal%'




update for_get_locations2
set location_address = 'Sabarmati'
where location_address like '%Dharmanagar Society%'
or location_address like '%Krishna%'

update for_get_locations2
set location_address = 'Ghodasar Road'
where location_address like '%Bhadwatnagar%'
or location_address like '%Avkar hall%'


update for_get_locations2
set location_address = 'Hansol'
where location_address like '%Satnam Residency%'


update for_get_locations2
set location_address = 'Odhav'
where location_address like '%Singarwa%'
or location_address like '%satya%'



update for_get_locations2
set location_address = 'Jodhpur'
where location_address like '%Panchtirth appartment%'



update for_get_locations2
set location_address = 'Naroda'
where location_address like '%Shree Ram Heights, Muthia %'
or location_address like '%Bapashree park%'
or location_address like '%Kaberi Bunglows%'



update for_get_locations2
set location_address = 'Nava Naroda'
where location_address like '%JIVAN PRAN RESIDENCY %'


update for_get_locations2
set location_address = 'Gota'
where location_address like '%Vandemataram Icon%'
or location_address like '%Vir savarkar heights%'


update for_get_locations2
set location_address = 'Vastral'
where location_address like '%Neelkanth %'
or location_address like '%united Amaltous%'
or location_address like '%Ratanpura Gams%'
or location_address like '%shreenath hill%'

update for_get_locations2
set location_address = 'Chandkheda'
where location_address like '%dev hometown %'
or location_address like '%jantagar%'
or location_address like '%janta%'
or location_address like '%Pavan Complex%'


update for_get_locations2
set location_address = 'Paldi'
where location_address like '%Rajgarden Tower%'
or location_address like '%Shantivan%'

update for_get_locations2
set location_address = 'Bopal'
where location_address like '%Aaryan Gloria%'
or location_address like '%shashwat%'
or location_address like '%SP Nirvana%'


update for_get_locations2
set location_address = 'Bopal'
where location_address like '%Aaryan Gloria%'
or location_address like '%shashwat%'
or location_address like '%SP Nirvana%' 




update for_get_locations2
set location_address = 'Near Vaishno Devi Circle On SG Highway'
where location_address like '%SG Highway%'
or location_address like '%Gandhinagar%'
or location_address like '%Drive In Road%' 
or location_address like '%Godrej Garden%'


update for_get_locations2
set location_address = 'Near Vaishno Devi Circle On SG Highway'
where location_address like '%SG Highway%'
or location_address like '%Gandhinagar%'
or location_address like '%Drive In Road%' 
or location_address like '%Godrej Garden%'
or location_address like '%Judges%'


update for_get_locations2
set location_address =  'ambavadi'
where location_address like '%Sulasa Residency%'
or location_address like '%Bhudarpura%'


update for_get_locations2
set location_address =  'Sarkhej'
where location_address like '%Zaheer Paradise%'
or location_address like '%Zaveri Palash%'

update for_get_locations2
set location_address =  'Vatva'
where location_address like '%Orange Paarijat%'
or location_address like '%Gamdi Road%'
or location_address like '%Vitthal Nagar%'
or location_address like '%Burhani%'



update for_get_locations2
set location_address =  'Vasna'
where location_address like '%Yashkamal%'
or location_address like '%Malhar flats%'
or location_address like '%sahaj solitaire%'




-- want to check same location address 
select location_address,count(*) as counts
from for_get_locations2
where location_quality is null
group by location_address 
order by counts desc

--Sindhu Bhavan Marg Ahmedabad - 6814
--Times 40, Rajpath Rangoli Road Ahmedabad - Bodakdev

--Usmanpura Ahmedabad - 7512
--Shyamal Ahmedabad - 8120
--Sumeru Ahmedabad - Bodakdev
--Surya Emerald, Panchavati Society Ahmedabad - Ambli r
--Panjara Pole Ahmedabad - Ambawadi
--Chimanlal Girdharlal Road Ahmedabad - C. G. Road
--Jay Ambe Nagar Ahmedabad - Thaltej
--Corporate Road Ahmedabad - Prahladnagar 
--Corporate Road Ahmedabad - 8614
--Panjara Pole Ahmedabad - 7455 ambavadi 
--santinagar Ahmedabad - Usmanpura -7512

select *
from location_categories 
where ahamedabad_areas like '%Prahladnagar%'

select *
from for_get_locations2
where location_quality is null


select *
into for_get_locations2
from for_get_locations

select *
from for_get_locations2

update for_get_locations2
set location_address = 'Iscon Ambli Road'
where location_address like '%Panchavati Society%'


update for_get_locations2
set location_address = 'Bodakdev  '
where location_address like '%Rajpath Rangoli%'
or location_address like '%Sumeru%'




select *
from for_get_locations2
where location_quality is null
-- still has 226 NULL


-- want to check same location address 
select location_address,count(*) as counts
from for_get_locations2
where location_quality is null
group by location_address 
order by counts desc
----
-- add 226 null call for details - 
select *
into for_get_locations3
from for_get_locations2



select *
from for_get_locations3
where location_quality is null

-- update 
update for_get_locations3
set location_quality = 'Call For Details'
where location_quality is null

-- remove location area colum 
alter table for_get_locations3
drop column location_area


--now this is the final data set for ML 

select *
into cl_06
from for_get_locations3




















































