-- Mendapatkan nama, size, varian, final price
SELECT 
    "PRODUCT"."id",
    "PRODUCT"."product_name",
    "SIZE"."size",
    "VARIANT"."variant",
    "PRODUCT"."price" AS "base_price", 
    SUM("SIZE"."add_price"+"VARIANT"."add_price") AS "add_price",
    SUM("PRODUCT"."price"+"SIZE"."add_price"+"VARIANT"."add_price") AS "final_price"
FROM "PRODUCT"
JOIN "PRODUCT_SIZE" ON "PRODUCT_SIZE"."product_id" = "PRODUCT"."id"
JOIN "SIZE" ON "SIZE"."id" = "PRODUCT_SIZE"."size_id"
JOIN "PRODUCT_VARIANT" ON "PRODUCT_VARIANT"."product_id" = "PRODUCT"."id"
JOIN "VARIANT" ON "VARIANT"."id" = "PRODUCT_VARIANT"."variant_id"
WHERE "PRODUCT"."id"= 3 AND "SIZE"."id"= 3 AND "VARIANT"."id"= 2
GROUP BY "PRODUCT"."id","PRODUCT"."product_name","SIZE"."size","VARIANT"."variant","PRODUCT"."price";

-- task 2
SELECT 
    "id",
    "product_name",
    "size",
    "variant",
    "quantity",
    "base_price",
    "add_price",
    "subtotal"
FROM (
    SELECT 
        "PRODUCT"."id" AS "id",
        "PRODUCT"."product_name" AS "product_name",
        "SIZE"."size" AS "size",
        "VARIANT"."variant" AS "variant",
        (5) AS "quantity",
        "PRODUCT"."price" AS "base_price", 
        SUM("SIZE"."add_price"+"VARIANT"."add_price") AS "add_price",
        (("PRODUCT"."price"+"SIZE"."add_price"+"VARIANT"."add_price")*5) AS "subtotal"
    FROM "PRODUCT"
    JOIN "PRODUCT_SIZE" ON "PRODUCT_SIZE"."product_id" = "PRODUCT"."id"
    JOIN "SIZE" ON "SIZE"."id" = "PRODUCT_SIZE"."size_id"
    JOIN "PRODUCT_VARIANT" ON "PRODUCT_VARIANT"."product_id" = "PRODUCT"."id"
    JOIN "VARIANT" ON "VARIANT"."id" = "PRODUCT_VARIANT"."variant_id"
    WHERE "PRODUCT"."id"= 3 AND "SIZE"."id"= 3 AND "VARIANT"."id"= 2
    GROUP BY "PRODUCT"."id", "SIZE"."size", "VARIANT"."variant", "SIZE"."add_price", "VARIANT"."add_price"
    UNION ALL
     SELECT 
        "PRODUCT"."id" AS "id",
        "PRODUCT"."product_name" AS "product_name",
        "SIZE"."size" AS "size",
        "VARIANT"."variant" AS "variant",
        (5) AS "quantity",
        "PRODUCT"."price" AS "base_price", 
        SUM("SIZE"."add_price"+"VARIANT"."add_price") AS "add_price",
        (("PRODUCT"."price"+"SIZE"."add_price"+"VARIANT"."add_price")*5) AS "subtotal"
    FROM "PRODUCT"
    JOIN "PRODUCT_SIZE" ON "PRODUCT_SIZE"."product_id" = "PRODUCT"."id"
    JOIN "SIZE" ON "SIZE"."id" = "PRODUCT_SIZE"."size_id"
    JOIN "PRODUCT_VARIANT" ON "PRODUCT_VARIANT"."product_id" = "PRODUCT"."id"
    JOIN "VARIANT" ON "VARIANT"."id" = "PRODUCT_VARIANT"."variant_id"
    WHERE "PRODUCT"."id"= 1 AND "SIZE"."id"= 2 AND "VARIANT"."id"= 2
    GROUP BY "PRODUCT"."id", "SIZE"."size", "VARIANT"."variant", "SIZE"."add_price", "VARIANT"."add_price"
    UNION ALL
     SELECT 
        "PRODUCT"."id" AS "id",
        "PRODUCT"."product_name" AS "product_name",
        "SIZE"."size" AS "size",
        "VARIANT"."variant" AS "variant",
        (5) AS "quantity",
        "PRODUCT"."price" AS "base_price", 
        SUM("SIZE"."add_price"+"VARIANT"."add_price") AS "add_price",
        (("PRODUCT"."price"+"SIZE"."add_price"+"VARIANT"."add_price")*5) AS "subtotal"
    FROM "PRODUCT"
    JOIN "PRODUCT_SIZE" ON "PRODUCT_SIZE"."product_id" = "PRODUCT"."id"
    JOIN "SIZE" ON "SIZE"."id" = "PRODUCT_SIZE"."size_id"
    JOIN "PRODUCT_VARIANT" ON "PRODUCT_VARIANT"."product_id" = "PRODUCT"."id"
    JOIN "VARIANT" ON "VARIANT"."id" = "PRODUCT_VARIANT"."variant_id"
    WHERE "PRODUCT"."id"= 5 AND "SIZE"."id"= 1 AND "VARIANT"."id"= 1
    GROUP BY "PRODUCT"."id", "SIZE"."size", "VARIANT"."variant", "SIZE"."add_price", "VARIANT"."add_price"
) AS "order_items";


-- task 3 landing page
SELECT 
    "PRODUCT"."product_name",
    "PRODUCT"."product_desc",
    "PRODUCT"."price",
    "PRODUCT_IMAGES"."path"
FROM "PRODUCT"
JOIN "PRODUCT_IMAGES" ON "PRODUCT_IMAGES"."product_id" = "PRODUCT"."id"
GROUP BY "PRODUCT"."product_name", "PRODUCT"."product_desc", "PRODUCT"."price", "PRODUCT_IMAGES"."path";

-- task 4 browse product
SELECT 
    "PRODUCT"."id",
    "PRODUCT"."product_name",
    "PRODUCT"."product_desc",
    "PRODUCT"."price",
    ("PRODUCT"."price"-("PRODUCT"."price"*"DISCOUNT"."discount_rate")) AS "discount_price",
    "PRODUCT_IMAGES"."path",
    "REVIEWS"."rating"
FROM "PRODUCT"
JOIN "PRODUCT_IMAGES" ON "PRODUCT_IMAGES"."product_id" = "PRODUCT"."id"
JOIN "REVIEWS" ON "REVIEWS"."product_id" = "PRODUCT"."id"
JOIN "PRODUCT_DISCOUNT" ON "PRODUCT_DISCOUNT"."product_id" = "PRODUCT"."id"
JOIN "DISCOUNT" ON "DISCOUNT"."id" = "PRODUCT_DISCOUNT"."discount_id"
GROUP BY "PRODUCT"."id","PRODUCT"."product_name", "PRODUCT"."product_desc", "PRODUCT"."price", "DISCOUNT"."discount_rate","PRODUCT_IMAGES"."path", "REVIEWS"."rating";