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
CREATE TABLE "PRODUCT_DISCOUNT"(
    "id" SERIAL PRIMARY KEY,
    "product_id" INT,
    "discount_id" INT,

    CONSTRAINT fk_product
        FOREIGN KEY ("product_id")
        REFERENCES "PRODUCT"("id"),
    CONSTRAINT fk_discount
        FOREIGN KEY ("discount_id")
        REFERENCES "DISCOUNT"("id")
);

CREATE TABLE "REVIEWS"(
    "id" SERIAL PRIMARY KEY,
    "user_id" INT,
    "product_id" INT,
    "messages" VARCHAR(255),
    "rating" INT,

    CONSTRAINT fk_user
        FOREIGN KEY ("user_id")
        REFERENCES "USER"("id"),
    CONSTRAINT fk_product
        FOREIGN KEY ("product_id")
        REFERENCES "PRODUCT"("id")
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
    "variant" VARCHAR(50),

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
        20000,
        50
    ),
    (
        'Cappucino',
        'You can explore the menu that we provide with fun and have their own taste and make your day better.',
        20000,
        50
    ),
    (
        'Matcha Latte',
        'You can explore the menu that we provide with fun and have their own taste and make your day better.',
        25000,
        50
    ),
    (
        'Caramel Machiato',
        'You can explore the menu that we provide with fun and have their own taste and make your day better.',
        25000,
        50
    ),
    (
        'Caramel Latte',
        'You can explore the menu that we provide with fun and have their own taste and make your day better.',
        20000,
        50
    ),
    (
        'Americano',
        'You can explore the menu that we provide with fun and have their own taste and make your day better.',
        15000,
        80
    ),
    (
        'French Fries',
        'You can explore the menu that we provide with fun and have their own taste and make your day better.',
        15000,
        30
    ),
    (
        'Sandwhich',
        'You can explore the menu that we provide with fun and have their own taste and make your day better.',
        17000,
        25
    ),
    (
        'Burger',
        'You can explore the menu that we provide with fun and have their own taste and make your day better.',
        22500,
        40
    ),
    (
        'Lecy Tea',
        'You can explore the menu that we provide with fun and have their own taste and make your day better.',
        13500,
        50
    ),
    (
        'Cold Brew',
        'You can explore the menu that we provide with fun and have their own taste and make your day better.',
        20500,
        45
    ),
    (
        'Affogato',
        'You can explore the menu that we provide with fun and have their own taste and make your day better.',
        25500,
        30
    ),
    (
        'Thai Tea',
        'You can explore the menu that we provide with fun and have their own taste and make your day better.',
        17000,
        50
    ),
    (
        'Taro Latte',
        'You can explore the menu that we provide with fun and have their own taste and make your day better.',
        22500,
        50
    ),
    (
        'Virgin Mojito',
        'You can explore the menu that we provide with fun and have their own taste and make your day better.',
        17500,
        50
    ),
    ('Espresso','Premium espresso with strong character.',18000,60),
    ('Mocha Latte','Chocolate blended with espresso and milk.',23000,50),
    ('Vanilla Latte','Sweet vanilla with creamy milk.',22000,50),
    ('Avocado Coffee','Fresh avocado mixed with espresso.',27000,40),
    ('Chocolate Milk','Creamy chocolate drink.',19000,70),
    ('Strawberry Milk','Fresh strawberry flavored milk.',19000,65),
    ('Lemon Tea','Refreshing lemon infused tea.',16000,80),
    ('Peach Tea','Sweet and fresh peach tea.',17000,75),
    ('Green Tea Latte','Japanese matcha with milk.',24000,45),
    ('Red Velvet Latte','Smooth red velvet flavored drink.',25000,45),
    ('Chicken Nuggets','Crispy fried chicken nuggets.',20000,35),
    ('Onion Rings','Crunchy fried onion rings.',18000,30),
    ('Cheese Burger','Beef burger with melted cheese.',25000,40),
    ('Double Patty Burger','Burger with double beef patty.',32000,30),
    ('Hot Dog','Classic hot dog with sauce.',20000,40),
    ('Chicken Sandwich','Grilled chicken sandwich.',23000,35),
    ('Club Sandwich','Triple layered sandwich.',26000,30),
    ('Spaghetti Bolognese','Italian pasta with meat sauce.',28000,25),
    ('Carbonara','Creamy pasta with cheese.',29000,25),
    ('Chicken Rice Bowl','Rice bowl with grilled chicken.',27000,40),
    ('Beef Rice Bowl','Rice bowl with teriyaki beef.',30000,35),
    ('French Toast','Sweet french toast with syrup.',22000,30),
    ('Pancake','Fluffy pancake with honey.',21000,35),
    ('Waffle','Crispy waffle with topping.',23000,30),
    ('Ice Cream Vanilla','Classic vanilla ice cream.',15000,60),
    ('Ice Cream Chocolate','Chocolate flavored ice cream.',15000,60),
    ('Ice Cream Strawberry','Strawberry flavored ice cream.',15000,60),
    ('Mineral Water','Fresh mineral water.',8000,100),
    ('Sparkling Water','Carbonated mineral water.',12000,80),
    ('Orange Juice','Fresh squeezed orange juice.',20000,50),
    ('Apple Juice','Fresh apple juice.',20000,50),
    ('Mango Smoothie','Fresh mango smoothie.',24000,45),
    ('Berry Smoothie','Mixed berry smoothie.',25000,40),
    ('Chocolate Frappe','Blended chocolate frappe.',26000,45),
    ('Caramel Frappe','Blended caramel frappe.',26000,45);
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
    (3,1),(3,2),(3,3),(3,4),(3,5),(3,6),(3,7),
    (4,1),(4,2),(4,3),(4,4),(4,5),(4,6),(4,7),
    (5,1),(5,2),(5,3),(5,4),(5,5),(5,6),(5,7),
    (6,1),(6,2),(6,3),(6,4),(6,5),(6,6),(6,7),
    (7,8),(7,9),(7,10),(7,11),
    (8,8),(8,9),(8,10),(8,11),
    (9,8),(9,9),(9,10),(9,11),
    (10,1),(10,2),(10,3),(10,4),(10,5),(10,6),(10,7),
    (11,1),(11,2),(11,3),(11,4),(11,5),(11,6),(11,7),
    (12,1),(12,2),(12,3),(12,4),(12,5),(12,6),(12,7),
    (13,1),(13,2),(13,3),(13,4),(13,5),(13,6),(13,7),
    (14,1),(14,2),(14,3),(14,4),(14,5),(14,6),(14,7),
    (15,1),(15,2),(15,3),(15,4),(15,5),(15,6),(15,7);
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
    (3,1),(3,2),(3,3),(3,4),
    (4,1),(4,2),(4,3),(4,4),
    (5,1),(5,2),(5,3),(5,4),
    (6,1),(6,2),(6,3),(6,4),
    (7,5),(7,6),(7,7),(7,8),
    (8,5),(8,6),(8,7),(8,8),
    (9,5),(9,6),(9,7),(9,8),
    (10,1),(10,2),(10,3),(10,4),
    (11,1),(11,2),(11,3),(11,4),
    (12,1),(12,2),(12,3),(12,4),
    (13,1),(13,2),(13,3),(13,4),
    (14,1),(14,2),(14,3),(14,4),
    (15,1),(15,2),(15,3),(15,4),
    (16,1),(16,2),(16,3),(16,4),(16,5),(16,6),(16,7),
    (17,1),(17,2),(17,3),(17,4),(17,5),(17,6),(17,7),
    (18,1),(18,2),(18,3),(18,4),(18,5),(18,6),(18,7),
    (19,1),(19,2),(19,3),(19,4),(19,5),(19,6),(19,7),
    (20,3),(20,4),(20,5),
    (21,3),(21,4),(21,5),
    (22,1),(22,2),(22,3),(22,4),(22,5),(22,6),(22,7),
    (23,1),(23,2),(23,3),(23,4),(23,5),(23,6),(23,7),
    (24,1),(24,2),(24,3),(24,4),(24,5),(24,6),(24,7),
    (25,1),(25,2),(25,3),(25,4),(25,5),(25,6),(25,7),
    (26,1),(26,2),(26,3),(26,4),
    (27,1),(27,2),(27,3),(27,4),
    (28,1),(28,2),(28,3),(28,4),
    (29,1),(29,2),(29,3),(29,4),
    (30,1),(30,2),(30,3),(30,4),
    (31,1),(31,2),(31,3),(31,4),
    (32,1),(32,2),(32,3),(32,4),
    (33,1),(33,2),(33,3),(33,4),
    (34,1),(34,2),(34,3),(34,4),
    (35,1),(35,2),(35,3),(35,4),
    (36,1),(36,2),(36,3),(36,4),
    (37,1),(37,2),(37,3),(37,4),
    (38,1),(38,2),(38,3),(38,4),
    (39,1),(39,2),(39,3),(39,4),
    (40,1),(40,2),(40,3),(40,4);
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
    ('https://images.pexels.com/photos/28944482/pexels-photo-28944482.jpeg',10),
    ('https://images.pexels.com/photos/2775860/pexels-photo-2775860.jpeg',11),
    ('https://images.pexels.com/photos/32972513/pexels-photo-32972513.jpeg',12),
    ('https://images.pexels.com/photos/33241807/pexels-photo-33241807.jpeg',13),
    ('https://images.pexels.com/photos/10781076/pexels-photo-10781076.jpeg',14),
    ('https://images.pexels.com/photos/4051263/pexels-photo-4051263.jpeg',15);
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
    (10,4),
    (11,1),
    (11,3),
    (12,1),
    (12,3),
    (13,1),
    (13,3),
    (14,1),
    (14,3),
    (15,1),
    (15,3),
    (16,1),(16,3),
    (17,1),(17,3),
    (18,1),(18,3),
    (19,1),(19,3),
    (20,1),(20,4),
    (21,1),(21,4),
    (22,1),(22,4),
    (23,1),(23,4),
    (24,1),(24,4),
    (25,1),(25,4),
    (26,2),
    (27,2),
    (28,2),
    (29,2),
    (30,2),
    (31,2),
    (32,2),
    (33,2),
    (34,2),
    (35,2),
    (36,2),
    (37,2),
    (38,2),
    (39,2),
    (40,2),
    (41,1),(41,4),
    (42,1),(42,4),
    (43,1),(43,4),
    (44,1),(44,4),
    (45,1),(45,4),
    (46,1),(46,4),
    (47,1),(47,4),
    (48,1),(48,4),
    (49,1),(49,4),
    (50,1),(50,4);
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

