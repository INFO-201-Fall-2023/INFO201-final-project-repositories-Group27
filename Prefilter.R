library('dplyr')
#df_2018 <- read.csv('2018.csv')
#df_20002002 <- read.csv('200020002.csv')

#df_2018 <- filter(select(df_2018, FL_DATE, OP_CARRIER, OP_CARRIER_FL_NUM, ORIGIN, DEST), ORIGIN == "SEA" | DEST == "SEA")
#df_20002002 <- filter(select(df_20002002, Origin_airport, Destination_airport, Flights, Fly_date), Origin_airport == 'SEA' | Destination_airport == "SEA")



df <- read.csv('2000_2002_prefiltered.csv')
year <- substr(df$Fly_date, 1, 4)
month <- substr(df$Fly_date, 6, 7)
day <- substr(df$Fly_date, 9, 10)
df$day <- day
df$month <- month
df$year <- year
df_2000 <- filter(df, year == '2000')
df_2002 <- filter(df, year == '2002')

df_2018 <- read.csv('2018_prefiltered.csv')
year2 <- substr(df_2018$FL_DATE, 1, 4)
month2 <- substr(df_2018$FL_DATE, 6, 7)
day2 <- substr(df_2018$FL_DATE, 9, 10)
df_2018$day <- day2
df_2018$month <- month2
df_2018$year <- year2
df_2018 <- count(group_by(df_2018, month, ORIGIN, DEST))
df_2018$year <- '2018'

#write.csv(df, '2018_prefiltered.csv')
#write.csv(df2, '2000_2002_prefiltered.csv')