# Load

install.packages("tidyverse")
install.packages("nycflights13")

library(tidyverse)
library(nycflights13)

library(tidyverse)
library(nycflights13)

view(flights)

#Ex2

colnames(flights)

#Ex3
#3a
deparr_delay <- select(flights, c(dep_delay, arr_delay))
deparr_delay

#3b
flight_3b <- select(flights, c(1:5,7:19))
flight_3b

#3c
flight_3c <- select(flights, c(1:6))
flight_3c

#3d
flights_3d <- flights %>% select(contains("arr"))
flights_3d

#4a and 4b
f4a <- slice(flights, 1:5)
f4a

f4b <- slice(flights, 336,764:336,766)
f4b

head(flights, 5)
tail(flights, 2)
flights

#5
flights_5a <- arrange(flights, dep_delay)
flights_5a

flights_5b <- arrange(flights, desc(dep_delay))
flights_5b

flights_5c <- flights %>%
  mutate(across(c(tailnum, carrier))) %>%
  arrange(desc(dep_delay)) %>% 
  select(tailnum, carrier)
flights_5c

#6
flights_6a <- filter(flights, dest == "RDU")
flights_6a  
view(flights_6a)

flights_6b <- flights %>%
  filter(dest == "RDU" | arr_delay < "0")
flights_6b

#7
flights_7a <-filter(flights, origin == "JFK" | origin == "LGA") %>%
  freq_table
flights_7a
