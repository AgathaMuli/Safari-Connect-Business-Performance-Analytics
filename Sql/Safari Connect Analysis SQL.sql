
set search_path to safari_connect;

select * from bookings;
select * from v_clean_trips;

/*Q1.Route Analysis 
Which routes earn the most?
Which are most popular? 
Which is most efficient per seat sold?*/

--Route Analysis Which routes earn the most?
--Step 1; Calculate total fare per route
--Step 2; Order by total_fare_per_route desc to show order from Highest to lowest earner per route
--Answer;
--1.RT001, route_from Nairobi, route_to Mombasa is the HIGHEST earner with a Total Revenue of Ksh. 51,600

	select 
	route_code, 
	route_from, 
	route_to,
	sum(calculated_fare) as total_fare_per_route
from v_clean_trips
group by route_code,route_from,route_to
order by total_fare_per_route desc;

---which route is most popular
--Step 1; find the total bookings per route as num_bookings
--Step 2; Find total passengers carried per route as total_seats_sold
--Step 3; Order by total_seats_sold desc to show highest to lowest
--Answer; 
--1.RT005, route_from Nairobi, route_to Thika is the MOST popular with a Total BOOKING of 35 and 71 seats sold 
--This shows popularity by booking frequency/demand for the route as a product and by number of seats sold/total passengers ferried.

select
    route_code,
    route_from,
    route_to,
    COUNT(booking_id) AS num_bookings,
    SUM(seats_booked) AS total_seats_sold
from v_clean_trips 
group by route_code, route_from, route_to
order by total_seats_sold desc;

--Which route is most efficient per seat sold?
--Step 1; Find total seats sold per route as total_seats_sold
--Step 2; Find average rating per trip for every route as avg_rating
--Step 3; Find how much money is made per seat for every route as revenue_per_seat
--Answer; RT001, Nairobi to Mombasa is the MOST efficient per seats sold. 
--This is because it generates the highest revenue_per_seat at Ksh. 1,258.54

select
    route_code,
    route_from,
    route_to,
    SUM(seats_booked) AS total_seats_sold,
    ROUND(AVG(trip_rating), 2) AS avg_rating,
    ROUND(SUM(calculated_fare) / NULLIF(SUM(seats_booked), 0), 2) AS revenue_per_seat
from v_clean_trips
group by  route_code, route_from, route_to
order by revenue_per_seat desc;


--Q2.
--=QUESTIONS 2 
--Who are the best drivers? Kelvin Omondi, with 36 total trips,73 seats served, total revenue of 33,115 and an average rating of 4.5
-- Does driver rating affect passenger satisfaction? ========================

select 
    driver_name,
    count(*) as total_trips,
    sum(seats_booked) as total_seats_served,
    sum(total_fare) as total_revenue,
    round(avg(driver_rating), 2) as average_rating
from bookings
where coalesce(lower(booking_status), '') not in ('cancelled', 'canceled')
group by driver_name
order by total_revenue desc;

-- Does driver rating affect passenger satisfaction? 
--No, it does not.
/*
Close to +1 → strong positive correlation (higher driver_rating → higher trip_rating)
Close to 0 → little to no correlation — this would actually support your "No" conclusion
Close to -1 → inverse relationship*/

--Answer; Based on our reuluts (-0.11453348170027827) The answer is No, 
--There is no direct correlation with driver rating and customer satisfaction

select corr(driver_rating, trip_rating) as correlation_coefficient
from v_clean_trips
where trip_rating is not null; 

--Q3. Revenue Trends 
-- How is revenue changing month by month? it flactuating between profits and losses
-- What are our best and worst months? best month is September with a 38 pct growth in revenue, 
-- worst month is January with a -91 pct growth in revenue

with monthly_revenue as (
    select 
        date_trunc('month', departure_date) as month,
        sum(total_fare) as revenue
    from v_clean_trips 
    group by date_trunc('month', departure_date)
)
select
    to_char(month, 'YYYY-MM') as month,
    revenue,
    lag(revenue) over (order by month) as prev_month_revenue,
    round(
        100.0 * (revenue - lag(revenue) over (order by month))
        / nullif(lag(revenue) over (order by month), 0),
    2) as pct_growth
from monthly_revenue
order by month;


/*Q4 Passenger Insights; Where do passengers come from? 
 What seat class do they prefer? 
 Are they satisfied?*/

--Where do most passengers come from?
-- Step 1; find total seats sold as total_passengers
-- Step 2; show per route_from and passenger city
-- Step 3; order by total_passengers desc
--Answer ; Nairobi, with total passengers at 193

select
    route_from,
    passenger_city,
    SUM(seats_booked) as total_passengers
from v_clean_trips
group by route_from, passenger_city
order by total_passengers desc;

-- What seat class do they prefer? 
select
    seat_class,
    count(booking_id) as total_bookings
from v_clean_trips
group by seat_class
order by total_bookings desc;

--Are they satisfied?
--Answer; the feedback from customers who are satisfied (114 passengers) is higher than thise who are neutral (72 passengers), 
--Unsatisfied (48 passengers) or those who gave no rating (14 passengers)

select
    satisfaction,
    count(booking_id) as total_trips
from v_clean_trips
group by satisfaction
order by total_trips desc;

--to compare gender and class
select
    passenger_gender,
    seat_class,
    count(booking_id) as total_bookings
from v_clean_trips
group by passenger_gender, seat_class
order by passenger_gender, seat_class, total_bookings desc;

----Q5. Cancellations 
-- What is the cancellation rate per route? 
-- How much revenue did cancellations cost us?
-- Write a CTE to calculate cancellation rate per route
with route_totals as (
    select
        route_code,
        count(*) AS total_bookings,
        count(*) filter (where booking_status in ('Cancelled', 'No Show')) as cancelled_bookings,
        sum(total_fare) filter (where booking_status in ('Cancelled', 'No Show')) as lost_revenue
    from bookings
    group by route_from, route_to, route_code
)
select
    route_code,
    total_bookings,
    cancelled_bookings,
    round(cancelled_bookings * 100.0 / total_bookings, 2) as cancellation_rate_pct,
    lost_revenue
from route_totals
order by cancellation_rate_pct desc;

-- Total lost revenue across all routes
select
    sum(total_fare) AS total_lost_revenue
from safari_connect.clean_bookings
where booking_status in ('Cancelled', 'No Show');

--Q6. Operational Patterns 
--What are our busiest days?
--The Busiest is Wednesday with the highest total bookings and highest total passengers
select
    day_name,
    count(booking_id) as total_bookings,
    sum(seats_booked) as total_passengers
from v_clean_trips
group by day_name
order by total_bookings desc;

--What are our busiest times?
--Answer;
select
	day_name,
    extract(hour from departure_time::time) as hour_of_day,
    count(*) as total_bookings,
    sum(seats_booked) AS total_passengers
from v_clean_trips
group by day_name, extract(hour from departure_time::time)
order by total_passengers desc;

---When should we add more vehicles?
-- Answer; 07 as the travel month and Wednesday as the travel day to add more vehicles
select
    travel_month,
    trim(day_name) as day_name,
    sum(seats_booked) as total_passengers
from v_clean_trips
group by travel_month, TRIM(day_name)
order by total_passengers desc
LIMIT 10;

select all driver_name,
driver_rating
from v_clean_trips 
where driver_rating >=4.5
group by driver_name;

