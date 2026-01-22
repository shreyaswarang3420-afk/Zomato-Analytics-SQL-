create database zomato;
use zomato;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    gender VARCHAR(10),
    city VARCHAR(50),
    dob DATE,
    created_at DATE,
    membership VARCHAR(20),
    referral_code VARCHAR(20)
);
CREATE TABLE Restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    cuisine_type VARCHAR(50),
    rating DECIMAL(3,1),
    city VARCHAR(50),
    delivery_time INT,
    opening_time TIME,
    closing_time TIME,
    is_active BOOLEAN,
    created_at DATE
);
CREATE TABLE Menu_Items (
    item_id INT PRIMARY KEY,
    restaurant_id INT,
    item_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(7,2),
    is_veg BOOLEAN,
    spice_level VARCHAR(20),
    calories INT,
    available BOOLEAN,
    created_at DATE,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    order_date DATETIME,
    payment_method VARCHAR(20),
    order_status VARCHAR(20),
    total_amount DECIMAL(10,2),
    discount DECIMAL(7,2),
    final_amount DECIMAL(10,2),
    delivery_address VARCHAR(150),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    item_id INT,
    quantity INT,
    price DECIMAL(10,2),
    subtotal DECIMAL(10,2),
    taste_preference VARCHAR(20),
    spice_preference VARCHAR(20),
    instructions VARCHAR(100),
    added_at DATETIME,
    FOREIGN KEY(order_id) REFERENCES Orders(order_id),
    FOREIGN KEY(item_id) REFERENCES Menu_Items(item_id)
);
CREATE TABLE Delivery_Partners (
    partner_id INT PRIMARY KEY,
    partner_name VARCHAR(100),
    phone VARCHAR(15),
    vehicle_type VARCHAR(50),
    city VARCHAR(50),
    rating DECIMAL(3,1),
    total_deliveries INT,
    cancelled_deliveries INT,
    joining_date DATE,
    active BOOLEAN
);
CREATE TABLE Deliveries (
    delivery_id INT PRIMARY KEY,
    order_id INT,
    partner_id INT,
    pickup_time DATETIME,
    drop_time DATETIME,
    delivery_status VARCHAR(20),
    distance_km DECIMAL(5,2),
    delivery_charge DECIMAL(7,2),
    tip DECIMAL(7,2),
    created_at DATE,
    FOREIGN KEY(order_id) REFERENCES Orders(order_id),
    FOREIGN KEY(partner_id) REFERENCES Delivery_Partners(partner_id)
);
INSERT INTO Customers VALUES
(1,'Amit Sharma','amit@gmail.com','9876543210','Male','Mumbai','1995-02-10','2023-01-01','Gold','REF001'),
(2,'Riya Kapoor','riya@gmail.com','9865321470','Female','Delhi','1998-06-15','2023-01-02','Silver','REF002'),
(3,'Suresh Kumar','suresh@gmail.com','9856741200','Male','Bangalore','1990-03-22','2023-01-03','Gold','REF003'),
(4,'Priya Singh','priya@gmail.com','9845123090','Female','Hyderabad','1997-09-09','2023-01-04','Bronze','REF004'),
(5,'Rahul Mehta','rahul@gmail.com','9812345670','Male','Mumbai','1994-10-30','2023-01-05','Gold','REF005'),
(6,'Neha Jain','neha@gmail.com','9823645170','Female','Pune','1999-12-02','2023-01-06','Silver','REF006'),
(7,'Karan Patel','karan@gmail.com','9801234567','Male','Ahmedabad','1996-01-15','2023-01-07','Bronze','REF007'),
(8,'Simran Kaur','simran@gmail.com','9898765432','Female','Chandigarh','1997-04-05','2023-01-08','Silver','REF008'),
(9,'Deepak Verma','deepak@gmail.com','9887654321','Male','Jaipur','1993-07-20','2023-01-09','Gold','REF009'),
(10,'Anjali Mishra','anjali@gmail.com','9877654321','Female','Kolkata','1995-11-25','2023-01-10','Silver','REF010');

