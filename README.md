---
title: ERD Coffee Shop
---

```mermaid
erDiagram


    USER{
        int user_id pk
        string fullname
        string email
        string role
    }

    PRODUCT{
        int product_id pk
        string product_name
        string image_url
        string product_tag
        boolean is_favorite
        boolean is_flashsale
        string category
        int price
        int stock
    }

    CART{
        int cart_id pk
        int quantity
        string size
        string temp
        int user_id fk
        int product_id fk
        
    }

    ORDER{
        int order_id pk
        datetime order_date
        int total
        string status_order
        int user_id fk
    }

    DETAIL_ORDER{
        int detail_id pk
        int order_id fk
        int user_id fk
        int product_id fk
    }