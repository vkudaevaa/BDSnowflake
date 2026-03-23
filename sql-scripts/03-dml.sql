INSERT INTO country_dim (country_name)
SELECT DISTINCT customer_country FROM full_mock_data WHERE customer_country IS NOT NULL
UNION
SELECT DISTINCT seller_country FROM full_mock_data WHERE seller_country IS NOT NULL
UNION
SELECT DISTINCT store_country FROM full_mock_data WHERE store_country IS NOT NULL
UNION
SELECT DISTINCT supplier_country FROM full_mock_data WHERE supplier_country IS NOT NULL;


INSERT INTO city_dim (city_name, country_id)
SELECT DISTINCT city_name, country_id
FROM (
    SELECT f.store_city AS city_name, c.country_id
    FROM full_mock_data f
    JOIN country_dim c ON f.store_country = c.country_name
    WHERE f.store_city IS NOT NULL

    UNION

    SELECT f.supplier_city AS city_name, c.country_id
    FROM full_mock_data f
    JOIN country_dim c ON f.supplier_country = c.country_name
    WHERE f.supplier_city IS NOT NULL
) AS all_cities;


INSERT INTO pet_category_dim (pet_category_name)
SELECT DISTINCT pet_category
FROM full_mock_data
WHERE pet_category IS NOT NULL;


INSERT INTO customer_pet_dim (pet_type, pet_name, pet_breed, pet_category_id)
SELECT DISTINCT
    f.customer_pet_type,
    f.customer_pet_name,
    f.customer_pet_breed,
    pc.pet_category_id
FROM full_mock_data f
LEFT JOIN pet_category_dim pc
    ON f.pet_category = pc.pet_category_name;


INSERT INTO product_category_dim (category_name)
SELECT DISTINCT product_category
FROM full_mock_data
WHERE product_category IS NOT NULL;


INSERT INTO customer_dim (
    customer_id,
    customer_first_name,
    customer_last_name,
    customer_age,
    customer_email,
    customer_postal_code,
    country_id,
    pet_id
)
SELECT DISTINCT
    f.sale_customer_id,
    f.customer_first_name,
    f.customer_last_name,
    f.customer_age,
    f.customer_email,
    f.customer_postal_code,
    c.country_id,
    p.pet_id
FROM full_mock_data f
LEFT JOIN country_dim c
    ON f.customer_country = c.country_name
LEFT JOIN customer_pet_dim p
    ON f.customer_pet_type = p.pet_type
   AND f.customer_pet_name = p.pet_name
   AND f.customer_pet_breed = p.pet_breed
ON CONFLICT (customer_id) DO NOTHING;


INSERT INTO seller_dim (
    seller_id,
    seller_first_name,
    seller_last_name,
    seller_email,
    seller_postal_code,
    country_id
)
SELECT DISTINCT
    f.sale_seller_id,
    f.seller_first_name,
    f.seller_last_name,
    f.seller_email,
    f.seller_postal_code,
    c.country_id
FROM full_mock_data f
LEFT JOIN country_dim c
    ON f.seller_country = c.country_name
ON CONFLICT (seller_id) DO NOTHING;


INSERT INTO product_dim (
    product_id,
    product_name,
    product_price,
    product_quantity,
    product_weight,
    product_color,
    product_size,
    product_brand,
    product_material,
    product_description,
    product_rating,
    product_reviews,
    product_release_date,
    product_expiry_date,
    category_id
)
SELECT DISTINCT
    f.sale_product_id,
    f.product_name,
    f.product_price,
    f.product_quantity,
    f.product_weight,
    f.product_color,
    f.product_size,
    f.product_brand,
    f.product_material,
    f.product_description,
    f.product_rating,
    f.product_reviews,
    f.product_release_date,
    f.product_expiry_date,
    pc.category_id
FROM full_mock_data f
LEFT JOIN product_category_dim pc
    ON f.product_category = pc.category_name
ON CONFLICT (product_id) DO NOTHING;


INSERT INTO store_dim (
    store_name,
    store_location,
    store_phone,
    store_email,
    city_id
)
SELECT DISTINCT
    f.store_name,
    f.store_location,
    f.store_phone,
    f.store_email,
    c.city_id
FROM full_mock_data f
LEFT JOIN city_dim c
    ON f.store_city = c.city_name;


INSERT INTO supplier_dim (
    supplier_name,
    supplier_contact,
    supplier_email,
    supplier_phone,
    supplier_address,
    city_id
)
SELECT DISTINCT
    f.supplier_name,
    f.supplier_contact,
    f.supplier_email,
    f.supplier_phone,
    f.supplier_address,
    c.city_id
FROM full_mock_data f
LEFT JOIN city_dim c
    ON f.supplier_city = c.city_name;


INSERT INTO sales_fact (
    sale_id,
    sale_date,
    customer_id,
    seller_id,
    product_id,
    store_id,
    supplier_id,
    sale_quantity,
    sale_total_price
)
SELECT
    f.id,
    f.sale_date,
    f.sale_customer_id,
    f.sale_seller_id,
    f.sale_product_id,
    s.store_id,
    sup.supplier_id,
    f.sale_quantity,
    f.sale_total_price
FROM full_mock_data f
LEFT JOIN store_dim s
    ON f.store_name = s.store_name
LEFT JOIN supplier_dim sup
    ON f.supplier_name = sup.supplier_name
ON CONFLICT (sale_id) DO NOTHING;


  