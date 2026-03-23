CREATE TABLE full_mock_data (
    id                       INTEGER,
    customer_first_name      VARCHAR(50),
    customer_last_name       VARCHAR(50),
    customer_age             INTEGER,
    customer_email           VARCHAR(50),
    customer_country         VARCHAR(50),
    customer_postal_code     VARCHAR(30),
    customer_pet_type        VARCHAR(20),
    customer_pet_name        VARCHAR(20),
    customer_pet_breed       VARCHAR(20),
    seller_first_name        VARCHAR(50),
    seller_last_name         VARCHAR(50),
    seller_email             VARCHAR(50),
    seller_country           VARCHAR(50),
    seller_postal_code       VARCHAR(30),
    product_name             VARCHAR(50),
    product_category         VARCHAR(20),
    product_price            NUMERIC(10,2),
    product_quantity         INTEGER,
    sale_date                VARCHAR(20),
    sale_customer_id         INTEGER,
    sale_seller_id           INTEGER,
    sale_product_id          INTEGER,
    sale_quantity            INTEGER,
    sale_total_price         NUMERIC(10,2),
    store_name               VARCHAR(50),
    store_location           VARCHAR(50),
    store_city               VARCHAR(50),
    store_state              VARCHAR(50),
    store_country            VARCHAR(50),
    store_phone              VARCHAR(20),
    store_email              VARCHAR(50),
    pet_category             VARCHAR(20),
    product_weight           NUMERIC(10,1),
    product_color            VARCHAR(20),
    product_size             VARCHAR(20),
    product_brand            VARCHAR(50),
    product_material         VARCHAR(20),
    product_description      TEXT,
    product_rating           NUMERIC(3,1),
    product_reviews          INTEGER,
    product_release_date     VARCHAR(20),
    product_expiry_date      VARCHAR(20),
    supplier_name            VARCHAR(50),
    supplier_contact         VARCHAR(50),
    supplier_email           VARCHAR(50),
    supplier_phone           VARCHAR(20),
    supplier_address         VARCHAR(50),
    supplier_city            VARCHAR(50),
    supplier_country         VARCHAR(50)
);

COPY full_mock_data FROM '/data/MOCK_DATA1.csv' CSV HEADER;
COPY full_mock_data FROM '/data/MOCK_DATA2.csv' CSV HEADER;
COPY full_mock_data FROM '/data/MOCK_DATA3.csv' CSV HEADER;
COPY full_mock_data FROM '/data/MOCK_DATA4.csv' CSV HEADER;
COPY full_mock_data FROM '/data/MOCK_DATA5.csv' CSV HEADER;
COPY full_mock_data FROM '/data/MOCK_DATA6.csv' CSV HEADER;
COPY full_mock_data FROM '/data/MOCK_DATA7.csv' CSV HEADER;
COPY full_mock_data FROM '/data/MOCK_DATA8.csv' CSV HEADER;
COPY full_mock_data FROM '/data/MOCK_DATA9.csv' CSV HEADER;
COPY full_mock_data FROM '/data/MOCK_DATA10.csv' CSV HEADER;
