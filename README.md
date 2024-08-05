## Introduction

To deepen my understanding of foundational data management and analysis, I embarked on a project to clean and analyze a dataset using SQL. I selected the "Ahmedabad Flat Price Dataset (Uncleaned)" from Kaggle, which presented a range of data quality challenges. This dataset includes various columns related to property listings:

* Title: The headline or title of the property listing.
* type_area: The type of area measurement (e.g., Built-up, Carpet).
* value_area: The numerical value of the area of the flat.
* status: The status of the property (e.g., Ready to Move, Under Construction).
* floor: The floor number or description (e.g., Ground Floor, 5th Floor).
* transaction: The type of transaction (e.g., New Property, Resale).
* furnishing: The furnishing status (e.g., Unfurnished, Semi-Furnished, Fully-Furnished).
* facing: The direction the property faces (e.g., East, North-East).
* price: The total listed price of the property.
* price_sqft: The price per square foot.
* description: Additional descriptive text provided in the listing.
  
### Data Cleaning and Transformation

#### Data Cleaning:

Removed duplicates and inconsistencies to ensure data integrity.
Modified columns like type_area, value_area, status, floor, transaction, furnishing, facing, price, and price_sqft for consistency.
Addressed missing values by mining the description column.
Corrected erroneous data entries to improve data accuracy.

#### Data Transformation:

Added new columns derived from existing data, including No_Bedrooms, location_area, apartment_floor, and building_floors.
Converted data types and utilized advanced SQL functions for enhanced data accuracy.

#### Data Enrichment:

Enriched the dataset with new information sourced through web scraping using Python’s BeautifulSoup. I scraped all apartment listings in Ahmedabad to gather comprehensive data.
Cleaned the scraped data and integrated it into the final dataset, specifically enhancing the location_quality feature.
In addition, the project involved the following data cleaning techniques:

####  Removing Duplicates:
Ensured that each data point is unique and accurate.
#### Handling Missing Values: 
Used strategies like imputation or removal to address missing data.
#### Correcting Errors: 
Fixed incorrect data types, out-of-range values, or erroneous entries.
#### Standardizing Formats: 
Consistent formatting of dates, categorical values, and numerical data.
#### Normalization/Scaling: 
Adjusted data ranges using techniques like Min-Max scaling or Z-score normalization.
#### Data Transformation: 
Applied transformations to derive new features or change data structure.
#### Handling Outliers: 
Managed outliers that might skew analysis or model performance.
#### Encoding Categorical Variables: 
Converted categorical data into numerical format using methods like one-hot encoding or label encoding.
#### Feature Engineering: 
Created new features to enhance model performance or insights.
#### Data Integration: 
Combined data from different sources and ensured consistency.
#### Data Validation: 
Checked data against rules or constraints for accuracy.
#### Exploratory Data Analysis (EDA): 
Conducted initial analyses to understand data structure and relationships.
#### Documentation: 
Recorded the cleaning process, including decisions and methods used.

In cleaning and analyzing this dataset, I employed a range of SQL functions, from simple to advanced. Each day presented new errors to correct and additional concepts to learn, which made the process both challenging and enjoyable. I find great satisfaction in uncovering and resolving issues, and this project has significantly enhanced my skills and knowledge in data management.
