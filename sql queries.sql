create database ola
use ola;

select * from booking;

create view Successful_Booking as
SELECT * 
FROM booking 
WHERE Booking_status = 'Success';


create view AVG_DIST_FOR_DIFF_VEHICLE_TYPE as
select vehicle_type,avg(Ride_Distance) as AVERAGE_DISTANCE from booking
group by vehicle_type;

create view CANCELLED_RIDES_BY_CUSTOMER as
select sum(Cancelled_Rides_by_Customer) as CANCELLED_RIDES_BY_CUSTOMER
from booking;

create view TOP_5_CUSTOMERS as
select Customer_ID,count(Customer_ID) as BOOKINGS
from booking
group by Customer_ID
order by BOOKINGS DESC limit 5;
select * from TOP_5_CUSTOMERS;


create view CANCELLED_BY_DRIVER_DUE_TO_C_ISSUES as
select count(*)  from booking 
where Reason_for_cancelling_by_Driver='Customer issue';


create view MAX_MIN_D_RATING_PS as
select max(Driver_Ratings) as MAX_RATING,
min(Driver_Ratings) as MIN_RATING
from booking where Vehicle_Type='Prime Sedan';

create view AVG_C_RATING_FOR_VT as
select vehicle_type,avg(Customer_Rating) as AVG_CUSTOMER_RATING
from booking
group by vehicle_type;


create view SUCCESS_RIDES_VALUE as
select sum(Booking_Value) AS SUCCESSFULL_RIDE_VALUE 
from booking
where Booking_Status='Success';

create view INCOMPLEATE_RIDES as 
select Booking_ID,Incomplete_Rides,Incomplete_Rides_Reason
from booking
where Incomplete_Rides !=0;

select Booking_ID,Incomplete_Rides,Incomplete_Rides_Reason
from booking
where Incomplete_Rides !=0;

create view Bike_Revenue as
select sum(Booking_Value) as  BIKE_REVENUE
from booking
where Vehicle_type="Bike";


#1. Retrieve all successful bookings:
select * from Successful_Booking;
#2. Find the average ride distance for each vehicle type:
select * from AVG_DIST_FOR_DIFF_VEHICLE_TYPE;
#3. Get the total number of cancelled rides by customers:
select * from CANCELLED_RIDES_BY_CUSTOMER;
#4. List the top 5 customers who booked the highest number of rides:
select * from TOP_5_CUSTOMERS;
#5. Get the number of rides cancelled by drivers due to Customer issues:
select * from CANCELLED_BY_DRIVER_DUE_TO_C_ISSUES;
#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
select * from MAX_MIN_D_RATING_PS;
#7. Find the average customer rating per vehicle type:
select * from AVG_C_RATING_FOR_VT;
#8. Calculate the total booking value of rides completed successfully:
select * from  SUCCESS_RIDES_VALUE;
#9. List all incomplete rides along with the reason:
select * from INCOMPLEATE_RIDES;
#10. Find the revenue by Bike Rides 
select * from Bike_Revenue;

