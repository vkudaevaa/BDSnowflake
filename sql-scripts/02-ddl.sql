CREATE TABLE country_dim (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(50) UNIQUE
);

CREATE TABLE city_dim (
    city_id SERIAL PRIMARY KEY,
    city_name VARCHAR(50),
    country_id INTEGER REFERENCES country_dim(country_id)
);

CREATE TABLE pet_category_dim (
    pet_category_id SERIAL PRIMARY KEY,
    pet_category_name VARCHAR(20)
);

CREATE TABLE customer_pet_dim (
    pet_id SERIAL PRIMARY KEY,
    pet_type VARCHAR(20),
    pet_name VARCHAR(20),
    pet_breed VARCHAR(20),
    pet_category_id INTEGER REFERENCES pet_category_dim(pet_category_id)
);

CREATE TABLE product_category_dim (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(20)
);

CREATE TABLE customer_dim (
    customer_id INTEGER PRIMARY KEY,
    customer_first_name VARCHAR(50),
    customer_last_name VARCHAR(50),
    customer_age INTEGER,
    customer_email VARCHAR(50),
    customer_postal_code VARCHAR(30),
    country_id INTEGER REFERENCES country_dim(country_id),
    pet_id INTEGER REFERENCES customer_pet_dim(pet_id)
);

CREATE TABLE seller_dim (
    seller_id INTEGER PRIMARY KEY,
    seller_first_name VARCHAR(50),
    seller_last_name VARCHAR(50),
    seller_email VARCHAR(50),
    seller_postal_code VARCHAR(30),
    country_id INTEGER REFERENCES country_dim(country_id)
);


CREATE TABLE product_dim (
    product_id INTEGER PRIMARY KEY,
    product_name VARCHAR(50),
    product_price NUMERIC(10,2),
    product_quantity INTEGER,
    product_weight NUMERIC(10,1),
    product_color VARCHAR(20),
    product_size VARCHAR(20),
    product_brand VARCHAR(50),
    product_material VARCHAR(20),
    product_description TEXT,
    product_rating NUMERIC(3,1),
    product_reviews INTEGER,
    product_release_date VARCHAR(20),
    product_expiry_date VARCHAR(20),
    category_id INTEGER REFERENCES product_category_dim(category_id)
);

CREATE TABLE store_dim (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR(50),
    store_location VARCHAR(50),
    store_phone VARCHAR(20),
    store_email VARCHAR(50),
    city_id INTEGER REFERENCES city_dim(city_id)
);


CREATE TABLE supplier_dim (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(50),
    supplier_contact VARCHAR(50),
    supplier_email VARCHAR(50),
    supplier_phone VARCHAR(20),
    supplier_address VARCHAR(50),
    city_id INTEGER REFERENCES city_dim(city_id)
);

CREATE TABLE sales_fact (
    sale_id INTEGER PRIMARY KEY,
    sale_date VARCHAR(20),
    customer_id INTEGER REFERENCES customer_dim(customer_id),
    seller_id INTEGER REFERENCES seller_dim(seller_id),
    product_id INTEGER REFERENCES product_dim(product_id),
    store_id INTEGER REFERENCES store_dim(store_id),
    supplier_id INTEGER REFERENCES supplier_dim(supplier_id),
    sale_quantity INTEGER,
    sale_total_price NUMERIC(10,2)
);