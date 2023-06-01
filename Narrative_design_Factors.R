library('dplyr')
library('ggplot2')
library('reshape2')
library('viridis')

df <- read.csv('full_dataset.csv')
group <- group_by(df, month, year)
combined_monthly <- summarize(group, FlightCount = sum(Flights))
covid <- filter(combined_monthly, year > 2010)
nine_eleven <- filter(combined_monthly, year < 2010)
melted_covid <- melt(covid, id.vars = c("year", "month"), measure.vars = "FlightCount")
melted_nine <- melt(nine_eleven, id.vars = c("year", "month"), measure.vars = "FlightCount")



viz <- ggplot(melted_covid, aes(x = month, y = year, fill = value)) +
  geom_tile(width = 0.9, height = 3.5) +
  labs(x = "Month", y = "Year", fill = "Flight Count", title = 'Flight Count before and after outbreak of the SARS-CoV-2 outbreak to and from SEATAC airport') +
  theme_bw()


viz2 <- ggplot(melted_nine, aes(x = month, y = year, fill = value)) +
  geom_tile(width = 0.9, height = 1.75) +
  labs(x = "Month", y = "Year", fill = "Flight Count", title = 'Flight Count before and after September 11th, 2001 Attack to and from SEATAC airport') +
  theme_bw()

# Modify the X-axis labels for both plots
viz <- viz + scale_x_continuous(breaks = 1:12, labels = month.abb)
viz2 <- viz2 + scale_x_continuous(breaks = 1:12, labels = month.abb)
viz <- viz + scale_y_continuous(breaks = c(2018, 2022), labels = c('2018', '2022'))
viz2 <- viz2 + scale_y_continuous(breaks = c(2000, 2002), labels = c('2000', '2002'))

viz <- viz + geom_text(aes(label = value), color = "white", size = 5)
viz2 <- viz2 + geom_text(aes(label = value), color = "white", size = 5)

viz <- viz + scale_fill_viridis()
viz2 <- viz2 + scale_fill_viridis()


