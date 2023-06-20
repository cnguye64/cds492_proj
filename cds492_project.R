install.packages("dplyr")
library(dplyr)
install.packages('ggplot2')
library(ggplot2)
install.packages('tidyr')
library(tidyr)

# Extracting the columns that will be used into a new dataset
dataset <- X202304_cabi %>% 
  select(-c(ride_id, start_station_name, end_station_name))

# Calculation of duration of trips in seconds in new column
dataset <- dataset %>%
  mutate(
    trip_time = (ended_at - started_at)
  )

# Plotting histogram of trip duration of different membership statuses
dataset %>%
  ggplot() +
  geom_histogram(mapping = aes(x = trip_time, fill = member_casual), 
                pos = 'identity', bins = 20, alpha = 0.4) +
                xlim(0,2500) +
                labs(title = "Duration of Rider Types", x = "Seconds")

# Membership status data 

# Calculate average trip time
dataset %>% 
  summarise(avg_trip_time = mean(trip_time))

# Sum of membered and casual riders
dataset %>% 
  group_by(member_casual) %>% 
  count(member_casual)

# Calculate average trip time by membership status
dataset %>% 
  group_by(member_casual) %>% 
  summarise(avg_trip_time = mean(trip_time))

# Counts the types of bike used
dataset %>% 
  group_by(member_casual, rideable_type) %>% 
  count(member_casual)

# Mapping Coordinates - Longitude and Latitude

# All Riders - Starting Stations
ggplot(casual,aes(x = start_lng, y = start_lat)) +
  geom_point(size = 0.4, color = 'brown2') +
  geom_point(data=members,colour='steelblue', size = 0.4) + 
  theme(legend.position = "left") +
  labs(title = 'Starting Stations for all Riders', xlab = 'Longitude', ylab = 'Latitude')

# All Riders - Ending Stations
ggplot(casual,aes(x = end_lng, y = end_lat)) +
  geom_point(size = 0.4, color = 'brown2') +
  geom_point(data=members,colour='steelblue', size = 0.4) + 
  labs(title = 'Ending Stations for all Riders', xlab = 'Longitude', ylab = 'Latitude')

# Members - Starting Stations
members <- filter(dataset, member_casual == "member")
ggplot(members, aes(x = start_lng, y = start_lat)) +
  geom_point(size = 0.4) +
  theme_minimal() +
  labs(title = 'Areas of Starting Stations for Members')

# Members - Ending Stations
ggplot(members, aes(x = end_lng, y = end_lat)) +
  geom_point(size = 0.4) +
  theme_minimal()

# Casual - Starting Stations
casual <- filter(dataset, member_casual == "casual")
ggplot(casual, aes(x = start_lng, y = start_lat)) +
  geom_point(size = 0.4) +
  theme_minimal() +
  labs(title = 'Areas of Starting Stations for Casual Riders')

# Casual - Ending Stations
ggplot(casual, aes(x = end_lng, y = end_lat)) +
  geom_point(size = 0.4) +
  theme_minimal()


