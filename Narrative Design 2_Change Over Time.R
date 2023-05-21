library(ggplot2)
library(dplyr)
library(tidyr)

data <- read.csv("full_dataset.csv")

filtered_data <- data %>%
  filter(ORIGIN == "SEA" | DEST == "SEA")

flight_counts <- filtered_data %>%
  group_by(year, month) %>%
  summarize(Num_Flights = sum(Flights))

filtered_flight_counts_2000_2002 <- flight_counts %>%
  filter(year %in% c(2000, 2002))
filtered_flight_counts_2018_2022 <- flight_counts %>%
  filter(year %in% c(2018, 2022))

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