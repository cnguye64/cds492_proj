# Capital Bikeshare Data Analysis Project

By: Christine Nguyen 
CDS 492 Capstone Final Project

## Project Overview

The goal of this project is to use R to grow the number of annual memberships through analyzing user trends and offering suggestions to make the program more appealing to potential customers. More people will utilize this service if it can be identified where bikeshare is most popular and where to strategically build more stations. 

## Dataset

The dataset was taken directly from the official Capital Bikeshare website. The dataset contains all trips during April 2023. Each row is represented by a single trip and columns contains different variables of the trips: 

- rideable_type: Type of bike rode
- started_at: Start time of trip
- ended_at: End time of trip
- start_lat: Latitude where trip started
- end_lat: Latitude where trip ended
- start_lng: Longitude where trip started
- end_lng: Longitude where trip ended
- member casual: Whether trip was taken by a member with subscription or a single renter user

## Methology

This project will consist of first, preparing and cleaning the dataset. Finding the summary statistics of the trips, then mapping the coordinates of the starting and ending stations. The duration of the trips will be calculated using the started_at and ended_at variables. 

### Summary Statistics Computed

- Number of membered and casual riders
- Average trip duration of membered and casual riders
- Number of types of bikes used by membered and casual riders

### Visualizations Created

- Histogram of trip duration
- Map of starting and ending stations

## Results

It is found that approximately 71% of all riders are members but casual riders have a greater average trip time. Also, membered riders do not have the option of using docked bikes for trips. 

In order to pursuade casual riders to switch to a membership program, it is recommended that firstly, as trip lengths peak at about 500 seconds, special subscription discounts will be offered if users decide to switch to a membership option during that time. Second, placing bikes at the stations that are only accessible to members ensures that they will have a better chance of locating a bike. Lastly, areas with less common starting stations can offer discounts to try encouraging more users to the area.  

## Packages Used in R

- ddplyr
- ggplot2
- todyr
