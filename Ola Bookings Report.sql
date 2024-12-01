create database Ola_Analysis;
use Ola_Analysis;

#Q1- Retrive all sucessfull bookings?
CREATE VIEW Sucessfull_Bookings AS
    SELECT 
        *
    FROM
        bookings
    WHERE
        Booking_Status = 'Success';

select * from Sucessfull_Bookings;

----------------------------------------------------------------------------------------------

#Q2- Find the average ride distance from each vehicle type?
CREATE VIEW Average_ride_distance_from_each_vehicle AS
    SELECT 
        Vehicle_Type, AVG(Ride_Distance) AS Average_Distance
    FROM
        bookings
    GROUP BY Vehicle_Type;

select * from Average_ride_distance_from_each_vehicle;

---------------------------------------------------------------------------------------------

#Q3- Get the total number of cancelled rides by customer?
CREATE VIEW cancelled_rides_by_customer AS
    SELECT 
        COUNT(*) AS Total_number
    FROM
        bookings
    WHERE
        Booking_Status = 'canceled by Customer';

select *  from cancelled_rides_by_customer;

---------------------------------------------------------------------------------------------

#Q4- List the top 5 Customer who booked the highest number of rides?
CREATE VIEW Top_5_Customer AS
    SELECT 
        Customer_ID, COUNT(Booking_ID) AS Highest_Rides
    FROM
        bookings
    GROUP BY Customer_ID
    ORDER BY COUNT(Booking_ID) DESC
    LIMIT 5;

select * from Top_5_Customer;

--------------------------------------------------------------------------------------------

#Q5- Get the number of rides cancelled by driver due to personal and car related issues?
CREATE VIEW Number_of_rides_cancelled_by_driver AS
    SELECT 
        COUNT(*)
    FROM
        bookings
    WHERE
        Canceled_Rides_by_Driver = 'Personal & Car related issue';

select * from Number_of_rides_cancelled_by_driver;

--------------------------------------------------------------------------------------------

#Q6- Find the maximum and minimum driver ratings for prime sedan bookings?
CREATE VIEW Maximum_and_minimum_driver_ratings_for_prime_sedan AS
    SELECT 
        Vehicle_Type,
        MAX(Driver_Ratings) AS Max_rating,
        MIN(Driver_Ratings) AS Mini_rating
    FROM
        bookings
    WHERE
        Vehicle_Type = 'Prime Sedan';

select * from Maximum_and_minimum_driver_ratings_for_prime_sedan;

--------------------------------------------------------------------------------------------

#Q7- Retrive all rides where payment was made using UPI?
CREATE VIEW All_rides_payment_by_UPI AS
    SELECT 
        *
    FROM
        bookings
    WHERE
        Payment_Method = 'UPI';

select * from All_rides_payment_by_UPI;

--------------------------------------------------------------------------------------------

#Q8- Find the average customer rating per vehicle type?
CREATE VIEW Avg_Customer_Rating AS
    SELECT 
        AVG(Customer_Rating) AS Avg_Customer_Rating, Vehicle_Type
    FROM
        bookings
    GROUP BY Vehicle_Type;

select * from Avg_Customer_Rating;

----------------------------------------------------------------------------------------------

#Q9- Calculate the total booking value  of rides complete sucessfully?
CREATE VIEW Total_Sucessful_value AS
    SELECT 
        SUM(Booking_Value) AS Total_Sucessful_value, Booking_Status
    FROM
        bookings
    WHERE
        Booking_Status = 'Success';

select * from Total_Sucessful_value;

--------------------------------------------------------------------------------------------

#Q10- List all incomplete rides aong with the reason?
CREATE VIEW Incomplete_rides_aong_with_the_reason AS
    SELECT 
        Booking_ID, Incomplete_Rides_Reason
    FROM
        bookings
    WHERE
        Incomplete_Rides = 'Yes';

select * from Incomplete_rides_aong_with_the_reason;

