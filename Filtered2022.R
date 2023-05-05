library(dplyr)



#df_2022 <- read.csv("CompleteData.csv")
#df_2022 <- filter(select(df_2022, FL_DATE, ORIGIN, DEST), ORIGIN == "SEA" | DEST == "SEA")
year <- substr(df_2022$FL_DATE, 1, 4)
month <- substr(df_2022$FL_DATE, 6, 7)
day <- substr(df_2022$FL_DATE, 9, 10)
df_2022$day <- day
df_2022$month <- month
df_2022$year <- year

df_2022 <- count(group_by(df_2022, month, ORIGIN, DEST))
df_2022$year <- '2022'
write.csv(df_2022, "2022_filtered_data")