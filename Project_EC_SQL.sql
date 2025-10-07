use olist_store_analysis;

-- Question 1. Weekday Vs Weekend (order_purchase_timestamp) Payment Statistics.

SELECT 
    Day_Type, 
    CONCAT(ROUND(SUM(payment_value)/1000000, 1), 'M') AS Total_Value
FROM `e-commerce`
WHERE Day_Type IN ("weekday","weekend")
GROUP BY Day_Type;


--  Questions 2.Number of Orders with review score 5 and payment type as credit card.

SELECT 
    Payment_Type, 
    Review_Score, 
    CONCAT(ROUND(COUNT(order_id)/1000, 2), 'K') AS No_of_Orders
FROM `e-commerce`
WHERE Review_Score = 5 AND Payment_Type = "credit_card"
GROUP BY Payment_Type, Review_Score;


-- Question 3. Average number of days taken for order_delivered_customer_date for pet_shop

SELECT 
    Product_category_name,
    round(AVG(delivery_days)) AS avg_delivery_days
FROM `e-commerce`
WHERE product_category_name = 'pet_shop'
GROUP BY product_category_name;

--  Question 4. Average price and payment values from customers of sao paulo city.

select Customer_City, round(avg(price),2) As Avg_Price, 
round(avg(payment_value),2) as Avg_Payment_Value from `e-commerce`
where customer_city = "sao paulo" 
group by customer_city;

--  Question 5. Relationship between shipping days (order_delivered_customer_date - order_purchase_timestamp) Vs review scores.

select Review_Score, round(avg(shipping_days)) as Avg_of_Shipping_Days 
from `e-commerce`
group by review_Score order by review_score;


select * from `e-commerce`;

--  Total Revenue

select concat(round(sum(payment_Value)/1000000,2),'M') as Total_Revenue from `e-commerce`;

--  Average Price

select round(avg(price),2) as Avg_Price from `e-commerce`;

