-- Farm 2 Shop - Supabase PostgreSQL Schema
-- Run this in the Supabase SQL Editor at:
-- https://supabase.com/dashboard/project/zunaxpncmardqhtyvije/sql/new

-- Drop tables if they exist (in correct dependency order)
DROP TABLE IF EXISTS payments CASCADE;
DROP TABLE IF EXISTS complaints CASCADE;
DROP TABLE IF EXISTS demands CASCADE;
DROP TABLE IF EXISTS bookings CASCADE;
DROP TABLE IF EXISTS products CASCADE;
DROP TABLE IF EXISTS shopkeepers CASCADE;
DROP TABLE IF EXISTS farmers CASCADE;
DROP TABLE IF EXISTS admin CASCADE;

-- 1. admin Table
CREATE TABLE admin (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    name VARCHAR(100) DEFAULT NULL,
    email VARCHAR(100) DEFAULT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO admin (username, password, name, email) VALUES ('admin', 'admin', 'System Admin', 'admin@farmtoshop.com');

-- 2. farmers Table
CREATE TABLE farmers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL,
    password VARCHAR(255) NOT NULL,
    location VARCHAR(150) DEFAULT NULL,
    farm_name VARCHAR(150) DEFAULT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO farmers (id, name, email, phone, password, location, farm_name) VALUES 
(1, 'sam', 'sam@gmail.com', '9886764849', 'sam', 'chennai', 'sam@co.com');

-- 3. shopkeepers Table
CREATE TABLE shopkeepers (
    id SERIAL PRIMARY KEY,
    shop_name VARCHAR(100) DEFAULT NULL,
    owner_name VARCHAR(100) DEFAULT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(100) NOT NULL,
    phone VARCHAR(20) DEFAULT NULL,
    location VARCHAR(100) DEFAULT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO shopkeepers (id, shop_name, owner_name, email, password, phone, location) VALUES
(1, 'jerry@co', 'jerry', 'jerry@gmail.com', 'jerry', '8838884930', 'trichy'),
(2, 'praga@co', 'praga', 'praga@gmail.com', 'praga', '9666665656', 'trichy');

-- Fix serial sequences after manual inserts
SELECT setval('farmers_id_seq', COALESCE((SELECT MAX(id)+1 FROM farmers), 1), false);
SELECT setval('shopkeepers_id_seq', COALESCE((SELECT MAX(id)+1 FROM shopkeepers), 1), false);

-- 4. products Table
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    farmer_id INT NOT NULL REFERENCES farmers(id) ON DELETE CASCADE,
    product_name VARCHAR(200) DEFAULT NULL,
    category VARCHAR(100) DEFAULT NULL,
    location VARCHAR(150) DEFAULT NULL,
    quantity INT DEFAULT NULL,
    price DECIMAL(10,2) DEFAULT NULL,
    image VARCHAR(255) DEFAULT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO products (id, farmer_id, product_name, category, location, quantity, price, image) VALUES
(1, 1, 'Apple', 'Fruits', 'chennai', 50, 100.00, 'uploads/apple.jpg'),
(2, 1, 'Tomato', 'Vegetables', 'chennai', 30, 20.00, 'uploads/tomato.jpg'),
(3, 1, 'Carrot', 'Vegetables', 'Chennai', 40, 20.00, 'uploads/carrot.jpg'),
(4, 1, 'Banana', 'Fruits', 'trichy', 20, 100.00, 'uploads/banana.jpg'),
(5, 1, 'Banana', 'Fruits', 'trichy', 12, 10.00, 'uploads/banana2.jpg');

SELECT setval('products_id_seq', COALESCE((SELECT MAX(id)+1 FROM products), 1), false);

-- 5. bookings Table
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(id) ON DELETE SET NULL,
    shopkeeper_id INT REFERENCES shopkeepers(id) ON DELETE SET NULL,
    farmer_id INT REFERENCES farmers(id) ON DELETE SET NULL,
    quantity VARCHAR(50) DEFAULT NULL,
    total_price DECIMAL(10,2) DEFAULT NULL,
    status VARCHAR(50) DEFAULT 'Pending',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO bookings (id, product_id, shopkeeper_id, farmer_id, quantity, total_price, status) VALUES
(1, 1, 1, 1, '9', 900.00, 'Pending'),
(2, 2, 2, 1, '10', 100.00, 'Pending'),
(3, 1, 2, 1, '2', 200.00, 'Pending'),
(4, 1, 1, 1, '12', 240.00, 'Pending'),
(5, 2, 1, 1, '2', 40.00, 'Pending'),
(6, 1, 1, 1, '4', 400.00, 'Pending'),
(7, 1, 1, 1, '10', 180.00, 'Pending'),
(8, 5, 1, 1, '10', 100.00, 'Pending');

SELECT setval('bookings_id_seq', COALESCE((SELECT MAX(id)+1 FROM bookings), 1), false);

-- 6. demands Table
CREATE TABLE demands (
    id SERIAL PRIMARY KEY,
    shopkeeper_id INT REFERENCES shopkeepers(id) ON DELETE SET NULL,
    farmer_id INT REFERENCES farmers(id) ON DELETE SET NULL,
    product_name VARCHAR(100) DEFAULT NULL,
    quantity VARCHAR(50) DEFAULT NULL,
    message TEXT,
    status VARCHAR(50) DEFAULT 'Pending',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    product_id INT DEFAULT 0
);
INSERT INTO demands (id, shopkeeper_id, farmer_id, product_name, quantity, message, status, product_id) VALUES
(1, 2, 1, 'Tomato', '10', 'rs 10', 'Booked', 2),
(2, 1, 1, 'Apple', '20', 'I want 20 rupees per kg', 'Rejected', 1),
(3, 1, 1, 'Apple', '10', 'I want 20 per kg', 'Booked', 1),
(4, 1, 1, 'Apple', '10', 'rs 18', 'Booked', 1),
(5, 1, 1, 'banana', '10', 'i want rs 10 per kg', 'Booked', 5);

SELECT setval('demands_id_seq', COALESCE((SELECT MAX(id)+1 FROM demands), 1), false);

-- 7. payments Table
CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    booking_id INT NOT NULL REFERENCES bookings(id) ON DELETE CASCADE,
    shopkeeper_id INT NOT NULL REFERENCES shopkeepers(id) ON DELETE CASCADE,
    payment_method VARCHAR(50) NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    card_number VARCHAR(30) DEFAULT NULL,
    card_holder VARCHAR(100) DEFAULT NULL,
    expiry_date VARCHAR(10) DEFAULT NULL,
    cvv VARCHAR(10) DEFAULT NULL,
    status VARCHAR(50) DEFAULT 'Success',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO payments (id, booking_id, shopkeeper_id, payment_method, amount, card_number, card_holder, expiry_date, cvv, status) VALUES
(1, 1, 1, 'Card', 900.00, '6595659595995959', 'jerry', '29/25', '250', 'Delivered'),
(2, 2, 2, 'Card', 100.00, '9494656261646161', 'praga', '29/27', '258', 'Success'),
(3, 3, 2, 'COD', 200.00, NULL, 'Cash Customer', NULL, NULL, 'Delivered'),
(4, 4, 1, 'COD', 240.00, NULL, 'Cash Customer', NULL, NULL, 'Success'),
(5, 5, 1, 'Card', 40.00, '6464646161699966', 'jerry', '11/26', '258', 'Success'),
(6, 7, 1, 'Card', 180.00, '9999999665666666', 'samn', '20/23', '258', 'Delivered'),
(7, 8, 1, 'Card', 100.00, '8496464646565665', 'jerry', '09/23', '548', 'Shipped');

SELECT setval('payments_id_seq', COALESCE((SELECT MAX(id)+1 FROM payments), 1), false);

-- 8. complaints Table
CREATE TABLE complaints (
    id SERIAL PRIMARY KEY,
    farmer_id INT REFERENCES farmers(id) ON DELETE SET NULL,
    shopkeeper_id INT REFERENCES shopkeepers(id) ON DELETE SET NULL,
    admin_id INT DEFAULT 1,
    user_type VARCHAR(20) DEFAULT NULL,
    subject VARCHAR(255) DEFAULT NULL,
    message TEXT,
    solution TEXT DEFAULT NULL,
    status VARCHAR(50) DEFAULT 'Pending',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO complaints (id, farmer_id, shopkeeper_id, admin_id, user_type, subject, message, status) VALUES
(1, 1, NULL, 1, 'farmer', 'i want this', 'okay', 'Pending');

SELECT setval('complaints_id_seq', COALESCE((SELECT MAX(id)+1 FROM complaints), 1), false);
