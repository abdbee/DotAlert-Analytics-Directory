library(tidyverse)
library(readr)

#import page views
Page_views <- read_csv("~/Desktop/DotAlert/Google Analytics/Page_views.csv", col_types = cols(Year = col_number(), Views = col_number()))
View(Page_views)     

#import events
Events <- read_csv("~/Desktop/DotAlert/Google Analytics/Events.csv", col_types = cols(Year = col_number(), Event_count = col_number()))
Events <- Events %>% mutate(MonthYear = paste(Month, "-", Year))
View(Events)

# import user countries
User_countries <- read_csv("~/Desktop/DotAlert/Google Analytics/User_countries.csv", col_types = cols(Year = col_number(), Users = col_number()))
View(User_countries)        

#import user retention
User_retention <- read_csv("~/Desktop/DotAlert/Google Analytics/User_retention.csv", col_types = cols(`Week 0` = col_number(), `Week 1` = col_number(), `Week 2` = col_number(), `Week 3` = col_number(), `Week 4` = col_number(), `Week 5` = col_number()))
                                                      
View(User_retention) 

# import user sessions
User_sessions <- read_csv("~/Desktop/DotAlert/Google Analytics/User_sessions.csv", col_types = cols(Year = col_number(), Sessions = col_number()))

View(User_sessions)     

# import "where new users come from"
Where_new_users_come_from <- read_csv("~/Desktop/DotAlert/Google Analytics/Where_new_users_come_from.csv", col_types = cols(Year = col_number(), New_users = col_number()))
Where_new_users_come_from <- Where_new_users_come_from %>% mutate(MonthYear = paste(Month, "-", Year))
View(Where_new_users_come_from)      

# chart of new-user traffic
New_users_traffic_no_organic <- subset(Where_new_users_come_from, Channel != "Organic Search")
View(New_users_traffic_no_organic)
New_user_traffic <- ggplot(data = New_users_traffic_no_organic) + geom_col(mapping = aes(Channel,New_users, fill = Channel)) + facet_wrap(~factor (MonthYear,levels = c('September - 2022','October - 2022','November - 2022','December - 2022','January - 2023','February - 2023','March - 2023')), nrow = 2) + theme_bw()

# total number of users from each country
total_user_per_country <- User_countries %>% group_by(Country) %>% summarize (sum(Users))
View(total_user_per_country)

#comparison of monthly events
monthly_events_comparison <- Events %>% filter(Event_name %in% c("first_visit", "page_view", "scroll")) %>% ggplot(aes(x = Event_name, y = Event_count, group = Event_name, color = Event_name, fill = Event_name)) + geom_col() + facet_wrap(~factor (MonthYear,levels = c('September - 2022','October - 2022','November - 2022','December - 2022','January - 2023','February - 2023','March - 2023')), nrow = 2) + theme_bw()

# total page views by month
pageViewsinMonth <- Page_views %>% filter(Month == "February")
View(pageViewsinMonth)
totalpageViewsinMOnth <- sum(pageViewsinMonth$Views)
