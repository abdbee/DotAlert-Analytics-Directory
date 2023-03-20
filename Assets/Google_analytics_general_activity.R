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
General_activity <- General_activity %>% mutate(aet_user_ratio = Average_engagement_time/Daily_Users, MonthYear = paste(Month, "-", Year), across('aet_user_ratio', ~replace_na(.x, 0)))       
View(General_activity)    

#active user trend

Active_user_trend <- ggplot(data = General_activity) + geom_line(mapping = aes(Nth_day, Active_user_trend_30_Days, color = "Active_user_trend_30_Days")) + geom_line(mapping = aes(Nth_day, Active_user_trend_7_Days, color = "Active_user_trend_7_Days")) + geom_line(mapping = aes(Nth_day, Active_user_trend_1_Day, color = "Active_user_trend_1_Day")) + facet_wrap(~factor (MonthYear,levels = c('September - 2022','October - 2022','November - 2022','December - 2022','January - 2023','February - 2023','March - 2023')), nrow = 2) + theme_bw()
Active_user_trend_for_each_month <- General_activity %>% filter(MonthYear == c('February - 2023', 'March - 2023')) %>% ggplot() + geom_line(mapping = aes(Nth_day, Active_user_trend_30_Days, color = "Active_user_trend_30_Days")) + geom_line(mapping = aes(Nth_day, Active_user_trend_7_Days, color = "Active_user_trend_7_Days")) + geom_line(mapping = aes(Nth_day, Active_user_trend_1_Day, color = "Active_user_trend_1_Day")) + facet_wrap(~factor (MonthYear,levels = c('February - 2023','March - 2023')), nrow = 1) + theme_bw()


#average engagement time (deprecated)
Average_engagement_time = ggplot(data = General_activity) + geom_line(mapping = aes(Nth_day, Average_engagement_time)) + facet_wrap(~ Month, nrow = 2) + theme_bw()



# number of total users for each month
MonthlyUsers <- General_activity %>% filter(Month == "March")
View(MonthlyUsers)
MonthlyTotalUsersCount <- sum(MonthlyUsers$Daily_Users)
MonthlyNewUsersCount <- sum(MonthlyUsers$New_users)


# number of New users for each day of the month
NewUsers <- ggplot (data = General_activity) + geom_line(mapping = aes(Nth_day, New_users)) + facet_wrap(~factor (MonthYear,levels = c('September - 2022','October - 2022','November - 2022','December - 2022','January - 2023','February - 2023','March - 2023')), nrow = 2) + theme_bw()
NewUsers_for_each_month <- General_activity %>% filter(MonthYear == c('February - 2023', 'March - 2023')) %>% ggplot () + geom_line(mapping = aes(Nth_day, New_users)) + facet_wrap(~factor (MonthYear,levels = c('February - 2023','March - 2023')), nrow = 1) + theme_bw()

#overall average time
mean(General_activity$Average_engagement_time)

# average engagement time for each month
Noveng <- General_activity %>% filter(Month == "September")
mean(Noveng$Average_engagement_time)

