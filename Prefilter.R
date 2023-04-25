library('dplyr')
df_2018 <- read.csv('2018.csv')
df_20002002 <- read.csv('200020002.csv')

df_2018 <- filter(select(df_2018, FL_DATE, OP_CARRIER, OP_CARRIER_FL_NUM, ORIGIN, DEST), ORIGIN == "SEA" | DEST == "SEA")
df_20002002 <- filter(select(df_20002002, Origin_airport, Destination_airport, Flights, Fly_date), Origin_airport == 'SEA' | Destination_airport == "SEA")

write.csv(df_2018, '2018_prefiltered.csv')
write.csv(df_20002002, '2000_2002_prefiltered.csv')