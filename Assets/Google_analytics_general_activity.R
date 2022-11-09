library(readr)
library(tidyverse)



#relevant analytics:
#compare active user trends (for current month, and aggregate for all months)
# average engagement time general
# monthly average engagement time (aggregate)
#new users (for current month, and aggregate for all months)
#daily users (for current month, and aggregate for all months)
# most active days
# daily users and new users for each month
# daily and new monthly users (aggregate).

#import csv file for general activity
General_activity <- read_csv("~/Desktop/DotAlert/Google Analytics/General_activity.csv",col_types = cols(Year = col_number(), Nth_day = col_number(), Daily_Users = col_number(), New_users = col_number(), Average_engagement_time = col_number(), Active_user_trend_30_Days = col_number(), Active_user_trend_7_Days = col_number(), Active_user_trend_1_Day = col_number()))
       
View(General_activity)    

#active user trend
Active_user_trend <- ggplot(data = General_activity) + geom_line(mapping = aes(Nth_day, Active_user_trend_30_Days, color = "Active_user_trend_30_Days")) + geom_line(mapping = aes(Nth_day, Active_user_trend_7_Days, color = "Active_user_trend_7_Days")) + geom_line(mapping = aes(Nth_day, Active_user_trend_1_Day, color = "Active_user_trend_1_Day")) + facet_wrap(~ Month, nrow = 2) + theme_bw()

#average engagement time
Average_engagement_time = ggplot(data = General_activity) + geom_line(mapping = aes(Nth_day, Average_engagement_time)) + facet_wrap(~ Month, nrow = 2) + theme_bw()

# number of New users for each day of the month
NewUsers <- ggplot (data = General_activity) + geom_line(mapping = aes(Nth_day, New_users)) + facet_wrap(~ Month, nrow = 2) + theme_bw()

#overall average time
mean(General_activity$Average_engagement_time)

# average engagement time for each month
octeng <- General_activity %>% filter(Month == "October")
mean(octeng$Average_engagement_time)



