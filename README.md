# Final Project

We chose our topic because it is extremely relevant amidst rising rent prices and an ongoing housing crisis in the United States. Our team is personally invested in this topic as citizens and consumers in the housing market.
The outcome of the data analysis can help inform our understanding of the market and encourage research into other factors affecting rent prices using the information from our analysis. Our Google Slides Presentation draft for this segment can be viewed [here](https://docs.google.com/presentation/d/1LMMaxSyZR0QWz_Q7Y-8rrCq-LdCCa8ve6mMGS32Ybpg/edit?usp=sharing). 

## Goals
The question we hope to answer is how rent prices in major metropolitan cities in the United States are affected by home value by analyzing the correlations between various measurements of home value. Our goal is to be able to predict rent price using different measures of home value. Can we use trends in the value of homes in metropolitan areas of the United States to predict correlation with rent prices?

# Overview
We sourced and analyzed data from [Zillow](https://www.zillow.com/research/data/). Zillow is a leader in online home-marketing and sales. For example, one of the datasets used in our exploratory analysis is the Zillow Home Value Index dataset (HVI), measures the typical home value in a metropolitan area in the United States.

## Project Outline
- Chose topic
- Established roles, decided on collaboration across roles as the need arose
- Choose datasets from Zillow and download
- Clean data into database
- Import data into machine learning model
- Connected postgreSQL database in pgAdmin to an AWS RDS 
- Chose to create dashboard in Tableau, incorporating machine learning model to visualization

### Resources used: 
- Python 
- Jupyter Notebook
- Pandas
- PostgreSQL
- pgAdmin
- Google Slides
- Amazon Web Services
- Tableau

## Data exploration and analysis
 - Five datasets were downloaded from Zillow's Housing Data site
 - Datasets were arranged in descending order: 
   - SizeRank, with columns of RegionID, SizeRank, RegionName, RegionType, StateName (this column was not in the rent data)
 - Columns showing month and year
 - Starting January 2000 (depending on the dataset), ending June of 2022

### Data cleaning
 - Checking for null values
 - Calling a function created to print the column name and how many null values if there were any found
 - These values would eventually be dropped through selecting the date range to be used for all datasets or the dropna function in Pandas
 - Data was cleaned by using a regular expression to drop the state abbreviation from the RegionName column, except for the rent data, which because it lacked a State column, a split string function was used to create two new columns: City and State

 - Date columns were dropped so the datasets showed data for the past two years
 - RegionID, RegionType and SizeRank columns were also dropped on all the DataFrames
 - Finally, the tables were merged on the date columns into two columns showing month/year and value pairs

### Description of the analysis phase
Further analysis was done for each table by calculating the percent change for each value from the previous month using the pct_change function. This created all rows from June 2020 to have null values so these were dropped for each table, adjusting the data to start in July 202 and end in June 2022. The four cleaned DataFrames were exported as csv files to the Resources folder. Tables were merged on the Date, CIty, and State columns to begin exploring corelations and then finally all merged into one DataFrame to begin testing machine learning models. 

## Database
Using postgreSQL necessitated the creation of an ERD, finding connections between tables. We later took some research as joining multiple different columns on four different tables was a new adventure. We used SQL in pgAdmin to execute this code that was connected to our AWS server that all team members have access to in order to better collaborate on our project

## Machine Learning
### Model chosen: Linear Regression

The purpose of this model with this data is to predict local rent prices based off of home price data and to understand how related they may be, and a linear relationship between the input and output seemed to be the most logical way to explore the data. Regression analysis is highly useful in trend forecasting, it simplifies the estimation procedure, is easier explain and understand as far as machine learning models go, and allows control of variables to possibly determine an unbiased relationship between two or more variables.

Limitations in linear regression include failing to capture the data properly, or underfitting, sensitivity to outliers, and the assumption that the variables are independent, or linearly separable. More detail regarding our machine learning model can be found in our presentation [slides](https://docs.google.com/presentation/d/1LMMaxSyZR0QWz_Q7Y-8rrCq-LdCCa8ve6mMGS32Ybpg/edit?usp=sharing).

## Dashboard
## Tableau
Our team chose to use Tableau to visualize our data. The link to our visualization can be found [here]( https://public.tableau.com/app/profile/alexis.simpson/viz/DataBootcampFinal/Dashboard1?publish=yes).
