getwd()
rm(list=Is())
library(tidyverse)

library(tidyr)
data("table1")
view(table1)

data("table2")
view(table2)

data("table3")
view(table3)

data("table4a")
view(table4a)

data("table4b")
view(table4b)

data("table5")
view(table5)


#Q1)
#a)
table1 %>% 
  mutate(rate=(cases/population)*10000)

#c)
table4a %>% 
  gather("1999","2000",key=year,value=cases)

table4b %>% 
  gather("1999","2000",key=year,value=population)

table2 %>% 
  spread(key = type,value = count)

#d)
tidy_table4a <- table4a %>% 
gather("1999","2000",key=year,value=cases)

tidy_table4b <- table4b %>% 
  gather("1999","2000",key=year,value=population)
left_join(tidy_table4a,tidy_table4b)

#e)
table3 %>% 
  separate(rate,into = c("cases","population"),convert = T)

#f)
table5 %>% 
  unite(new_year,century,year,sep="")











