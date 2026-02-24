CREATE TABLE "USER"(
    "id" SERIAL PRIMARY KEY,
    "fullname" VARCHAR(255),
    "email" VARCHAR(255),
    "password" VARCHAR(255),
    "role" VARCHAR(50)
);

CREATE TABLE "PRODUCT"(
    "id" SERIAL PRIMARY KEY,
    "product_name" VARCHAR(50),
    "product_desc" VARCHAR(255),
    "price" INT NOT NULL,
    "stock" INT 
);

CREATE TABLE "PRODUCT_VARIANT"(
    "id" SERIAL PRIMARY KEY,
    "variant" VARCHAR(50),
    "add_price" INT
);

CREATE TABLE "PRODUCT_SIZE"(
    "id" SERIAL PRIMARY KEY,
    "size" VARCHAR(50),
    "add_price" INT
);

CREATE TABLE "PRODUCT_IMAGES"(
    "id" SERIAL PRIMARY KEY,
    "path" VARCHAR(255),
    "product_id" INT,

    CONSTRAINT fk_product
        FOREIGN KEY ("product_id")
        REFERENCES "PRODUCT"("id")
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE "CATEGORY"(
    "id" SERIAL PRIMARY KEY,
    "category" VARCHAR(50)
);

CREATE TABLE "PRODUCT_CATEGORY"(
    "id" SERIAL PRIMARY KEY,
    "product_id" INT,
    "category_id" INT,

    CONSTRAINT fk_product
        FOREIGN KEY("product_id")
        REFERENCES "PRODUCT"("id"),
    CONSTRAINT fk_category
        FOREIGN KEY("category_id")
        REFERENCES "CATEGORY"("id")
);