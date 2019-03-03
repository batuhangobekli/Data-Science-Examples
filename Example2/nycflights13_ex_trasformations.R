library("nycflights13")

#1)
  #1.a) Had an arrival delay of two or more hours
  #"arr_delay" -> variable in minutes we use to filter arrival with delay
  filter(flights, arr_delay >= 120)

  #1.b) Flew to Houston (IAH or HOU)
  #"dest" -> variable we use to filter have flights with two cities.
  filter(flights, dest == "IAH" | dest == "HOU")

  #1.c) Departed in summer (July, August, and September)
  #"month" -> variable we use to filter have flights bewtween selected months.
  filter(flights, month == 9 | month == 8 | month == 7)

  #1.d) Arrived more than two hours late, but didn’t leave late
  #"dep_delay" ->variable in minutes we use to find departure with delay.
  #"arr_delay" -> variable in minutes we use to arrival with delay
  filter(flights, arr_delay > 120, dep_delay <= 0)
  
  #1.e) Were delayed by at least an hour, but made up over 30 minutes in flight
  filter(flights, dep_delay >= 60, dep_delay - arr_delay > 30)
  
#2) Sort flights to find the most delayed flights. Find the flights that left earliest.
  arrange(flights, dep_delay)

#3)Which flights traveled the longest? Which traveled the shortest?
  #Shortests
  flights %>%
    arrange(air_time) %>%
    select(flight, air_time)
  
  #Longest
  flights %>%
    arrange(-air_time) %>%
    select(flight, air_time)
  
#4) Currently dep_time and sched_dep_time are convenient to look at, but hard to compute with because they’re not really continuous numbers. Convert them to a more convenient representation of number of minutes since midnight.
  mutate(flights,
         department_time =  dep_time %/% 100 * 60 + dep_time %% 100)
  
#5) Compare air_time with arr_time - dep_time. What do you expect to see? What do you see? What do you need to do to fix it?
  flights %>% mutate(fly_time = arr_time - dep_time) %>%
    select(air_time, fly_time)
  #fly_time  is very different from air_time.
  
#6) Compare dep_time, sched_dep_time, and dep_delay. How would you expect those three numbers to be related?
  dep_delay = dep_time - sched_dep_time
  select(flights, dep_time, sched_dep_time, dep_delay)
  
#7) Find the 10 most delayed flights using a ranking function. How do you want to handle ties?Carefully read the documentation for min_rank(). numbers to be related?
  flights %>%
     filter(min_rank(-(dep_delay)) %in% 0:11)
  