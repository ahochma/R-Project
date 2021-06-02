library(tidyverse)
library("ggpubr")
library(janitor)
library(dplyr)
# Get the Data

# Read in with tidytuesdayR package 
# Install from CRAN via: install.packages("tidytuesdayR")
# This loads the readme and all the datasets for the week of interest

#Importing the data from the web
coffee_ratings <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-07-07/coffee_ratings.csv')


#transformatin
# 1.need to remove 0 and NA
# 2.need to remove extreme samples- such as mean altitude samples.
# 3.

data<-coffee_ratings%>%
  select(total_cup_points,species,country_of_origin,altitude_mean_meters,processing_method,moisture,aroma,flavor,body,balance)%>%
  drop_na()
#Visualisation 
#species
ggplot(data) + 
  geom_bar(mapping = aes(x = species, group = 1))
#Top 10 countries
ggplot(data) + 
  geom_bar(mapping = aes(x = country_of_origin),group=1,size=10)
#procesing method
ggplot(data) + 
  geom_bar(mapping = aes(x = processing_method),group=1,size=5)
#aroma
ggplot(data)+
  geom_density(aes(x=aroma))
#moisture
ggplot(data)+
  geom_density(aes(x=moisture))
#flavor
ggplot(data)+
  geom_density(aes(x=flavor))
#body
ggplot(data)+
  geom_density(aes(x=body))
#balance
ggplot(data)+
  geom_density(aes(x=balance))
#effect of country of origin on total cup points
ggplot(data)+
  geom_boxplot(aes(x=total_cup_points,y=country_of_origin))
#moisture-totalcup point
ggplot(data)+
  geom_point(aes(x=moisture,y=total_cup_points))
#mean altitude-totalcup point
ggplot(data)+
  geom_point(aes(x=altitude_mean_meters,y=total_cup_points))









view(data)


