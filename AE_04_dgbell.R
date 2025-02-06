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

view(flights)

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

flights_7a <-filter(flights, origin == "JFK" | origin == "LGA")
flights_7a

freqtable7a <- count(flights_7a, flights_7a$dest)
print(freqtable7a)

#####################

freqtable7b <- count(flights,flights$month)
print(freqtable7b)
#####################

freqtable7c <- count(flights,flights$month, flights$day) 
print(freqtable7c)
max(freqtable7c)
view(freqtable7c)

#8
flight8a <- flights %>%
  mutate(air_time = air_time/60)
mph <- c(flight8a$distance/flight8a$air_time)

flight8a$mph <- flight8a

flight8a
view(flight8a$mph)
colnames(flight8a)


#8b
count8b <- count(flights,flights$month)
month <- c("1","2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12")
flightfreq <- count8b %>%
  table(month)
flightprop8b <- prop.table(flightfreq)
print(flightprop8b)


#8c
flight8c <- flights
flight8c$rdu_bound <- flight8c 
flight8c <- mutate(flight8c, rdu_bound = if_else(dest == "RDU", "Yes", "No"))

flight8c
print(flight8c)

#9 Mean
flight9 <- flights %>%
  summarise(flights$arr_delay)
