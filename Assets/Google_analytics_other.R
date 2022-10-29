library(tidyverse)
library(readr)

#import page views
Page_views <- read_csv("~/Desktop/DotAlert/Google Analytics/Page_views.csv", 
                       +     col_types = cols(Year = col_number(), 
                                              +         Views = col_number()))
View(Page_views)     

#import events
Events <- read_csv("~/Desktop/DotAlert/Google Analytics/Events.csv", 
                   +     col_types = cols(Year = col_number(), 
                                          +         Event_count = col_number()))


# import user countries
User_countries <- read_csv("~/Desktop/DotAlert/Google Analytics/User_countries.csv", 
                           +     col_types = cols(Year = col_number(), 
                                                  +         Users = col_number()))
View(User_countries)        

#import user retention
User_retention <- read_csv("~/Desktop/DotAlert/Google Analytics/User_retention.csv", 
                           +     col_types = cols(`Week 0` = col_number(), 
                                                  +         `Week 1` = col_number(), `Week 2` = col_number(), 
                                                  +         `Week 3` = col_number(), `Week 4` = col_number(), 
                                                  +         `Week 5` = col_number()))
View(User_retention) 

# import user sessions
User_sessions <- read_csv("~/Desktop/DotAlert/Google Analytics/User_sessions.csv", 
                          +     col_types = cols(Year = col_number(), 
                                                 +         Sessions = col_number()))
View(User_sessions)     

# import "where new users come from"
Where_new_users_come_from <- read_csv("~/Desktop/DotAlert/Google Analytics/Where_new_users_come_from.csv", 
                                      +     col_types = cols(Year = col_number(), 
                                                             +         New_users = col_number()))
View(Where_new_users_come_from)      

# chart of new-user traffic
New_user_traffic <- ggplot(data = Where_new_users_come_from) + geom_col(mapping = aes(Channel,New_users, fill = Channel)) + theme_bw()