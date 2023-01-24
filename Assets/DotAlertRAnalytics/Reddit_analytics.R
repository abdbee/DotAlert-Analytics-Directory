library(readr)
Q4_2022_dotalert_reddit_data_Sheet1 <- read_csv("~/Desktop/DotAlert/Reddit_analytics/Q4_2022_dotalert_reddit_data - Sheet1.csv", col_types = cols(View = col_number(), Comment = col_number(), Upvote = col_number(), Shares = col_number()))
View(Q4_2022_dotalert_reddit_data_Sheet1) 

# group by year and get aggregate
Reddit_aggregate_by_year <- Q4_2022_dotalert_reddit_data_Sheet1 %>% drop_na() %>% group_by(Month) %>% summarize(Number_of_post = n(), Total_views = sum(View), total_comments = sum(Comment), total_upvotes = sum(Upvote), total_shares = sum(Shares)) %>% as.data.frame()
View(Reddit_aggregate_by_year)

# group by subreddit and get aggregate
Reddit_aggregate_by_subreddit <- Q4_2022_dotalert_reddit_data_Sheet1 %>% drop_na() %>% group_by(Subreddit) %>% summarize(Number_of_post = n(), Total_views = sum(View), total_comments = sum(Comment), total_upvotes = sum(Upvote), total_shares = sum(Shares)) %>% as.data.frame()
View(Reddit_aggregate_by_subreddit)

#group by category and get aggregate
Reddit_aggregate_by_category <- Q4_2022_dotalert_reddit_data_Sheet1 %>% drop_na() %>% group_by(Category) %>% summarize(Number_of_post = n(), Total_views = sum(View), total_comments = sum(Comment), total_upvotes = sum(Upvote), total_shares = sum(Shares)) %>% as.data.frame()
View(Reddit_aggregate_by_category)



#add ratios to aggregates
Reddit_aggregate_by_year <- Reddit_aggregate_by_year %>% mutate(view_postNumber_ratio = Total_views/Number_of_post, comments_postNumber_ratio = total_comments/Number_of_post, upvote_postNumber_ratio = total_upvotes/Number_of_post, shares_postNumber_ratio = total_shares/Number_of_post)
View(Reddit_aggregate_by_year)

Reddit_aggregate_by_subreddit <- Reddit_aggregate_by_subreddit %>% mutate(view_postNumber_ratio = Total_views/Number_of_post, comments_postNumber_ratio = total_comments/Number_of_post, upvote_postNumber_ratio = total_upvotes/Number_of_post, shares_postNumber_ratio = total_shares/Number_of_post)
View(Reddit_aggregate_by_subreddit)

Reddit_aggregate_by_category <- Reddit_aggregate_by_category %>% mutate(view_postNumber_ratio = Total_views/Number_of_post, comments_postNumber_ratio = total_comments/Number_of_post, upvote_postNumber_ratio = total_upvotes/Number_of_post, shares_postNumber_ratio = total_shares/Number_of_post)
View(Reddit_aggregate_by_category)



ggplot(data = Reddit_aggregate_by_year) + geom_col(mapping = aes(Month, Total_views, fill = Month)) + geom_col(mapping = aes(Month, view_postNumber_ratio, fill = Month)) + theme_bw()


