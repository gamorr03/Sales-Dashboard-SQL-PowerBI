SELECT count(*) AS total_rows
FROM sales;

SELECT *
FROM sales
LIMIT 10;

PRAGMA table_info(sales);

SELECT
	order_id,
	product_name,
	quantity,
	unit_price,
	discount
FROM sales
LIMIT 10;

SELECT
	order_id,
	product_name,
	quantity,
	unit_price,
	discount,
	quantity * unit_price * (1 - discount) AS revenue
FROM sales
limit 10;

SELECT
	round(sum(quantity * unit_price * (1 - discount)),2) as total_revenue
FROM sales
WHERE order_status='Completed';

SELECT
	region, 
	round(sum(quantity * unit_price * (1-discount)),2) as revenue
FROM sales
WHERE order_status='Completed'
group by region
order by revenue desc;

SELECT
	sales_rep, 
	round(sum(quantity * unit_price * (1-discount)),2) as revenue
FROM sales
WHERE order_status='Completed'
group by sales_rep
order by revenue desc;

SELECT
	region, 
	round(sum(quantity * unit_price * (1-discount)),2) as revenue
FROM sales
WHERE order_status='Completed'
group by region
order by revenue desc;

SELECT
	product_name, 
	round(sum(quantity * unit_price * (1-discount)),2) as revenue
FROM sales
WHERE order_status='Completed'
group by product_name
order by revenue desc;

SELECT
	customer_name, 
	round(sum(quantity * unit_price * (1-discount)),2) as revenue
FROM sales
WHERE order_status='Completed'
group by customer_name
order by revenue desc;

SELECT
	substr(order_date, 1, 7) AS month,
	round(SUM(quantity * unit_price * (1 - discount)),2) AS revenue
FROM sales
where order_status = 'Completed'
group by month
order by month;

SELECT
	round(AVG(quantity * unit_price * (1 - discount)),2) AS average_order_value
FROM sales
WHERE order_status = 'Completed';

SELECT
	substr(order_date, 1, 7) AS month,
	count(*) AS orders
FROM sales
where order_status = 'Completed'
group by month
order by month;

SELECT
	substr(order_date, 1, 7) AS month,
	round(AVG(quantity * unit_price * (1 - discount)),2) AS avg_order_value
FROM sales
WHERE order_status = 'Completed'
group by month
order by month;

INSERT INTO customers VALUES
(101,'Acme Corp','Manufacturing','Large'),
(102,'BlueSky Inc','Technology','Medium'),
(103,'Delta LLC','Healthcare','Small'),
(104,'Vertex Co','Finance','Medium'),
(105,'Nexus Ltd','Technology','Large'),
(106,'Pioneer Group','Manufacturing','Large'),
(107,'Evergreen Inc','Retail','Medium'),
(108,'Atlas Corp','Healthcare','Small'),
(109,'Quantum LLC','Technology','Large'),
(110,'Summit Partners','Finance','Large'),
(111,'Riverbend Co','Retail','Medium'),
(112,'Northstar Group','Manufacturing','Medium'),
(113,'BrightPath Inc','Healthcare','Small'),
(114,'Ironwood LLC','Finance','Large'),
(115,'Crescent Systems','Technology','Medium'),
(116,'Horizon Retail','Retail','Large'),
(117,'Keystone Office','Professional Services','Small'),
(118,'MetroWorks','Manufacturing','Medium'),
(119,'Silverline Corp','Healthcare','Large'),
(120,'Red Oak Trading','Retail','Large');

SELECT *
FROM customers;

SELECT count(*)
FROM customers;

SELECT
	s.order_id,
	s.customer_name,
	c.industry,
	c.company_size,
	s.product_name,
	s.quantity,
	s.unit_price
FROM sales s
JOIN customers c
	ON s.customer_id = c.customer_id
LIMIT 10;

SELECT
	c.industry,
	round(SUM(s.quantity * s.unit_price * (1 - s.discount)),2) AS revenue
FROM sales s
JOIN customers c
	ON s.customer_id = c.customer_id
WHERE s.order_status = 'Completed'
group by c.industry order by revenue DESC;

SELECT
	c.company_size,
	round(SUM(s.quantity * s.unit_price * (1-s.discount)),2) AS revenue
FROM sales s
JOIN customers c
	ON s.customer_id = c.customer_id
WHERE s.order_status = 'Completed'
group by c.company_size
order by revenue DESC;