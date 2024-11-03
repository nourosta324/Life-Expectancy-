#data manipulation 
install.packages("dplyr")
library(dplyr)
library(gapminder)
# working only with 2 columns from our data set which are COUNTRY and lIFE EXP
gapminder %>%
  select(country, lifeExp) %>%
  filter(country == "Lebanon" | country == "Algeria")%>% #filtering out all other countries
  group_by(country) %>%
  
  # finding the average life exp for each of those countries
  summarize(Average_life = mean(lifeExp)) 

#perform t test to test hypothesis that average life exp between these 2 countries is the same
library(dplyr)
df1 <- gapminder %>%
  select(country, lifeExp) %>%
  filter(country == "Lebanon" | country == "Algeria")

t.test (lifeExp ~ country, data = df1)

#plotting lebanon's GDP over the years
library(ggplot2)
library(dplyr)
library(gapminder)
lebanon_data <- gapminder %>%
  filter(country == "Lebanon") %>%
  select(year, gdpPercap)
ggplot(lebanon_data, aes(x=year, y=gdpPercap)) + 
  geom_line() + 
  labs(title = "Lebanon's GDP per capital over the years" , x = "Year", y = " GDP per Capita")
+ theme_minimal() 
