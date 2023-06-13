install.packages("dplyr")
library(dplyr)
install.packages('ggplot2')
library(ggplot2)
install.packages('tidyr')
library(tidyr)
install.packages("ggmap")
library(ggmap)

dataset <- X202304_cabi %>% 
  select(-c(ride_id, start_station_name, end_station_name))

# Duration of Trips in seconds
dataset <- dataset %>%
  mutate(
    trip_time = (ended_at - started_at)
  )

dataset %>%
  ggplot() +
  geom_histogram(mapping = aes(x = trip_time, fill = member_casual), 
                pos = 'identity', bins = 20, alpha = 0.4) +
                xlim(0,2500) +
                labs(title = "Duration of Rider Types", x = "Riders")

# Membership status data 
dataset %>% 
  summarise(avg_trip_time = mean(trip_time))

dataset %>% 
  group_by(member_casual) %>% 
  count(member_casual)

dataset %>% 
  group_by(member_casual) %>% 
  summarise(avg_trip_time = mean(trip_time))

# Types of bike used
dataset %>% 
  group_by(member_casual, rideable_type) %>% 
  count(member_casual)

# Mapping Coordinates

# All Riders
ggplot(casual,aes(x = start_lng, y = start_lat)) +
  geom_point(size = 0.4, color = 'brown2') +
  geom_point(data=members,colour='steelblue', size = 0.4) + 
  theme(legend.position = "left") +
  labs(title = 'Starting Stations for all Riders', xlab = 'Longitude', ylab = 'Latitude')

ggplot(casual,aes(x = end_lng, y = end_lat)) +
  geom_point(size = 0.4, color = 'brown2') +
  geom_point(data=members,colour='steelblue', size = 0.4) + 
  labs(title = 'Ending Stations for all Riders', xlab = 'Longitude', ylab = 'Latitude')

# Members
members <- filter(dataset, member_casual == "member")
ggplot(members, aes(x = start_lng, y = start_lat)) +
  geom_point(size = 0.4) +
  theme_minimal() +
  labs(title = 'Areas of Starting Stations for Members')

ggplot(members, aes(x = end_lng, y = end_lat)) +
  geom_point(size = 0.4) +
  theme_minimal()

# Casual
casual <- filter(dataset, member_casual == "casual")
ggplot(casual, aes(x = start_lng, y = start_lat)) +
  geom_point(size = 0.4) +
  theme_minimal() +
  labs(title = 'Areas of Starting Stations for Casual Riders')

ggplot(casual, aes(x = end_lng, y = end_lat)) +
  geom_point(size = 0.4) +
  theme_minimal()


