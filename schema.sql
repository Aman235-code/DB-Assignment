-- Create Product table
CREATE TABLE Product IF NOT EXISTS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    desc TEXT,
    SKU VARCHAR(50),
    category_id INT,
    inventory_id INT,
    discount_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

-- Create Product Category table
CREATE TABLE Product_Category IF NOT EXISTS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    desc TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

-- Create Product Inventory table
CREATE TABLE Product_Inventory IF NOT EXISTS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    quantity INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Product(id)
);

-- Create Discount table
CREATE TABLE Discount (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    discount_percent DECIMAL(5,2) NOT NULL,
    active BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
);

-- Add foreign key constraints
ALTER TABLE Product
ADD FOREIGN KEY (category_id) REFERENCES Product_Category(id),
ADD FOREIGN KEY (inventory_id) REFERENCES Product_Inventory(id),
ADD FOREIGN KEY (discount_id) REFERENCES Discount(id);
