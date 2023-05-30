-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE `Orders` (
    `row_id` int  NOT NULL ,
    `order_id` varchar(10)  NOT NULL ,
    `created_at` datetime  NOT NULL ,
    `item_id` int  NOT NULL ,
    `quantity` int  NOT NULL ,
    `cust_id` int  NOT NULL ,
    `delivery` boolean  NOT NULL ,
    `add_id` int  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    )
);

CREATE TABLE `item` (
    `item_id` int  NOT NULL ,
    `sku` varchar(50)  NOT NULL ,
    `item_name` varchar(50)  NOT NULL ,
    `item_cat` varchar(50)  NOT NULL ,
    `item_size` varchar(50)  NOT NULL ,
    `item_price` decimal(10,2)  NOT NULL ,
    PRIMARY KEY (
        `item_id`
    )
);

CREATE TABLE `customer` (
    `cust_id` int  NOT NULL ,
    `cust_firstname` varchar(50)  NOT NULL ,
    `cust_lastname` varchar(50)  NOT NULL ,
    PRIMARY KEY (
        `cust_id`
    )
);

CREATE TABLE `address` (
    `add_id` int  NOT NULL ,
    `delivery_address1` varchar(200)  NOT NULL ,
    `delivery_address2` varchar(200)  NULL ,
    `delivery_city` varchar(50)  NOT NULL ,
    `delivery_zipcode` varchar(50)  NOT NULL ,
    PRIMARY KEY (
        `add_id`
    )
);

CREATE TABLE `inventory` (
    `inv_id` int  NOT NULL ,
    `ing_id` varchar(50)  NOT NULL ,
    `quantity` int  NOT NULL ,
    PRIMARY KEY (
        `inv_id`
    )
);

CREATE TABLE `ingredient` (
    `ing-id` varchar(50)  NOT NULL ,
    `ing_name` varchar(50)  NOT NULL ,
    `ing_weight` int  NOT NULL ,
    `ing_meas` varchar(50)  NOT NULL ,
    `ing_price` decimal(10,2)  NOT NULL ,
    PRIMARY KEY (
        `ing-id`
    )
);

CREATE TABLE `recipe` (
    `row_id` int  NOT NULL ,
    `recipe_id` varchar(50)  NOT NULL ,
    `ing_id` varchar(50)  NOT NULL ,
    `quantity` int  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    )
);

CREATE TABLE `rota` (
    `row_id` int  NOT NULL ,
    `rota_id` varchar(50)  NOT NULL ,
    `date` datetime  NOT NULL ,
    `shift_id` varchar(50)  NOT NULL ,
    `staff_id` varchar(50)  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    )
);

CREATE TABLE `staff` (
    `staff_id` varchar(50)  NOT NULL ,
    `first_name` varchar(50)  NOT NULL ,
    `last_name` varchar(50)  NOT NULL ,
    `position` varchar(50)  NOT NULL ,
    `hourly_rate` varchar(50)  NOT NULL ,
    PRIMARY KEY (
        `staff_id`
    )
);

CREATE TABLE `shift` (
    `shift_id` varchar(50)  NOT NULL ,
    `day_of_week` varchar(50)  NOT NULL ,
    `start_time` time  NOT NULL ,
    `end_time` time  NOT NULL ,
    PRIMARY KEY (
        `shift_id`
    )
);

ALTER TABLE `item` ADD CONSTRAINT `fk_item_item_id` FOREIGN KEY(`item_id`)
REFERENCES `Orders` (`item_id`);

ALTER TABLE `customer` ADD CONSTRAINT `fk_customer_cust_id` FOREIGN KEY(`cust_id`)
REFERENCES `Orders` (`cust_id`);

ALTER TABLE `address` ADD CONSTRAINT `fk_address_add_id` FOREIGN KEY(`add_id`)
REFERENCES `Orders` (`add_id`);

ALTER TABLE `inventory` ADD CONSTRAINT `fk_inventory_ing_id` FOREIGN KEY(`ing_id`)
REFERENCES `recipe` (`ing_id`);

ALTER TABLE `ingredient` ADD CONSTRAINT `fk_ingredient_ing-id` FOREIGN KEY(`ing-id`)
REFERENCES `recipe` (`ing_id`);

ALTER TABLE `recipe` ADD CONSTRAINT `fk_recipe_recipe_id` FOREIGN KEY(`recipe_id`)
REFERENCES `item` (`sku`);

ALTER TABLE `rota` ADD CONSTRAINT `fk_rota_date` FOREIGN KEY(`date`)
REFERENCES `Orders` (`created_at`);

ALTER TABLE `staff` ADD CONSTRAINT `fk_staff_staff_id` FOREIGN KEY(`staff_id`)
REFERENCES `rota` (`staff_id`);

ALTER TABLE `shift` ADD CONSTRAINT `fk_shift_shift_id` FOREIGN KEY(`shift_id`)
REFERENCES `rota` (`shift_id`);

