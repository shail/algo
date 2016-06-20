# Main Use case
# - user should be able to post a review
# - user should be able to see all reviews for a product
# - user should be able to see all reviews for their purchased products
# - user should be able to see all reviews they've written
# - users should be able to do upvote reviews
#
# Constraints
# - 300 million MAUs -- so roughly around 90 million DAUs
# - Not many people write user reviews so probably around 1% of these users write reviews 900k new reviews a day
# - 900k new reviews, a lot of these reviews are large, 900k * 20000 chars * 2 bytes per char = 36 GB per day
# - 36 * 365 * 5 = 65.7 TB for 5 years of data
# - 90k * 10MB = 900000 MB = 1 TBs per day * 365 * 5 = ~1800 TBs
# - 90 million DAUs, probably looking at 6 products on average, 540 million reads per day, most traffic over 8
# hours in the US ~18000 QPS, shouldn't be very bursty but should be able to handle more as this is an average
#
# Users
#
# GET /users -- returns all users
# GET /users/5 -- retrieve a user by id
# POST /users -- takes a user resource and creates a user
# PUT /users/5 -- takes a user resource and updates user 5
# DELETE /users/5 -- deletes a specific user
#
# fields
# id -- int
# username -- string
# first_name -- string
# last_name -- string
# address -- string
#
# Purchased Products
# GET /users/purchased_products -- returns all purchased products for users
# GET /users/5/purchased_products -- returns all purchased products for user #5
# POST /users/5/purchased_product -- create a purchased product for a specific user
# PUT /users/5/purchased_product/6 -- updated a specific purchased product for specific user
# DELETE /users/5/purchased_product/6 -- delete a specific purchased product for a specific user
#
# user_id -- int
# product_id -- int
# price -- float
# date -- datetime
#
# Products
# GET /products -- returns all possible products
# GET /products/5 -- specific product
# POST /products -- create a product entry
# PUT /products/5 -- update specific product
# DELETE /products/5 -- delete a specific product
#
# product_id -- int
# name -- string
# description -- string
# current_price -- float
# category -- string
#
# Reviews
# GET /reviews -- returns all possible reviews
# GET /reviews/5 -- specific review
# POST /reviews -- create a review entry
# PUT /reviews/5 -- update specific review
# DELETE /reviews/5 -- delete a specific review
#
# review_id -- int
# user_id -- int
# product_id -- int
# title -- string
# images -- [cdn_url1,cdn_url2,cdn_url3]
# review_text -- string
# created_at -- datetime
# updated_at -- datetime
#
# User Reviews -- Purchased Products
# GET /users/purchased_products/reviews -- returns all users reviews for all purchased products
# GET /users/5/purchased_products/reviews -- all reviews for a specific user
# GET /users/5/purchased_products/6/reviews -- user review for a specific purchased product
# POST /users/5/purchased_products/6/reviews -- create user review for a product
# PUT /users/5/purchased_products/6/reviews -- update user review for a product
# DELETE /users/5/purchased_products/6/reviews -- delete user review for a product
#
# User Reviews -- All products
# GET /users/5/products/reviews -- returns all user reviews for all products
# GET /users/5/products/6/reviews -- user review for a specific product
# POST /users/5/products/6/reviews -- create user review for a product
# PUT /users/5/products/6/reviews -- update user review for a product
# DELETE /users/5/products/6/reviews -- delete user review for a product
#
# Product Reviews
# GET /products/reviews -- all product reviews
# GET /products/5/reviews -- all reviews for a specific product
# GET /products/5/reviews/6 -- specific review for specific product
# POST /products/5/reviews -- create new review for a product
# PUT /products/5/reviews/6/ -- edit specific review for a product
# DELETE /products/5/reviews/6 -- delete a specific review
#
# 20,50,100
# ?limit=20
# ?offest=20
# ?sort_by=created_at&order_by=desc
#
# PUT /products/5/reviews/6
#
# Rating
# GET /reviews/:review_id/rating
#
# review_id - int
# upvotes - int
# downvotes - int
#
# GET /v1/reviews
# GET /v2/reviews
