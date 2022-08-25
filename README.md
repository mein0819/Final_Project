# Final Project

We chose our topic because it is extremely relevant amidst rising rent prices and an ongoing housing crisis in the United States. Our team is personally invested in this topic as citizens and consumers in the housing market.
The outcome of the data analysis can help inform our understanding of the market and encourage research into other factors affecting rent prices using the information from our analysis. Our Google Slides Presentation can be viewed [here](https://docs.google.com/presentation/d/1LMMaxSyZR0QWz_Q7Y-8rrCq-LdCCa8ve6mMGS32Ybpg/edit?usp=sharing). 

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
 - Columns were created to show month and year, starting January 2000 (depending on the dataset) and ending June of 2022

### Data cleaning
 - Began checking the data for null values
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

Limitations in linear regression include failing to capture the data properly, or underfitting, sensitivity to outliers, and the assumption that the variables are independent, or linearly separable. 
Preprocessing of the data was mostly done in the ETL phase. All NaN values and unnecessary columns were dropped from the tables, and the remaining columns were formatted to match for joining. Rent data was plotted with possible features to show any correlation. The data was exported to a postgres database and joined together. 

The model is connected to the database through an Amazon Web Services RDS that links to pgAdmin using the sqlalchemy library. Once the table was read in and stored in a DataFrame, the Date, City, and State columns were dropped. 
The initial test for the model used the %Change_Rent column for the dependent variable and the remaining columns for the independent variables. This model produced a low r-squared value due to using calculated fields (the %Change columns). The next test dropped these features for X, leaving Avg_List_Price, Avg_Sale_Price and HVI, and Avg_Rent as the dependent variable and  produced a much higher r-squared value.
The models were initially tested using the default testing and training split of .25, with the first two tests done without scaling. The third test used a standard scaler to scale the X features, and the fourth test used scaling on a .35 split of the test and train data, which was found through trial and error to see what produced the best r-squared and mean squared error.

Further optimization for the model was attempted by adding more data, which was done by extending the date range of data from the present to July 2020 to the present to February 2014. This increased the rows of data from 1978 to 8500. 
The List Price data only goes back to 2018 so this data was not included in the table used for the ML model. The SizeRank column was left in the tables instead of being dropped as originally was done.
After reading in the updated joined table, the SizeRank column is binned by population range to be used for visualizations. There was no correlation between the size and average rent within the data. Scaling was also further tested by using MinMaxScaler in addition to the StandarScaler

### Coefficient importance and its causality
 - Post analysis of Deliverable 2's model coefficients revealed a higher degree of importance assigned to the Avg List Price variable than previously assumed so dropping that column was not helping the model.
 - Bringing that column back in tested whether adding more features would improve the model's performance.
 - Two new datasets were downloaded and imported as dataframes New Listings, and For Sale Inventory. These were put through the same ETL process as the previous data and added to the model as features. Due to data constraints, the final merged data set includes values from 3-31-2018 to  6-30-2022. 

### Model metrics
The model's R2 and MSE improved from .81 and 36245 to .85 and 28426 by adding 3 features back into the model despite losing around 6000 rows of data. 
Average List Price, Average Sale Price and HVI were the features that influenced the model the most, though, For Sale Inventory was not far behind the Sale Price. New Listings had a zero or a negative impact on the model, yet when tested, leaving this feature out the model scores dropped so it was left in for the final model.

### Analysis
Interpreting the data shows that several of the features are correlated, as can be expected from the housing market. List Price is highly influenced by both Sale Price and the Home Value Index (HVI), just as For Sale Inventory is highly influenced by New Listings. Using regularization helps reduce the influence of correlated features on the model by distributing the weight between two variables, as well as providing stability to the weights. This can be seen in the Ridge Model and the Cross-Validation model. Weights are distributed fairly evenly and variances are rather stable within the coefficient predictions. New Listings shows the smallest amount of influence, yet is interesting in that it has a negative effect on the model, suggesting that as new listings increase in a city, rent decreases. 
The Mean Absolute Error of the model is 130.20, the Mean Squared Error is 28426.46, the Root Mean Squared Error is 168.60 and the R2 is .852. It appears the variance of the outliers in the dataset are contributing the the high MAE, MSE and RMSE. The outliers were kept in the dataset due to not wanting to eliminate data just to get a better fit for the model when the data was not considered bad or corrupted data. 
### Results
 - HVI, Average List Price and Average Sale Price coefficients had the highest influence on the model
 - New Listings  trends  to a negative impact, suggesting that as new listings increase in a city, rent decreases
 - Ridge and Cross-Validation models show that coefficient weights are distributed fairly evenly and variances are stable
 - Variance of outliers appear to cause high values of MAE, MSE and RMSE
 - Selected features of home value data display a linear relationship to average rent 
 - R2 score of 85% is good but shows 15% unknown variables affecting Avg. Rent


## Dashboard
### Tableau
Our team chose to use Tableau to visualize our data. The link to our visualization can be found [here]( https://public.tableau.com/app/profile/alexis.simpson/viz/DataBootcampFinal/Dashboard1?publish=yes).
