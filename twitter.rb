# Main use cases for twitter
# - posting new tweets
# - following a user
# - seeing a feed of tweets of your followers
# - display user and user data
# - favoriting a tweet
#
# Constraints
# - 100 million DAUs
# - 100 million tweets per day
# - Using 70/30 rule -- total number of reads is ~330 million per day
# - 200 million favorites per day (every tweet will be favorited twice on average)
# - Each user on average follow 200 other users on average
# - 300 million total users * 200 == 60 billion edges graph
#
# Handling User Requests
# - At around 400 million total requests (read/write) a day that would be ~4600 QPS, but obviously the traffic
# isn't distributed evenly. Therefore the app should be able to handle a lot more than that, in the 10-20k QPS
# range. Mostly we are going to be making read requests, so the need for caching will be important.
#
# Storing Data
# We expect around 310-350 million total users, and we will need to store some sort of profile metadata for
# them. That shouldn't be a problem. 100 million tweets a day, so ~36.5 billion tweets in a year. We will want
# a solution that can effectively store about 183 billion (5 years) tweets. Twitter allows you to store 140
# characters so if we assume 2 bytes per character and no compression we need
# (140 * 183 billion) * 2 bytes == 51.24 TBs of text
# (183 billion * 0.10) * 10 MB == 183 petabytes
#
# There are the connections between users and the favorites of tweets as well. The connections should be
# around 60 billion, with each connection containing two user IDs, so two 4-byte integer fields.  60 billion *
# 8 = 480 billion btyes == 48 GBs
#
# 200 million tweet favorites per day. So for a year there will be 73 billion connections. If we want to store
# favorites for 5 years as well we will need one 8 byte integer for the tweet ID and 4 byte integer for the
# user ID. 12 * 365 billion = 4.38 TBs
#
# To scale the database we will have to make sure to have correct indicies in place. Make sure we are using
# SSDs.
