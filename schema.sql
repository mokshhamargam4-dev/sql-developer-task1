-- ============================================================
-- TASK 1: SCHEMA CREATION (TABLES & CONSTRAINTS)
-- ============================================================

-- Step 1: Create Customers Table
CREATE TABLE IF NOT EXISTS Customers (
    customer_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    created_at TEXT DEFAULT CURRENT_TIMESTAMP
);

-- Step 2: Create Products Table
CREATE TABLE IF NOT EXISTS Products (
    product_id INTEGER PRIMARY KEY AUTOINCREMENT,
    product_name TEXT NOT NULL,
    price REAL NOT NULL,
    stock_quantity INTEGER DEFAULT 0
);

-- Step 3: Create Orders Table
CREATE TABLE IF NOT EXISTS Orders (
    order_id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER NOT NULL,
    order_date TEXT DEFAULT CURRENT_TIMESTAMP,
    total_amount REAL DEFAULT 0.00,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

-- Step 4: Create Order_Items Table
CREATE TABLE IF NOT EXISTS Order_Items (
    order_item_id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price REAL NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE
);


-- ============================================================
-- TASK 2: DATA INSERTION, UPDATES, AND DELETIONS
-- ============================================================

-- 1. INSERT DATA
INSERT INTO Customers (first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Alice', 'Johnson', 'alice.j@example.com'),
('Bob', 'Brown', 'bob.brown@example.com');

INSERT INTO Products (product_name, price, stock_quantity) VALUES
('Laptop', 850.00, 10),
('Wireless Mouse', 25.50, 50),
('Mechanical Keyboard', 75.00, 0),
('USB-C Cable', 12.99, 0);

INSERT INTO Orders (customer_id, total_amount) VALUES
(1, 875.50),
(2, 25.50),
(3, 0.00);

INSERT INTO Order_Items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 850.00),
(1, 2, 1, 25.50),
(2, 2, 1, 25.50);

-- 2. UPDATE DATA
UPDATE Products
SET stock_quantity = 25
WHERE product_id = 3;

UPDATE Customers
SET email = 'john.updated@example.com'
WHERE customer_id = 1;

UPDATE Orders
SET total_amount = 150.00
WHERE order_id = 3;

-- 3. DELETE DATA
DELETE FROM Order_Items
WHERE order_item_id = 3;

DELETE FROM Customers
WHERE customer_id = 4;