library(ggplot2)
library(dplyr)
library(tidyr)

data <- read.csv("full_dataset.csv")

filtered_data <- filter(data, ORIGIN == "SEA" | DEST == "SEA")

flight_counts <- summarize(group_by(filtered_data, year, month), Num_Flights = sum(Flights))

filtered_flight_counts_2000_2002 <- filter(flight_counts, year == 2000 | year == 2002)
filtered_flight_counts_2018_2022 <- filter(flight_counts, year == 2018 | year == 2022)

ggplot(filtered_flight_counts_2000_2002, aes(x = month, y = Num_Flights, color = factor(year))) +
  geom_line(size = 1.5) +
  geom_point() +
  labs(title = "Number of Flights to/from Seattle (2000 and 2002)",
       x = "Month",
       y = "Number of Flights") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        legend.title = element_blank()) +
  scale_x_continuous(breaks = 1:12, labels = 1:12)

ggplot(filtered_flight_counts_2018_2022, aes(x = month, y = Num_Flights, color = factor(year))) +
  geom_line(size = 1.5) +
  geom_point() +
  labs(title = "Number of Flights to/from Seattle (2018 and 2022)",
       x = "Month",
       y = "Number of Flights") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        legend.title = element_blank()) +
  scale_x_continuous(breaks = 1:12, labels = 1:12)