INSERT INTO Restaurants VALUES
(1,'Pizza Hut','Italian',4.2,'Mumbai',30,'10:00','23:00',TRUE,'2023-01-01'),
(2,'Burger King','Fast Food',4.0,'Delhi',25,'09:00','22:00',TRUE,'2023-01-02'),
(3,'KFC','Non-Veg',4.1,'Bangalore',28,'10:00','22:30',TRUE,'2023-01-03'),
(4,'Behrouz Biryani','Biryani',4.4,'Hyderabad',35,'11:00','23:30',TRUE,'2023-01-04'),
(5,'Subway','Healthy',4.3,'Mumbai',20,'09:00','21:00',TRUE,'2023-01-05'),
(6,'Dominos','Italian',4.0,'Pune',30,'10:00','22:00',TRUE,'2023-01-06'),
(7,'Barbeque Nation','BBQ',4.5,'Delhi',40,'12:00','23:30',TRUE,'2023-01-07'),
(8,'Taco Bell','Mexican',4.2,'Chennai',22,'10:00','22:00',TRUE,'2023-01-08'),
(9,'Haldirams','Indian',4.3,'Nagpur',18,'08:00','21:00',TRUE,'2023-01-09'),
(10,'Wow Momo','Snacks',4.1,'Kolkata',20,'09:00','22:00',TRUE,'2023-01-10');

INSERT INTO Menu_Items VALUES
(1,1,'Farmhouse Pizza','Pizza',350,TRUE,'Medium',650,TRUE,'2023-01-01'),
(2,1,'Veggie Pizza','Pizza',300,TRUE,'Low',550,TRUE,'2023-01-01'),
(3,2,'Whopper Burger','Burger',199,FALSE,'High',750,TRUE,'2023-01-02'),
(4,3,'Zinger Burger','Burger',220,FALSE,'Medium',720,TRUE,'2023-01-03'),
(5,4,'Chicken Biryani','Biryani',250,FALSE,'High',820,TRUE,'2023-01-04'),
(6,5,'Veg Sub','Sandwich',180,TRUE,'Low',400,TRUE,'2023-01-05'),
(7,6,'Paneer Pizza','Pizza',330,TRUE,'Medium',680,TRUE,'2023-01-06'),
(8,7,'Grilled Chicken','BBQ',450,FALSE,'High',900,TRUE,'2023-01-07'),
(9,8,'Taco Supreme','Taco',150,TRUE,'Medium',300,TRUE,'2023-01-08'),
(10,9,'Rajma Chawal','Indian',180,TRUE,'Low',500,TRUE,'2023-01-09');

INSERT INTO Orders VALUES
(1,1,1,'2023-02-01 13:10','UPI','Delivered',500,50,450,'Mumbai'),
(2,2,2,'2023-02-02 14:20','Card','Delivered',300,20,280,'Delhi'),
(3,3,3,'2023-02-03 15:30','Cash','Cancelled',400,0,400,'Bangalore'),
(4,4,4,'2023-02-04 12:40','UPI','Delivered',600,60,540,'Hyderabad'),
(5,5,5,'2023-02-05 18:10','UPI','Delivered',250,10,240,'Mumbai'),
(6,6,6,'2023-02-06 20:10','Card','Delivered',450,30,420,'Pune'),
(7,7,7,'2023-02-07 11:30','Cash','Delivered',900,50,850,'Delhi'),
(8,8,8,'2023-02-08 21:00','UPI','Delivered',350,20,330,'Chandigarh'),
(9,9,9,'2023-02-09 19:20','Card','Delivered',200,0,200,'Nagpur'),
(10,10,10,'2023-02-10 22:10','Card','Cancelled',400,0,400,'Kolkata');

INSERT INTO Order_Items VALUES
(1,1,1,1,350,350,'Normal','Medium','No onion','2023-02-01 13:10'),
(2,2,3,1,199,199,'Crispy','High','Extra cheese','2023-02-02 14:20'),
(3,3,4,2,220,440,'Crispy','Medium','No mayo','2023-02-03 15:30'),
(4,4,5,1,250,250,'Spicy','High','Extra masala','2023-02-04 12:40'),
(5,5,6,2,180,360,'Fresh','Low','Less salt','2023-02-05 18:10'),
(6,6,7,1,330,330,'Normal','Medium','Cut small','2023-02-06 20:10'),
(7,7,8,1,450,450,'Smoky','High','Well cooked','2023-02-07 11:30'),
(8,8,9,2,150,300,'Cheesy','Medium','Extra sauce','2023-02-08 21:00'),
(9,9,10,1,180,180,'Home-style','Low','No spice','2023-02-09 19:20'),
(10,10,2,1,300,300,'Soft','Low','Extra veggies','2023-02-10 22:10');

