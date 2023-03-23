library(tidyverse)
library(readr)


General_twitter_analytics <- read_csv("~/Desktop/DotAlert/Twitter_analytics/General_twitter_analytics.csv", col_types = cols(`Tweets published` = col_number(), impressions = col_number(), engagements = col_number(), retweets = col_number(), replies = col_number(), likes = col_number(), `user profile clicks` = col_number(), `url clicks` = col_number()))
View(General_twitter_analytics)  


#import individual tweets data and mutate data to display day
Individual_tweets <- read_csv("~/Desktop/DotAlert/Twitter_analytics/Individual_tweets.csv", col_types = cols(impressions = col_number(), engagements = col_number(), `engagement rate` = col_number())) %>% mutate(Day = weekdays(time), Month = format(as.POSIXct(time), "%B"))
Individual_tweets <- Individual_tweets %>% mutate(Year =format(as.POSIXct(time), "%Y"), MonthYear = paste(Month, "-", Year))
View(Individual_tweets) 


#select some columns of "general twitter analytics to analyze"
General_twitter_analytics_short <-General_twitter_analytics[c(1,2,3,4,5,6,7,8,9,10)]
View(General_twitter_analytics_short)

# mutate general twitter analytics to display the day
General_twitter_analytics_short <- General_twitter_analytics_short %>% mutate(Day = weekdays(Date), Month = format(as.POSIXct(Date), "%B"))
View(General_twitter_analytics_short)


# relationship between engagements, impression and number of re-tweets
engagements_rel <- ggplot(data = Individual_tweets) + geom_point(mapping = aes(impressions, engagements, color = retweets)) + facet_wrap(~factor (MonthYear,levels = c('September - 2022','October - 2022','November - 2022','December - 2022','January - 2023','February - 2023','March - 2023')), nrow = 2) + theme_bw()

# relationship between engagements, impressions and day of posting
engagement_rel_day <- ggplot(data = Individual_tweets) + geom_point(mapping = aes(impressions, engagements, color = Day)) + facet_wrap(~factor (MonthYear,levels = c('September - 2022','October - 2022','November - 2022','December - 2022','January - 2023','February - 2023','March - 2023')), nrow = 2) + theme_bw()

# relationship between engagements, impression and number of re-tweets for one month
engagements_rel_month <- Individual_tweets %>% filter(MonthYear %in% c("February - 2023", "March - 2023")) %>% ggplot() + geom_point(mapping = aes(impressions, engagements, color = retweets)) + facet_wrap(~factor (MonthYear,levels = c('February - 2023','March - 2023')), nrow = 2) + theme_bw()

# relationship between engagements, impressions and day of posting for one month
engagement_rel_day_month <- Individual_tweets %>% filter(MonthYear %in% c("February - 2023", "March - 2023")) %>% ggplot() + geom_point(mapping = aes(impressions, engagements, color = Day)) + facet_wrap(~factor (MonthYear,levels = c('February - 2023','March - 2023')), nrow = 2) + theme_bw()


# average engagements
Average_engagement <- mean(Individual_tweets$engagements)

#average tweet impressions
Average_impressions <- mean(Individual_tweets$impressions)

#individual month average impressions
Monthly_imp <- Individual_tweets %>% filter(Month == "March")
avg_monthly_imp <- mean(Monthly_imp$impressions)

