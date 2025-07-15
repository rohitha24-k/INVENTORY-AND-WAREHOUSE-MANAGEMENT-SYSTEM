CREATE DATABASE inventory_db;
USE inventory_db;
CREATE TABLE suppliers (
    supplier_id   INT AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(100) NOT NULL,
    phone         VARCHAR(25),
    email         VARCHAR(100)
);

CREATE TABLE warehouses (
  warehouse_id INT AUTO_INCREMENT PRIMARY KEY,
  name         VARCHAR(100) NOT NULL,
  location     VARCHAR(150),
  capacity_units INT NOT NULL
);

CREATE TABLE products (
    product_id    INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id   INT NOT NULL,
    name          VARCHAR(100) NOT NULL,
    unit_price    DECIMAL(10,2) NOT NULL,
    reorder_level INT DEFAULT 10,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

 CREATE TABLE stock (
    stock_id      INT AUTO_INCREMENT PRIMARY KEY,
    product_id    INT NOT NULL,
    warehouse_id  INT NOT NULL,
    quantity      INT DEFAULT 0,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);

INSERT INTO suppliers (supplier_id, name, phone, email) VALUES
(1, 'Tata Supplies', '9876543210', 'tata@suppliers.com'),
(2, 'Reliance Materials', '9123456780', 'reliance@suppliers.com'),
(3, 'JSW Group', '9012345678', 'jsw@suppliers.com'),
(4, 'Birla Cement', '7890123456', 'birla@suppliers.com'),
(5, 'Shree Industries', '8765432190', 'shree@suppliers.com'),
(6, 'Ambuja Ltd', '9988776655', 'ambuja@suppliers.com'),
(7, 'UltraTech', '8866442200', 'ultratech@suppliers.com'),
(8, 'L&T Traders', '9555666777', 'lt@suppliers.com'),
(9, 'Asian Paints', '9111222333', 'asian@suppliers.com'),
(10, 'Pidilite Corp', '9000112233', 'pidilite@suppliers.com'),
(11, 'Jindal Steels', '8223344556', 'jindal@suppliers.com'),
(12, 'Hindustan Plywood', '7665544332', 'hindply@suppliers.com'),
(13, 'Berger Paints', '9123456781', 'berger@suppliers.com'),
(14, 'Godrej Hardware', '9876501234', 'godrej@suppliers.com'),
(15, 'Ramco Cement', '7890654321', 'ramco@suppliers.com'),
(16, 'Dalmia Bharat', '9000789123', 'dalmia@suppliers.com'),
(17, 'ACC Limited', '9988123456', 'acc@suppliers.com'),
(18, 'Phoenix Metals', '7878123456', 'phoenix@suppliers.com'),
(19, 'Everest Panels', '8123456789', 'everest@suppliers.com'),
(20, 'Greenply Ltd', '9432123456', 'greenply@suppliers.com');

INSERT INTO warehouses (name, location, capacity_units) VALUES
('Hyderabad Central',     'Hyderabad',     10000),
('Mumbai North',          'Mumbai',         8000),
('Chennai Depot',         'Chennai',       12000),
('Bangalore Hub',         'Bangalore',      9500),
('Delhi East',            'Delhi',          8500),
('Pune Yard',             'Pune',           7000),
('Kolkata West',          'Kolkata',        9200),
('Ahmedabad Point',       'Ahmedabad',      8100),
('Jaipur Center',         'Jaipur',         7600),
('Nagpur Unit',           'Nagpur',         6800),
('Lucknow Base',          'Lucknow',        7400),
('Bhopal Line',           'Bhopal',         6700),
('Coimbatore Store',      'Coimbatore',     7300),
('Vijayawada Wing',       'Vijayawada',     6900),
('Surat Warehouse',       'Surat',          8800),
('Visakhapatnam Point',   'Vizag',          7900),
('Ludhiana Corner',       'Ludhiana',       6600),
('Indore Central',        'Indore',         8500),
('Thane Line',            'Thane',          7700),
('Rajkot Depot',          'Rajkot',         6400);

INSERT INTO products (supplier_id, name, unit_price, reorder_level) VALUES
(1, 'Steel Rod 12mm', 150.00, 20),
(2, 'Cement OPC 50kg', 320.00, 30),
(3, 'Paint 20L', 1450.00, 10),
(4, 'Bricks (100 pcs)', 550.00, 40),
(5, 'Tiles Box', 750.00, 25),
(6, 'PVC Pipe 10ft', 120.00, 15),
(7, 'Switch Box 4x4', 80.00, 35),
(8, 'Fan Regulator', 110.00, 10),
(9, 'Paint Roller', 90.00, 20),
(10, 'Wire 1.5mm 90m', 1400.00, 12),
(11, 'Plywood Sheet', 850.00, 18),
(12, 'Ceiling Light LED', 270.00, 22),
(13, 'Bath Fittings Set', 1950.00, 8),
(14, 'Window Frame', 1450.00, 10),
(15, 'Cement PPC 50kg', 310.00, 28),
(16, 'Roofing Sheet', 1050.00, 9),
(17, 'Steel Nails Box', 65.00, 50),
(18, 'Masonry Trowel', 85.00, 30),
(19, 'Safety Helmet', 320.00, 15),
(20, 'Measuring Tape 5m', 115.00, 25);

INSERT INTO stock (product_id, warehouse_id, quantity) VALUES
(1, 1, 400),
(2, 2, 300),
(3, 3, 150),
(4, 4, 600),
(5, 5, 250),
(6, 6, 420),
(7, 7, 330),
(8, 8, 310),
(9, 9, 500),
(10, 10, 230),
(11, 11, 190),
(12, 12, 275),
(13, 13, 105),
(14, 14, 80),
(15, 15, 340),
(16, 16, 295),
(17, 17, 650),
(18, 18, 220),
(19, 19, 145),
(20, 20, 360);

SELECT 
    p.product_id,
    p.name AS product_name,
    w.name AS warehouse_name,
    s.quantity
FROM stock s
JOIN products p ON s.product_id = p.product_id
JOIN warehouses w ON s.warehouse_id = w.warehouse_id
ORDER BY s.quantity DESC;

SELECT 
    p.product_id,
    p.name AS product_name,
    s.quantity,
    p.reorder_level,
    w.name AS warehouse_name
FROM stock s
JOIN products p ON s.product_id = p.product_id
JOIN warehouses w ON s.warehouse_id = w.warehouse_id
WHERE s.quantity < p.reorder_level
ORDER BY s.quantity;

SELECT 
    sup.name AS supplier_name,
    p.name AS product_name,
    SUM(s.quantity) AS total_quantity
FROM products p
JOIN suppliers sup ON p.supplier_id = sup.supplier_id
JOIN stock s ON s.product_id = p.product_id
GROUP BY sup.name, p.name
ORDER BY sup.name;

SELECT 
    w.name AS warehouse_name,
    w.capacity_units,
    SUM(s.quantity) AS used_units,
    ROUND((SUM(s.quantity) / w.capacity_units) * 100, 2) AS usage_percentage
FROM warehouses w
JOIN stock s ON w.warehouse_id = s.warehouse_id
GROUP BY w.warehouse_id
ORDER BY usage_percentage DESC;

SELECT 
    w.name AS warehouse_name,
    ROUND(SUM(s.quantity * p.unit_price), 2) AS total_stock_value
FROM stock s
JOIN warehouses w ON s.warehouse_id = w.warehouse_id
JOIN products p ON s.product_id = p.product_id
GROUP BY w.name
ORDER BY total_stock_value DESC;

CREATE TABLE low_stock_alerts (
    alert_id      INT AUTO_INCREMENT PRIMARY KEY,
    product_id    INT NOT NULL,
    warehouse_id  INT NOT NULL,
    quantity      INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);


DELIMITER $$

CREATE TRIGGER trg_stock_low_alert
AFTER INSERT ON stock
FOR EACH ROW
BEGIN
    DECLARE v_reorder INT;

    SELECT reorder_level INTO v_reorder
    FROM products
    WHERE product_id = NEW.product_id;

    IF NEW.quantity < v_reorder THEN
        INSERT INTO low_stock_alerts (product_id, warehouse_id, quantity)
        VALUES (NEW.product_id, NEW.warehouse_id, NEW.quantity);
    END IF;
END$$

DELIMITER ;
SELECT COUNT(*) AS alert_rows FROM low_stock_alerts;
SELECT * FROM low_stock_alerts;
DELIMITER $$

CREATE PROCEDURE transfer_stock (
    IN p_product_id INT,
    IN p_from_warehouse_id INT,
    IN p_to_warehouse_id INT,
    IN p_quantity INT
)
BEGIN
DECLARE current_quantity INT;

    SELECT quantity INTO current_quantity
    FROM stock
    WHERE product_id = p_product_id AND warehouse_id = p_from_warehouse_id;

    IF current_quantity IS NULL OR current_quantity < p_quantity THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Not enough stock in source warehouse.';
    ELSE
        UPDATE stock
        SET quantity = quantity - p_quantity
        WHERE product_id = p_product_id AND warehouse_id = p_from_warehouse_id;

        INSERT INTO stock (product_id, warehouse_id, quantity)
        VALUES (p_product_id, p_to_warehouse_id, p_quantity)
        ON DUPLICATE KEY UPDATE quantity = quantity + p_quantity;
    END IF;
END $$

DELIMITER ;

INSERT INTO stock (product_id, warehouse_id, quantity)
VALUES (2, 3, 50)                         
ON DUPLICATE KEY UPDATE quantity = 50; 
CALL transfer_stock(2, 3, 5, 10);
SELECT * FROM stock
WHERE product_id = 2 AND warehouse_id IN (3,5);


