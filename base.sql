CREATE TABLE "USER"(
    "id" SERIAL PRIMARY KEY,
    "fullname" VARCHAR(255),
    "email" VARCHAR(255),
    "password" VARCHAR(255),
    "role" VARCHAR(10)
);

CREATE TABLE "PRODUCT"(
    "id" SERIAL PRIMARY KEY,
    "product_name" VARCHAR(50),
    "product_desc" VARCHAR(255),
    "price" INT NOT NULL,
    "stock" INT 
);

CREATE TABLE "VARIANT"(
    "id" SERIAL PRIMARY KEY,
    "variant" VARCHAR(50),
    "add_price" INT
);
CREATE TABLE "PRODUCT_VARIANT"(
    "id" SERIAL PRIMARY KEY,
    "product_id" INT,
    "variant_id" INT,

    CONSTRAINT fk_product
        FOREIGN KEY("product_id")
        REFERENCES "PRODUCT"("id"),
    CONSTRAINT fk_category
        FOREIGN KEY("variant_id")
        REFERENCES "VARIANT"("id")
);

CREATE TABLE "SIZE"(
    "id" SERIAL PRIMARY KEY,
    "size" VARCHAR(50),
    "add_price" INT
);
CREATE TABLE "PRODUCT_SIZE"(
    "id" SERIAL PRIMARY KEY,
    "product_id" INT,
    "size_id" INT,

    CONSTRAINT fk_product
        FOREIGN KEY("product_id")
        REFERENCES "PRODUCT"("id"),
    CONSTRAINT fk_category
        FOREIGN KEY("size_id")
        REFERENCES "SIZE"("id")
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

CREATE TABLE "DISCOUNT"(
    "id" SERIAL PRIMARY KEY,
    "discount_rate" FLOAT,
    "description" VARCHAR(255),
    "is_flashsale" BOOLEAN
);

CREATE TABLE "REVIEWS"(
    "id" SERIAL PRIMARY KEY,
    "user_id" INT,
    "messages" VARCHAR(255),
    "rating" INT,

    CONSTRAINT fk_user
        FOREIGN KEY ("user_id")
        REFERENCES "USER"("id")
);

CREATE TABLE "CART"(
    "id" SERIAL PRIMARY KEY,
    "quantity" INT NOT NULL,
    "size" VARCHAR(10),
    "variant" VARCHAR(50),
    "user_id" INT,
    "product_id" INT,

    CONSTRAINT fk_user
        FOREIGN KEY("user_id")
        REFERENCES "USER"("id"),

    CONSTRAINT fk_product
        FOREIGN KEY("product_id")
        REFERENCES "PRODUCT"("id")

);

CREATE TABLE "TRANSACTION"(
    "id" SERIAL PRIMARY KEY,
    "trx_id" VARCHAR(255),
    "user_id" INT,
    "order_date" TIMESTAMP DEFAULT NOW(),
    "fullname" VARCHAR(255),
    "email" VARCHAR(50),
    "address" VARCHAR(255),
    "delivery" VARCHAR(50),
    "delivery_fee" INT,
    "tax" INT,
    "total" INT,
    "status_order" VARCHAR(10),

CONSTRAINT fk_user
        FOREIGN KEY("user_id")
        REFERENCES "USER"("id")

);

CREATE TABLE "TRANSACTION_PRODUCT"(
    "id" SERIAL PRIMARY KEY,
    "transaction_id" INT,
    "product_id" INT,
    "quantity" INT NOT NULL,
    "size" VARCHAR(10),
    "variant" VARCHAR(50)

    CONSTRAINT fk_transaction
        FOREIGN KEY("transaction_id")
        REFERENCES "TRANSACTION"("id"),

    CONSTRAINT fk_product
        FOREIGN KEY("product_id")
        REFERENCES "PRODUCT"("id")

);

INSERT INTO "USER" ("fullname","email","password")
VALUES
    ('Andi Pratama','andi@mail.com','andi@123'),
    ('Siti Rahmawati','siti@mail.com','siti@123'),
    ('Budi Santoso', 'budi@mail.com', 'budi@123'),
    ('Dewi Lestari', 'dewi@mail.com', 'dewi@123'),
    ('Rizky Hidayat', 'rizky@mail.com', 'rizky@123'),
    ('Nur Aisyah', 'nur@mail.com', 'nur@123'),
    ('Fajar Nugroho', 'fajar@mail.com', 'fajar@123'),
    ('Maya Sari', 'maya@mail.com', 'maya@123'),
    ('Arif Setiawan', 'arif@mail.com', 'arif@123'),
    ('Lina Kartika', 'lina@mail.com', 'lina@123');
SELECT "id","fullname","email","password" FROM "USER";

INSERT INTO "PRODUCT" ("product_name","product_desc","price","stock")
VALUES
    (
        'Hazelnut Latte',
        'You can explore the menu that we provide with fun and have their own taste and make your day better.',
        '20000',
        '50'
    ),
    (
        'Cappucino',
        'You can explore the menu that we provide with fun and have their own taste and make your day better.',
        '20000',
        '50'
    ),
    (
        'Matcha Latte',
        'You can explore the menu that we provide with fun and have their own taste and make your day better.',
        '25000',
        '50'
    ),
    (
        'Caramel Machiato',
        'You can explore the menu that we provide with fun and have their own taste and make your day better.',
        '25000',
        '50'
    ),
    (
        'Caramel Latte',
        'You can explore the menu that we provide with fun and have their own taste and make your day better.',
        '20000',
        '50'
    ),
    (
        'Americano',
        'You can explore the menu that we provide with fun and have their own taste and make your day better.',
        '15000',
        '80'
    ),
    (
        'French Fries',
        'You can explore the menu that we provide with fun and have their own taste and make your day better.',
        '15000',
        '30'
    ),
    (
        'Sandwhich',
        'You can explore the menu that we provide with fun and have their own taste and make your day better.',
        '17000',
        '25'
    ),
    (
        'Burger',
        'You can explore the menu that we provide with fun and have their own taste and make your day better.',
        '22500',
        '40'
    ),
    (
        'Lecy Tea',
        'You can explore the menu that we provide with fun and have their own taste and make your day better.',
        '13500',
        '50'
    );
SELECT "id","product_name","product_desc","price","stock" FROM "PRODUCT";

INSERT INTO "CATEGORY" ("category")
VALUES
    ('Beverages'),
    ('Foods'),
    ('Coffee'),
    ('Non Coffee'),
    ('Favorite');
SELECT "id","category" FROM "CATEGORY";

INSERT INTO "VARIANT" ("variant","add_price")
VALUES
    ('Hot',0),
    ('Ice',2000),
    ('Normal Sugar',0),
    ('Less Sugar',0),
    ('No Sugar',0),
    ('Normal Ice',0),
    ('Less Ice',0),
    ('Spicy lvl 1',0),
    ('Spicy lvl 2',0),
    ('Spicy lvl 3',1000),
    ('Non Spicy',0);
SELECT "id","variant","add_price" FROM "VARIANT";

INSERT INTO "PRODUCT_VARIANT" ("product_id","variant_id")
VALUES
    (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),
    (2,1),(2,2),(2,3),(2,4),(2,5),(2,6),(2,7),
    (3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7);
SELECT "product_id","variant_id" FROM "PRODUCT_VARIANT";

INSERT INTO "SIZE" ("size","add_price")
VALUES
    ('Regular Cup',0),
    ('Medium Cup',2000),
    ('Large Cup',4000),
    ('Extra Large Cup',6000),
    ('Regular size',0),
    ('Medium Size',3000),
    ('Large Size',5000),
    ('Jumbo Size',8000);
SELECT "id", "size", "add_price" FROM "SIZE";

INSERT INTO "PRODUCT_SIZE" ("product_id","size_id")
VALUES
    (1,1),(1,2),(1,3),(1,4),
    (2,1),(2,2),(2,3),(2,4),
    (3,1),(3,2),(3,3),(3,4);
SELECT "product_id","size_id" FROM "PRODUCT_SIZE";

INSERT INTO "PRODUCT_IMAGES" ("path","product_id")
VALUES
    ('https://images.pexels.com/photos/7463455/pexels-photo-7463455.jpeg',1),
    ('https://images.pexels.com/photos/2530910/pexels-photo-2530910.jpeg',2),
    ('https://images.pexels.com/photos/12756666/pexels-photo-12756666.jpeg',3),
    ('https://images.pexels.com/photos/214333/pexels-photo-214333.jpeg',4),
    ('https://images.pexels.com/photos/28744927/pexels-photo-28744927.jpeg',5),
    ('https://images.pexels.com/photos/5741238/pexels-photo-5741238.jpeg',6),
    ('https://images.pexels.com/photos/29150162/pexels-photo-29150162.jpeg',7),
    ('https://images.pexels.com/photos/236813/pexels-photo-236813.jpeg',8),
    ('https://images.pexels.com/photos/2702674/pexels-photo-2702674.jpeg',9),
    ('https://images.pexels.com/photos/28944482/pexels-photo-28944482.jpeg',10);
SELECT "id","path","product_id" FROM "PRODUCT_IMAGES";

INSERT INTO "PRODUCT_CATEGORY" ("product_id", "category_id")
VALUES 
    (1,1),
    (1,3),
    (2,1),
    (2,3),
    (3,1),
    (3,4),
    (4,1),
    (4,3),
    (5,1),
    (5,3),
    (6,1),
    (6,3),
    (7,2),
    (8,2),
    (9,2),
    (10,1),
    (10,4);
SELECT "id","product_id","category_id" FROM "PRODUCT_CATEGORY";

INSERT INTO "DISCOUNT" ("discount_rate", "description", "is_flashsale")
VALUES
    (0.1, 'Morning Coffee', TRUE),
    (0.1, 'Afternoon Coffee', TRUE),
    (0.25, 'Mothers Day', FALSE),
    (0.15, 'Monday Coffee', TRUE),
    (0.15, 'Sunday Morning Sale', TRUE),
    (0.5, 'Christmas Sale', FALSE),
    (0.2, 'Wednesday Coffee', TRUE),
    (0.5, 'EID Sale', FALSE),
    (0.25, 'Independent Day', FALSE),
    (0.2, 'Valentine Sale', FALSE);
SELECT "id","discount_rate","description","is_flashsale" FROM "DISCOUNT";

INSERT INTO "TRANSACTION" (
    "trx_id", 
    "user_id", 
    "order_date", 
    "fullname", 
    "email", 
    "address", 
    "delivery", 
    "delivery_fee", 
    "tax",
    "total",
    "status_order"
) 
VALUES
    ('123-1771742973940',1,'2025-12-25','Andi Pratama','andi@mail.com','Jakarta','dine in',0,2500,27500,'done'),
    ('123-1771743651010',4,'2026-01-2','Dewi Lestari','dewi@mail.com','Bandung','dine in',0,2000,22000,'done'),
    ('123-1771411090290',7,'2026-02-3','Fajar Nugroho','fajar@mail.com','Depok','dine in',0,4000,44000,'done'),
    ('123-1771993159506',6,'2026-02-13','Nur Aisyah','nur@mail.com','Depok','dine in',0,4500,45500,'done');


INSERT INTO "CART" (
    "quantity",
    "size",
    "variant",
    "user_id",
    "product_id"
)
VALUES
    (1,'Reguler','Non Coffee',1,3);