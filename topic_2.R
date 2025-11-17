
#Topic 2
#Q2)
library(MASS)
data("mtcars")
View(mtcars)
str(mtcars)

#q1)
library(tidyverse)
mtcars %>%
  filter(hp>100)%>%
  arrange(desc(mpg))

#2)
mtcars %>%
  select(mpg,hp,qsec)

#3)
mtcars %>%
  mutate(DPC=disp/cyl)
#4)
mtcars %>%
  summarise(mean_mpg=mean(mpg),sd_mpg=sd(mpg))
  
#5)
mtcars %>%
  group_by(cyl) %>%
  summarise(mean_mpg=mean(mpg),mean_hp=mean(hp))

#6)
mtcars %>%
  filter(mpg>20) %>%
  arrange(desc(hp))

mtcars %>%
  select(mpg,hp,qsec)
  
#7)
mtcars %>%
  mutate(mpg_category=ifelse(mpg>25,"high","low"))

#q8)
mtcars %>%
  mutate(scale_mpg=scale(mpg))
  #summarise(mean(scale_mpg),sd(scale_mpg))
  
#9)
mtcars %>%
  rename("mp"=mpg,"p"=hp,"qsc"=qsec)
  
#10)
mtcars$am %>%
  recode("0"="automatic","1"="mannual")

  







 
  
  
