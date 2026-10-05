create database heavy;

use heavy;

CREATE TABLE dim_branch (
    branch_id VARCHAR(20) PRIMARY KEY,
    branch_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(100) NOT NULL,
    region VARCHAR(30) NOT NULL,
    warehouse_type VARCHAR(30) NOT NULL,
    warehouse_capacity_sqft DECIMAL(12,2),
    service_center_available ENUM('Yes', 'No') NOT NULL,
    manager_id INT,
    total_employees INT,
    avg_monthly_revenue DECIMAL(15,2),
    monthly_operational_cost DECIMAL(15,2),
    market_demand_index TINYINT

);


CREATE TABLE dim_customer (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_type VARCHAR(50),
    industry_segment VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(100),
    pincode VARCHAR(20),
    region VARCHAR(30),
    branch_id VARCHAR(20),
    credit_limit DECIMAL(15,2),
    current_balance DECIMAL(15,2),
    payment_terms VARCHAR(30),
    customer_since DATE,
    last_purchase_date DATE,
    total_purchase_value DECIMAL(18,2),
    customer_rating DECIMAL(3,2)
);


CREATE TABLE dim_product (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(100),
    machine_type VARCHAR(100),
    brand VARCHAR(100),
    model_compatibility VARCHAR(150),
    unit_cost DECIMAL(15,2),
    unit_price DECIMAL(15,2),
    margin_percentage DECIMAL(5,2),
    gst_rate DECIMAL(5,2),
    weight_kg DECIMAL(10,3),
    dimensions_cm VARCHAR(50),
    material_type VARCHAR(50),
    warranty_months INT,
    reorder_level INT,
    safety_stock INT,
    max_stock_level INT,
    lead_time_days INT,
    criticality_level VARCHAR(30),
    usage_frequency VARCHAR(30),
    uom VARCHAR(20),
    last_purchase_price DECIMAL(15,2),
    last_purchase_date DATE
);

CREATE TABLE fact_inventory (
    product_id VARCHAR(20) NOT NULL,
    branch_id VARCHAR(20) NOT NULL,
    opening_stock INT,
    reorder_level INT,
    safety_stock INT,
    max_stock INT,
    current_stock INT,
    warehouse_bin VARCHAR(30)
);


CREATE TABLE fact_invoice (
    invoice_id VARCHAR(30) PRIMARY KEY,
    so_id VARCHAR(30),
    customer_id VARCHAR(20),
    branch_id VARCHAR(20),
    invoice_date DATE,
    due_date DATE,
    total_order_value DECIMAL(18,2),
    total_gst_amount DECIMAL(18,2),
    grand_total DECIMAL(18,2),
    payment_status VARCHAR(30)
);


CREATE TABLE fact_payment (
    payment_id VARCHAR(30) PRIMARY KEY,
    invoice_id VARCHAR(30),
    payment_date DATE,
    payment_amount DECIMAL(18,2),
    payment_method VARCHAR(50)
);


CREATE TABLE fact_purchase_order (
    po_id VARCHAR(30) PRIMARY KEY,
    supplier_id VARCHAR(20),
    branch_id VARCHAR(20),
    order_date DATE,
    expected_delivery_date DATE,
    received_date DATE,
    po_status VARCHAR(30),
    total_cost DECIMAL(18,2),
    total_gst_amount DECIMAL(18,2),
    grand_total DECIMAL(18,2)
);



CREATE TABLE fact_sales_order (
    so_id VARCHAR(30) PRIMARY KEY,
    customer_id VARCHAR(20),
    branch_id VARCHAR(20),
    order_date DATE,
    delivery_date DATE,
    order_status VARCHAR(30),
    payment_terms VARCHAR(30),
    total_order_value DECIMAL(18,2),
    total_gst_amount DECIMAL(18,2),
    grand_total DECIMAL(18,2),
    sales_channel VARCHAR(50)
);



CREATE TABLE fact_sales_order_detail (
    so_id VARCHAR(30) NOT NULL,
    line_number INT NOT NULL,
    product_id VARCHAR(20),
    quantity INT,
    unit_price DECIMAL(15,2),
    gst_rate DECIMAL(5,2),
    line_total DECIMAL(18,2),
    gst_amount DECIMAL(18,2),
    line_grand_total DECIMAL(18,2),
    PRIMARY KEY (so_id, line_number)
);



CREATE TABLE fact_inventory_movement (
    movement_id VARCHAR(30) PRIMARY KEY,
    product_id VARCHAR(20),
    branch_id VARCHAR(20),
    movement_type VARCHAR(10),
    movement_date DATE,
    quantity INT,
    reference_type VARCHAR(20),
    reference_id VARCHAR(30),
    running_balance INT
);


CREATE TABLE dim_supplier (
    supplier_id VARCHAR(20) PRIMARY KEY,
    supplier_name VARCHAR(150) NOT NULL,
    supplier_type VARCHAR(50),
    product_category VARCHAR(100),
    city VARCHAR(50),
    province VARCHAR(100),
    region VARCHAR(50),
    pincode VARCHAR(20),
    lead_time_days INT,
    reliability_score DECIMAL(3,2),
    import_duty_rate DECIMAL(5,2),
    china_tax_id VARCHAR(50)
);

CREATE TABLE dim_stock_ledger (
    movement_id VARCHAR(30) PRIMARY KEY,
    product_id VARCHAR(20) NOT NULL,
    branch_id VARCHAR(20) NOT NULL,
    movement_type VARCHAR(10) NOT NULL,
    movement_date DATE NOT NULL,
    quantity INT NOT NULL,
    reference_type VARCHAR(20),
    reference_id VARCHAR(30),
    running_balance INT
);


show tables;