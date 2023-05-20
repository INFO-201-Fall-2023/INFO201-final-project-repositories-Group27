# Libraries
library(ggplot2)
library(dplyr)
library(tidyr)

# Read the dataset
data <- read.csv("/Users/anirudhramadurai/Downloads/full_dataset.csv")

# Filter the data for flights to and from Seattle
filtered_data <- data %>%
  filter(ORIGIN == "SEA" | DEST == "SEA")

# Calculate the total number of flights for each month and year
flight_counts <- filtered_data %>%
  group_by(year, month) %>%
  summarize(Num_Flights = sum(Flights))

# Plot with multiple lines
ggplot(flight_counts, aes(x = month, y = Num_Flights, color = factor(year))) +
  geom_line(size = 1.5) +
  geom_point() +
  labs(title = "Number of Flights to/from Seattle",
       x = "Month",
       y = "Number of Flights") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5),
        legend.title = element_blank()) +
  scale_x_continuous(breaks = 1:12, labels = 1:12)