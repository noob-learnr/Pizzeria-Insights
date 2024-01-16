use pizzeria_basic;

CREATE TABLE `customers` (
    `cust_id` varchar(8)  NOT NULL ,
    `cust_name` varchar(60)  NOT NULL ,
    `gender` varchar(10)  NOT NULL ,
    `age` int  NOT NULL ,
    PRIMARY KEY (
        `cust_id`
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

CREATE TABLE `orders` (
    `row_id` int  NOT NULL ,
    `order_id` int  NOT NULL ,
    `ordered_at` datetime  NOT NULL ,
	`cust_id` varchar(8)  NOT NULL ,
    `item_id` varchar(10)  NOT NULL ,
    `quantity` int  NOT NULL ,
    `payment_mode` varchar(20)  NOT NULL ,
    PRIMARY KEY (
        `row_id`
    ),
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id),
    FOREIGN KEY (item_id) REFERENCES menu_items(item_id)
    
);


