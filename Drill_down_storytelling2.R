library(dplyr)
library(stringr)
library(ggplot2)
library(tidyr)
data <- read.csv("full_dataset.csv")

filtered_data <- filter(data, ORIGIN == "SEA" | DEST == "SEA")
new_data <- mutate(filtered_data, Month = sprintf("%02d", month))


top_destinations_1 <- top_n(arrange(summarize(group_by(filter(filter(new_data, ORIGIN == "SEA"), year == 2000), DEST), total_flights = sum(Flights)), desc(total_flights)), 10)

#2000

top_10_list <- top_destinations_1$DEST
clean_data <- filter(filter(new_data, DEST %in% top_10_list), year == 2000)


story_3_viz_nine_2000 <- ggplot(clean_data, aes( x = Month , y = Flights, group = DEST, fill = DEST)) + ggtitle("Year 2000 Flights from Seattle") +
geom_area()

#2002
clean_data <- filter(filter(new_data, DEST %in% top_10_list), year == 2002)


story_3_viz_nine_2002 <- ggplot(clean_data, aes( x = Month , y = Flights, group = DEST, fill = DEST)) + ggtitle("Year 2002 Flights from Seattle") +
  geom_area()


#YEAR 2018/2022


top_destinations_2 <- top_n(arrange(summarize(group_by(filter(filter(new_data, ORIGIN == "SEA"), year == 2018), DEST), total_flights = sum(Flights)), desc(total_flights)), 10)


top_10_list <- top_destinations_1$DEST
clean_data <- filter(filter(new_data, DEST %in% top_10_list), year == 2018)

story_3_viz_covid_2018 <- ggplot(clean_data, aes( x = Month , y = Flights, group = DEST, fill = DEST)) + ggtitle("Year 2018 Flights from Seattle") +
  geom_area()

 #2022


clean_data <- filter(filter(new_data, DEST %in% top_10_list), year == 2022)

story_3_viz_covid_2022 <- ggplot(clean_data, aes( x = Month , y = Flights, group = DEST, fill = DEST)) + ggtitle("Year 2022 Flights from Seattle") +
  geom_area()
