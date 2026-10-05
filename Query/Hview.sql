show tables;

call AutoDetectColumnCategory('dim_branch');
call AutoDetectColumnCategory('dim_customer');
call AutoDetectColumnCategory('dim_product');
call AutoDetectColumnCategory('fact_inventory_movement');
call AutoDetectColumnCategory('fact_invoice');
call AutoDetectColumnCategory('fact_payment');
call AutoDetectColumnCategory('fact_purchase_order');
call AutoDetectColumnCategory('fact_sales_order');
call AutoDetectColumnCategory('fact_sales_order_detail');
