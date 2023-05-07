library('dplyr')

df_2022 <- read.csv('2022_filtered_data')
df_2022$year <- '2022'
names(df_2022)[names(df_2022) == "n"] <- "Flights"
df_2022 <- select(df_2022, month, year, ORIGIN, DEST, Flights)

df <- read.csv('2000_2002_prefiltered.csv')
year <- substr(df$Fly_date, 1, 4)
month <- substr(df$Fly_date, 6, 7)
day <- substr(df$Fly_date, 9, 10)
df$day <- day
df$month <- month
df$year <- year
df_2000 <- filter(df, year == '2000')
df_2002 <- filter(df, year == '2002')

names(df_2000)[names(df_2000) == "Origin_airport"] <- "ORIGIN"
names(df_2000)[names(df_2000) == "Destination_airport"] <- "DEST"
names(df_2002)[names(df_2002) == "Origin_airport"] <- "ORIGIN"
names(df_2002)[names(df_2002) == "Destination_airport"] <- "DEST"
df_2000 <- count(group_by(df_2000, month, ORIGIN, DEST))
df_2002 <- count(group_by(df_2002, month, ORIGIN, DEST))
df_2000$year <- '2000'
df_2002$year <- '2002'
names(df_2000)[names(df_2000) == "n"] <- "Flights"
names(df_2002)[names(df_2002) == "n"] <- "Flights"
df_2000 <- select(df_2000, month, year, ORIGIN, DEST, Flights)
df_2002 <- select(df_2002, month, year, ORIGIN, DEST, Flights)

df_2018 <- read.csv('2018_prefiltered.csv')
year2 <- substr(df_2018$FL_DATE, 1, 4)
month2 <- substr(df_2018$FL_DATE, 6, 7)
day2 <- substr(df_2018$FL_DATE, 9, 10)
df_2018$day <- day2
df_2018$month <- month2
df_2018$year <- year2
df_2018 <- count(group_by(df_2018, month, ORIGIN, DEST))
df_2018$year <- '2018'
names(df_2018)[names(df_2018) == "n"] <- "Flights"
df_2018 <- select(df_2018, month, year, ORIGIN, DEST, Flights)

df_2000$month <- as.numeric(df_2000$month)
df_2000$year <- as.numeric(df_2000$year)
df_2002$month <- as.numeric(df_2002$month)
df_2002$year <- as.numeric(df_2002$year)
df_2018$month <- as.numeric(df_2018$month)
df_2018$year <- as.numeric(df_2018$year)
df_2022$month <- as.numeric(df_2022$month)
df_2022$year <- as.numeric(df_2022$year)


combined_df <- rbind(df_2000, df_2002, df_2018, df_2022)
monthly_counts <- group_by(combined_df, month, year)
df_perc <- summarize(monthly_counts, percent_monthly_flights = (100 * Flights) / sum(Flights))
combined_df$percent_monthly_flights <- df_perc$percent_monthly_flights
write.csv(combined_df, 'full_dataset.csv')

