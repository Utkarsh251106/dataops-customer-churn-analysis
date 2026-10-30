create database dataops_assignment;

use dataops_assignment;

-- Table 1
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    vendor_name VARCHAR(100),
    region VARCHAR(50),
    mrr DECIMAL(10,2),
    status VARCHAR(20)
);

INSERT INTO customers
(customer_id, vendor_name, region, mrr, status)
VALUES
('C101', 'Tech Corp', 'North', 1200, 'Active'),
('C102', 'Apex Logistics', 'West', 450, 'Active'),
('C103', 'Nexus Retail', 'South', 800, 'Churned'),
('C104', 'Horizon Health', 'East', 1500, 'Active'),
('C105', 'Stellar Media', 'North', 300, 'Active'),
('C106', 'Omega Global', 'West', 2200, 'Active');

-- Table 2
CREATE TABLE orders (
    order_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(10),
    vendor_name VARCHAR(100),
    submitted_qty INT,
    delivered_qty INT,
    total_cost DECIMAL(10,2),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

INSERT INTO orders
(order_id, customer_id, vendor_name, submitted_qty, delivered_qty, total_cost)
VALUES
('ORD-001', 'C101', 'Alpha Supplies', 100, 100, 500),
('ORD-002', 'C102', 'Beta Logistics', 250, 200, 1250),
('ORD-003', 'C101', 'Alpha Supplies', 150, 120, 750),
('ORD-004', 'C104', 'Gamma Paper', 500, 500, 2000),
('ORD-005', 'C102', 'Alpha Supplies', 300, 270, 1350),
('ORD-006', 'C105', 'Beta Logistics', 80, 80, 400);

SELECT * FROM customers;

SELECT * FROM orders;

-- Execute Q4.1 — Find active customers with MRR greater than $500
SELECT
    customer_id,
    vendor_name,
    region,
    mrr,
    status
FROM customers
WHERE status = 'Active'
AND mrr > 500;

-- Execute Q4.2 — Vendor-wise submitted and delivered quantities
SELECT
    vendor_name,
    SUM(submitted_qty) AS total_submitted_qty,
    SUM(delivered_qty) AS total_delivered_qty
FROM orders
GROUP BY vendor_name
ORDER BY vendor_name;