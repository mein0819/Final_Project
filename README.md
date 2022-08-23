# Final Project

The topic we chose concerns trends in the value of homes in the United States and their correlation with rent prices. We chose our topic because it is extremely relevant amidst rising rent prices and an ongoing housing crisis in the United States. Our team is personally invested in this topic as citizens and consumers in the housing market. The outcome of the data analysis can help inform our understanding of the market and encourage research into other factors affecting rent prices using the information from our analysis. Our Google Slides Presentation draft for this segment can be viewed [here](https://docs.google.com/presentation/d/1LMMaxSyZR0QWz_Q7Y-8rrCq-LdCCa8ve6mMGS32Ybpg/edit?usp=sharing). 

## Goals
The question we hope to answer is how rent prices in major metropolitan cities in the United States are affected by home value by analyzing the correlations between various measurements of home value.

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

## Database
Using postgreSQL necessitated the creation of an ERD, finding connections between tables. We later took some research as joining multiple different columns on four different tables was a new adventure. We used SQL in pgAdmin to execute this code that was connected to our AWS server that all team members have access to in order to better collaborate on our project

## Machine Learning
### Model chosen: Linear Regression

The purpose of this model with this data is to predict local rent prices based off of home price data and to understand how related they may be, and a linear relationship between the input and output seemed to be the most logical way to explore the data. Regression analysis is highly useful in trend forecasting, it simplifies the estimation procedure, is easier explain and understand as far as machine learning models go, and allows control of variables to possibly determine an unbiased relationship between two or more variables.

Limitations in linear regression include failing to capture the data properly, or underfitting, sensitivity to outliers, and the assumption that the variables are independent, or linearly separable. More detail regarding our machine learning model can be found in our presentation [slides](https://docs.google.com/presentation/d/1LMMaxSyZR0QWz_Q7Y-8rrCq-LdCCa8ve6mMGS32Ybpg/edit?usp=sharing).

## Dashboard
## Tableau
Our team chose to use Tableau to visualize our data. The link to our visualization can be found [here]( https://public.tableau.com/app/profile/alexis.simpson/viz/DataBootcampFinal/Dashboard1?publish=yes).
