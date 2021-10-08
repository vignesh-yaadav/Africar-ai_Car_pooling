
CREATE TABLE trip_data1_2010(medallion VARCHAR(20),hack_license VARCHAR(20), vendor_id varchar(10),rate_code INT,
store_and_fwd_flag varchar(5),pickup_datetime datetime, dropoff_datetime datetime,passenger_count INT,trip_time_in_secs INT,
trip_distance DOUBLE,pickup_longitude DECIMAL(20,10),pickup_latitude DECIMAL(20,10), dropoff_longitude DECIMAL(20,10),
dropoff_latitude DECIMAL(20,10))

LOAD DATA LOCAL INFILE 'D:/FOIL2013/trip_data_1/trip_data_1.csv' 
INTO TABLE trip_data1_2010 FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n' IGNORE 1 LINES

CREATE TABLE jfk_data1_2010 AS SELECT *, ( 3959 * acos ( cos ( radians(40.645574) ) * cos( radians( pickup_latitude ) ) 
* cos( radians( pickup_longitude ) - radians(-73.784866) ) + sin ( radians(40.645574) ) * sin( radians( pickup_latitude ) ) ) )
 AS distance FROM trip_data1_2010 HAVING distance < 2 and passenger_count<=4
 