INSERT INTO Delivery_Partners VALUES
(1,'Rohit Kumar','9991112222','Bike','Mumbai',4.5,500,10,'2022-01-01',TRUE),
(2,'Aman Singh','9991113333','Scooter','Delhi',4.2,300,15,'2022-01-02',TRUE),
(3,'Vikas Yadav','9991114444','Bike','Bangalore',4.7,450,8,'2022-01-03',TRUE),
(4,'Neeraj Gupta','9991115555','Car','Hyderabad',4.3,200,20,'2022-01-04',TRUE),
(5,'Mohit Sharma','9991116666','Bike','Pune',4.6,350,12,'2022-01-05',TRUE),
(6,'Rahul Nair','9991117777','Scooter','Mumbai',4.1,250,25,'2022-01-06',TRUE),
(7,'Sanjay Verma','9991118888','Bike','Delhi',4.0,300,18,'2022-01-07',TRUE),
(8,'Ravi Choudhary','9991119999','Bike','Chandigarh',4.4,280,10,'2022-01-08',TRUE),
(9,'Aditya Das','8881119999','Bike','Nagpur',4.5,260,5,'2022-01-09',TRUE),
(10,'Kunal Patil','7771119999','Scooter','Kolkata',4.3,220,6,'2022-01-10',TRUE);

INSERT INTO Deliveries VALUES
(1,1,1,'2023-02-01 13:20','2023-02-01 13:50','Delivered',5.2,30,20,'2023-02-01'),
(2,2,2,'2023-02-02 14:30','2023-02-02 14:55','Delivered',3.5,25,15,'2023-02-02'),
(3,3,3,'2023-02-03 15:45','2023-02-03 16:20','Cancelled',4.2,0,0,'2023-02-03'),
(4,4,4,'2023-02-04 12:50','2023-02-04 13:30','Delivered',6.1,35,10,'2023-02-04'),
(5,5,5,'2023-02-05 18:20','2023-02-05 18:45','Delivered',2.9,20,5,'2023-02-05'),
(6,6,6,'2023-02-06 20:20','2023-02-06 20:50','Delivered',3.8,25,12,'2023-02-06'),
(7,7,7,'2023-02-07 11:45','2023-02-07 12:25','Delivered',5.5,30,18,'2023-02-07'),
(8,8,8,'2023-02-08 21:10','2023-02-08 21:40','Delivered',4.0,22,8,'2023-02-08'),
(9,9,9,'2023-02-09 19:30','2023-02-09 19:55','Delivered',3.3,18,5,'2023-02-09'),
(10,10,10,'2023-02-10 22:20','2023-02-10 22:50','Cancelled',4.8,0,0,'2023-02-10');

-- A. JOINS (5 Questions)
-- 1️ List all orders with customer names and restaurant names.
SELECT o.order_id, c.full_name, r.restaurant_name, o.final_amount
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Restaurants r ON o.restaurant_id = r.restaurant_id;

-- 2 Show menu items ordered along with the restaurant name.
SELECT oi.order_item_id, mi.item_name, r.restaurant_name, oi.quantity
FROM Order_Items oi
JOIN Menu_Items mi ON oi.item_id = mi.item_id
JOIN Restaurants r ON mi.restaurant_id = r.restaurant_id;

-- 3 Get all deliveries with partner names and customer city.
SELECT d.delivery_id, dp.partner_name, c.city, d.delivery_status
FROM Deliveries d
JOIN Delivery_Partners dp ON d.partner_id = dp.partner_id
JOIN Orders o ON d.order_id = o.order_id
JOIN Customers c ON o.customer_id = c.customer_id;

-- 4️ Find orders with total item count per order.
SELECT o.order_id, c.full_name, SUM(oi.quantity) AS total_items
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Order_Items oi ON o.order_id = oi.order_id
GROUP BY o.order_id;

-- 5 list restaurants with number of items in their menu.
SELECT r.restaurant_name, COUNT(mi.item_id) AS total_items
FROM Restaurants r
LEFT JOIN Menu_Items mi ON r.restaurant_id = mi.restaurant_id
GROUP BY r.restaurant_id;

