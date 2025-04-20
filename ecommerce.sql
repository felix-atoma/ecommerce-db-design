
-- brand
CREATE TABLE brand (
  brand_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  description TEXT
);

-- product_category
CREATE TABLE product_category (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  description TEXT
);

-- product
CREATE TABLE product (
  product_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  brand_id INT,
  category_id INT,
  base_price DECIMAL(10, 2),
  status ENUM('active', 'inactive') DEFAULT 'active',
  FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
  FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

-- product_image
CREATE TABLE product_image (
  image_id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  image_url VARCHAR(255),
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- color
CREATE TABLE color (
  color_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  hex_code VARCHAR(7)
);

-- size_category
CREATE TABLE size_category (
  size_cat_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50)
);

-- size_option
CREATE TABLE size_option (
  size_id INT AUTO_INCREMENT PRIMARY KEY,
  size_cat_id INT,
  size_label VARCHAR(10),
  FOREIGN KEY (size_cat_id) REFERENCES size_category(size_cat_id)
);

-- product_variation
CREATE TABLE product_variation (
  variation_id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  color_id INT,
  size_id INT,
  FOREIGN KEY (product_id) REFERENCES product(product_id),
  FOREIGN KEY (color_id) REFERENCES color(color_id),
  FOREIGN KEY (size_id) REFERENCES size_option(size_id)
);

-- product_item
CREATE TABLE product_item (
  item_id INT AUTO_INCREMENT PRIMARY KEY,
  variation_id INT,
  sku VARCHAR(100),
  quantity INT,
  price_override DECIMAL(10,2),
  FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id)
);

-- attribute_category
CREATE TABLE attribute_category (
  attr_cat_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100)
);

-- attribute_type
CREATE TABLE attribute_type (
  attr_type_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100)
);

-- product_attribute
CREATE TABLE product_attribute (
  attr_id INT AUTO_INCREMENT PRIMARY KEY,
  product_id INT,
  attr_cat_id INT,
  attr_type_id INT,
  name VARCHAR(100),
  value VARCHAR(255),
  FOREIGN KEY (product_id) REFERENCES product(product_id),
  FOREIGN KEY (attr_cat_id) REFERENCES attribute_category(attr_cat_id),
  FOREIGN KEY (attr_type_id) REFERENCES attribute_type(attr_type_id)
);
