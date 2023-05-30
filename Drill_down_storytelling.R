library(dplyr)
library(stringr)
library(ggplot2)
library(tidyr)
data <- read.csv("full_dataset.csv")

filtered_data <- data %>%
  filter(ORIGIN == "SEA" | DEST == "SEA")
#filtered_data$Month <- as.numeric(filtered_data$month)\
new_data <- filtered_data %>%
  mutate(Month = sprintf("%02d", month))

top_destinations_1 <- new_data %>%
  filter(ORIGIN == "SEA") %>%
  filter(year == 2000) %>%
  group_by(DEST) %>%
  summarize(total_flights = sum(Flights)) %>%
  arrange(desc(total_flights)) %>%
  top_n(10)


top_10_list <- top_destinations_1$DEST
clean_data <- new_data %>%
  filter(DEST %in% top_10_list) %>%
  filter(year == 2000)


story_3_viz_nine_2000 <- ggplot(clean_data, aes( x = Month , y = Flights, group = DEST, fill = DEST)) + ggtitle("Year 2000 Flights from Seattle") +
geom_area()

clean_data <- new_data %>%
  filter(DEST %in% top_10_list) %>%
  filter(year == 2002)


story_3_viz_nine_2002 <- ggplot(clean_data, aes( x = Month , y = Flights, group = DEST, fill = DEST)) + ggtitle("Year 2002 Flights from Seattle") +
  geom_area()


#YEAR 2018/2022

top_destinations_2 <- new_data %>%
  filter(ORIGIN == "SEA") %>%
  filter(year == 2018) %>%
  group_by(DEST) %>%
  summarize(total_flights = sum(Flights)) %>%
  arrange(desc(total_flights)) %>%
  top_n(10)


top_10_list <- top_destinations_1$DEST
clean_data <- new_data %>%
  filter(DEST %in% top_10_list) %>%
  filter(year == 2018)

story_3_viz_covid_2018 <- ggplot(clean_data, aes( x = Month , y = Flights, group = DEST, fill = DEST)) + ggtitle("Year 2018 Flights from Seattle") +
  geom_area()

 #2022

clean_data <- new_data %>%
  filter(DEST %in% top_10_list) %>%
  filter(year == 2022)

story_3_viz_covid_2022 <- ggplot(clean_data, aes( x = Month , y = Flights, group = DEST, fill = DEST)) + ggtitle("Year 2022 Flights from Seattle") +
  geom_area()