-- B. AGGREGATION & GROUP BY (5 Questions)
-- 6 Count how many customers are in each city.
SELECT city, COUNT(customer_id) AS total_customers
FROM Customers
GROUP BY city;

-- 7️ Find average restaurant rating city-wise.
SELECT city, AVG(rating) AS avg_rating
FROM Restaurants
GROUP BY city;

-- 8 Total revenue generated by each restaurant.
SELECT r.restaurant_name, SUM(o.final_amount) AS total_revenue
FROM Orders o
JOIN Restaurants r ON o.restaurant_id = r.restaurant_id
WHERE o.order_status = 'Delivered'
GROUP BY r.restaurant_id;

-- 9️ Count orders by payment method.
SELECT payment_method, COUNT(order_id) AS total_orders
FROM Orders
GROUP BY payment_method;

-- 10 Highest, lowest, and average menu price for each category.
SELECT category,
       MAX(price) AS max_price,
       MIN(price) AS min_price,
       AVG(price) AS avg_price
FROM Menu_Items
GROUP BY category;

-- C. SUBQUERIES (5 Questions)
-- 11 Find customers who spent more than the average order amount.
SELECT full_name, customer_id
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
    GROUP BY customer_id
    HAVING SUM(final_amount) > (SELECT AVG(final_amount) FROM Orders));

-- 12 List restaurants with rating above the overall average rating.
SELECT restaurant_name, rating
FROM Restaurants
WHERE rating > (SELECT AVG(rating) FROM Restaurants);

-- 13 Get the most expensive item from every restaurant.
SELECT item_name, price, restaurant_id
FROM Menu_Items
WHERE price = (
    SELECT MAX(price)
    FROM Menu_Items mi
    WHERE mi.restaurant_id = Menu_Items.restaurant_id);

-- 14 Find customers who placed more orders than the average number of orders.
SELECT customer_id, full_name
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
    GROUP BY customer_id
    HAVING COUNT(order_id) >
           (SELECT AVG(cnt) FROM (SELECT COUNT(order_id) AS cnt FROM Orders GROUP BY customer_id) x));

-- 15 Find delivery partners who completed more deliveries than partner average.
SELECT partner_name, total_deliveries
FROM Delivery_Partners
WHERE total_deliveries > (
    SELECT AVG(total_deliveries) FROM Delivery_Partners);

-- D. WINDOW FUNCTIONS (5 Questions)
-- 16 Rank restaurants by rating (highest → lowest).
SELECT restaurant_name, rating,
       RANK() OVER (ORDER BY rating DESC) AS rating_rank
FROM Restaurants;

-- 17 Find running total of revenue by date.
SELECT order_date, final_amount,
       SUM(final_amount) OVER (ORDER BY order_date) AS running_total
FROM Orders;

-- 18 Show customer total spending and rank customers by spending.
SELECT c.full_name,
       SUM(o.final_amount) AS total_spent,
       RANK() OVER (ORDER BY SUM(o.final_amount) DESC) AS spending_rank
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- 19 Show each delivery partner with percentage of cancelled deliveries.
SELECT partner_name,
       total_deliveries,
       cancelled_deliveries,
       (cancelled_deliveries * 100.0 / total_deliveries)
         AS cancel_percentage,
       NTILE(4) OVER (ORDER BY (cancelled_deliveries * 100.0 / total_deliveries))
         AS performance_quartile
FROM Delivery_Partners;

-- 20 Find the most ordered item with rank.
SELECT mi.item_name,
       SUM(oi.quantity) AS total_ordered,
       RANK() OVER (ORDER BY SUM(oi.quantity) DESC) AS popularity_rank
FROM Order_Items oi
JOIN Menu_Items mi ON oi.item_id = mi.item_id
GROUP BY mi.item_name;


select * from Customers;
describe  Customers;
describe  Restaurants;
describe Menu_Items;
describe Orders;
describe Order_Items;
describe Delivery_Partners;
describe Deliveries;

select * from Customers;
select * from Restaurants;
select * from Menu_Items;
select * from Orders;
select * from Order_Items;
select * from Delivery_Partners;
select * from Deliveries;