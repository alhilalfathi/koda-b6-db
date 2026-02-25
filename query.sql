-- Mendapatkan nama, size, varian, final price
SELECT "PRODUCT"."id","PRODUCT"."product_name","SIZE"."size","VARIANT"."variant", SUM("PRODUCT"."price"+"SIZE"."add_price"+"VARIANT"."add_price") AS "final_price"
FROM "PRODUCT"
JOIN "PRODUCT_SIZE" ON "PRODUCT_SIZE"."product_id" = "PRODUCT"."id"
JOIN "SIZE" ON "SIZE"."id" = "PRODUCT_SIZE"."size_id"
JOIN "PRODUCT_VARIANT" ON "PRODUCT_VARIANT"."product_id" = "PRODUCT"."id"
JOIN "VARIANT" ON "VARIANT"."id" = "PRODUCT_VARIANT"."variant_id"
WHERE "PRODUCT"."id"= 3 AND "SIZE"."id"= 3 AND "VARIANT"."id"= 2
GROUP BY "PRODUCT"."id","PRODUCT"."product_name","SIZE"."size","VARIANT"."variant";
