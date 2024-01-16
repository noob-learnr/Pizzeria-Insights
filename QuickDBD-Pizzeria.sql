use pizzeria;
CREATE TABLE `customers` (
    `cust_id` VARCHAR(8) NOT NULL,
    `cust_name` VARCHAR(60) NOT NULL,
    `gender` VARCHAR(10) NOT NULL,
    `age` INT NOT NULL,
    PRIMARY KEY (`cust_id`)
);

CREATE TABLE `orders` (
    `order_id` int  NOT NULL ,
    `order_datetime` datetime  NOT NULL ,
    `cust_id` varchar(8)  NOT NULL ,
    `item_id` varchar(10)  NOT NULL ,
    `quantity` int  NOT NULL ,
    `payment_mode` varchar(20)  NOT NULL ,
    PRIMARY KEY (
        `order_id`
    )
);

CREATE TABLE `ingredients` (
    `ing_id` varchar(10)  NOT NULL ,
    `ing_name` varchar(25)  NOT NULL ,
    `ing_price` int  NOT NULL ,
    `ing_weight` int  NOT NULL ,
    PRIMARY KEY (
        `ing_id`
    )
);

CREATE TABLE `menu_items` (
    `item_id` varchar(10)  NOT NULL ,
    `item_name` varchar(20)  NOT NULL ,
    `item_cat` varchar(10)  NOT NULL ,
    `item_price` decimal  NOT NULL ,
    PRIMARY KEY (
        `item_id`
    )
);

CREATE TABLE `recipe` (
    `recipe_id` varchar(10)  NOT NULL ,
    `recipe_name` varchar(20)  NOT NULL ,
    PRIMARY KEY (
        `recipe_id`
    )
);

CREATE TABLE `recipe_ing` (
    `recipe_id` varchar(10)  NOT NULL ,
    `ing_id` varchar(10)  NOT NULL ,
    `ing_qty` int  NOT NULL ,
    PRIMARY KEY (
        `recipe_id`
    )
);

CREATE TABLE `inventory` (
    `inv_id` int  NOT NULL ,
    `ing_id` varchar(10)  NOT NULL ,
    `qty` int  NOT NULL ,
    PRIMARY KEY (
        `inv_id`
    )
);

CREATE TABLE `staff` (
    `staff_id` varchar(10)  NOT NULL ,
    `staff_name` varchar(20)  NOT NULL ,
    `position` varchar(10)  NOT NULL ,
    `hourly_rate` int  NOT NULL ,
    PRIMARY KEY (
        `staff_id`
    )
);

CREATE TABLE `rota` (
    `rota_id` varchar(10)  NOT NULL ,
    `date` datetime  NOT NULL ,
    `shift_id` varchar(10)  NOT NULL ,
    `staff_id` varchar(10)  NOT NULL ,
    PRIMARY KEY (
        `rota_id`
    )
);

ALTER TABLE `orders`
ADD INDEX `idx_cust_id` (`cust_id`);
ALTER TABLE `customers` ADD CONSTRAINT `fk_customers_cust_id` FOREIGN KEY(`cust_id`)
REFERENCES `orders` (`cust_id`);

ALTER TABLE orders
ADD FOREIGN KEY (cust_id)
REFERENCES customers(cust_id);

ALTER TABLE `inventory`
ADD INDEX `idx_ing_id` (`ing_id`);
ALTER TABLE `ingredients` ADD CONSTRAINT `fk_ingredients_ing_id` FOREIGN KEY(`ing_id`)
REFERENCES `inventory` (`ing_id`);

ALTER TABLE `menu_items`ADD CONSTRAINT `fk_menu_items_recipe_id` FOREIGN KEY (`item_id`)
REFERENCES `recipe` (`recipe_id`);

ALTER TABLE `recipe` ADD CONSTRAINT `fk_recipe_recipe_id` FOREIGN KEY(`recipe_id`)
REFERENCES `recpie_ing` (`recipe_id`);

ALTER TABLE `recipe_ing` ADD CONSTRAINT `fk_recipe_ing_ing_id` FOREIGN KEY(`ing_id`)
REFERENCES `ingredients` (`ing_id`);

ALTER TABLE `rota` ADD CONSTRAINT `fk_rota_order_date` FOREIGN KEY(`date`)
REFERENCES `orders` (`order_date`);

ALTER TABLE `orders`
ADD INDEX `idx_order_date` (`order_date`);

ALTER TABLE `rota`ADD CONSTRAINT `fk_rota_order_date` FOREIGN KEY (`date`)
REFERENCES `orders` (`order_date`);

