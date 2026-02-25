---
title: ERD Coffee Shop
---

```mermaid
erDiagram
    USER ||--o{ TRANSACTION : do
    USER ||--o| CART : added
    CART ||--o{ PRODUCT : put-in
    PRODUCT }|--|| TRANSACTION_PRODUCT : do
    TRANSACTION_PRODUCT ||--|{ TRANSACTION : do
    PRODUCT ||--|{ PRODUCT_CATEGORY : has
    CATEGORY ||--|{ PRODUCT_CATEGORY : has
    PRODUCT ||--|{ REVIEWS : has
    USER ||--o{ REVIEWS : do
    PRODUCT ||--o{ DISCOUNT : has
    PRODUCT ||--|{ PRODUCT_VARIANT : has
    PRODUCT ||--|{ PRODUCT_SIZE : has
    PRODUCT ||--|{ PRODUCT_IMAGES : has
    VARIANT ||--|{ PRODUCT_VARIANT :has
    SIZE ||--|{ PRODUCT_SIZE : has

    USER{
        int id pk
        string fullname
        string email
        string password
    }

    PRODUCT{
        int id pk
        string product_name
        string product_desc
        int price
        int stock
    }

    VARIANT{
        int id pk
        string variant_name
        int add_price
    }

    PRODUCT_VARIANT{
        int product_id
        int variant_id
    }

    SIZE{
        int id pk
        string size
        int add_price
    }

    PRODUCT_SIZE{
        int product_id
        int size_id
    }

    PRODUCT_IMAGES{
        int id pk
        int product_id fk
        string path
    }

    CATEGORY{
        int id pk
        string category_name
    }

    PRODUCT_CATEGORY{
        int id pk
        int product_id fk
        int category_id fk
    }

    DISCOUNT{
        int id pk
        int discount_rate
        string description
        boolean is_flashale
    }

    CART{
        int id pk
        int quantity
        string size
        string variant
        int user_id fk
        int product_id fk
        
    }

    TRANSACTION{
        int id pk
        string trx_id
        int user_id fk
        datetime order_date
        string delivery
        string fullname
        string email
        string address
        int delivery_fee
        int tax
        int total
        string status_order
    }

    TRANSACTION_PRODUCT{
        int id pk
        int transaction_id fk
        int product_id fk
        int quantity
        string size
        string variant
    }

    REVIEWS{
        int id pk
        int user_id fk
        string messages
        int rating
    }
