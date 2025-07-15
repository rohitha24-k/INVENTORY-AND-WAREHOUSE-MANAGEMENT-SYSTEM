# Inventory & Warehouse Management System (SQL Project)

##  Overview
This project simulates a backend SQL system to manage inventory and warehouse operations. It tracks products, suppliers, warehouses, and stock levels, including low-stock alerts and stock transfers. The system was built entirely in MySQL using core SQL concepts like DDL, DML, triggers, procedures, and joins.

It is designed to be scalable and extendable to include order processing, billing, or dashboard reporting using tools like Power BI or Excel in the future.

## Tools Used
- MySQL (Workbench / DBeaver)
- dbdiagram.io (for ER Diagram)

## Database Schema

###  products
Stores details of all products such as name, unit price, reorder level, and supplier ID.

###  suppliers
Holds supplier contact information including name, phone, and email.

###  warehouses
Tracks warehouses with name, location, and capacity in units.

###  stock
Represents current quantity of each product in each warehouse. It acts as a bridge table between products and warehouses.

###  low_stock_alerts
Captures alerts for products whose stock goes below reorder level. Trigger-based insertion.

## Relationships
- Each product is linked to a supplier
- Each warehouse can store many different products
- Stock is managed per product per warehouse
- Alerts are generated when a product’s quantity in a warehouse falls below its reorder level

This model follows the principles of 3rd Normal Form (3NF), ensuring data consistency and integrity.

##  Features Implemented
- Structured, normalized database design
- Sample data insertion (20+ rows per table)
- JOIN queries for inventory reports and monitoring
- Trigger to auto-generate low-stock alerts
- Stored procedure to transfer stock between warehouses
- Good naming conventions and schema documentation for clarity and maintenance

## ER Diagram
A visual schema showing the relationships between tables including foreign key constraints. Created using dbdiagram.io.
<img width="1574" height="791" alt="Screenshot 2025-07-15 205540" src="https://github.com/user-attachments/assets/ff399790-ba6a-476f-8bf3-306210ad9aed" />


## Learning Highlights
- Used MySQL concepts like normalization, primary and foreign keys
- Applied triggers and stored procedures in real-world scenarios
- Practiced writing meaningful documentation and ERDs
- Understood how to simulate business rules using SQL logic
- Improved confidence in building backend database systems for industry-level applications