INSERT INTO "PRODUCT_DISCOUNT" ("product_id","discount_id")
VALUES
    (1,1),
    (2,4),
    (3,4),
    (4,1),
    (5,1),
    (6,5),
    (7,7),
    (8,1),
    (9,4),
    (10,1),
    (11,1),
    (12,3),
    (13,4),
    (14,3),
    (15,6);
SELECT "product_id","discount_id" FROM "PRODUCT_DISCOUNT";

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


INSERT INTO "CART" ("quantity","size","variant","user_id","product_id")
VALUES
    (1,'Reguler','Non Coffee',1,3);
SELECT "quantity","size","variant","user_id","product_id" FROM "CART";

INSERT INTO "REVIEWS" ("user_id", "product_id", "messages", "rating")
VALUES
    (2,6,'This coffee is so delicious',5),
    (3,1,'This coffee is so delicious',5),
    (4,3,'This coffee is so delicious',5),
    (8,7,'This french fries is so delicious',5),
    (6,5,'This coffee is so delicious',5),
    (10,9,'This burger is so delicious',5),
    (5,8,'This sandwhich is so delicious',5),
    (9,4,'This coffee is so delicious',5),
    (7,10,'The tea is so delicious',5),
    (1,2,'This coffee is so delicious',5);
SELECT "id","user_id", "product_id", "messages", "rating" FROM "REVIEWS";
