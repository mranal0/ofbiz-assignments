CREATE TABLE product_type (
product_type_id   VARCHAR(20) PRIMARY KEY,
parent_type_id    VARCHAR(20),
has_table         TINYINT(1) DEFAULT 0,
description       VARCHAR(255),

    FOREIGN KEY (parent_type_id)
    REFERENCES product_type(product_type_id)
);


CREATE TABLE product (
product_id       VARCHAR(20) PRIMARY KEY,
product_type_id  VARCHAR(20),
product_name     VARCHAR(255),
description      VARCHAR(255),
created_date     DATETIME DEFAULT CURRENT_TIMESTAMP,


    FOREIGN KEY (product_type_id)
    REFERENCES product_type(product_type_id)
);


CREATE TABLE product_category (
product_category_id VARCHAR(20) PRIMARY KEY,
parent_category_id  VARCHAR(20),
description         VARCHAR(255),


    FOREIGN KEY (parent_category_id)
    REFERENCES product_category(product_category_id)
);


CREATE TABLE product_category_member (
product_id           VARCHAR(20),
product_category_id  VARCHAR(20),
from_date            DATETIME,
thru_date            DATETIME,

PRIMARY KEY (product_id, product_category_id, from_date),

    FOREIGN KEY (product_id)
    REFERENCES product(product_id),

    FOREIGN KEY (product_category_id)
    REFERENCES product_category(product_category_id)
);


CREATE TABLE product_feature_type (
product_feature_type_id VARCHAR(20) PRIMARY KEY,
parent_type_id          VARCHAR(20),
description             VARCHAR(255),


    FOREIGN KEY (parent_type_id)
    REFERENCES product_feature_type(product_feature_type_id)
);


CREATE TABLE product_feature (
product_feature_id      VARCHAR(20) PRIMARY KEY,
product_feature_type_id VARCHAR(20),
description             VARCHAR(255),

    FOREIGN KEY (product_feature_type_id)
    REFERENCES product_feature_type(product_feature_type_id)
);


CREATE TABLE product_feature_appl (
product_id          VARCHAR(20),
product_feature_id  VARCHAR(20),
from_date           DATETIME,
thru_date           DATETIME,

PRIMARY KEY (product_id, product_feature_id, from_date),

    FOREIGN KEY (product_id)
    REFERENCES product(product_id),

    FOREIGN KEY (product_feature_id)
    REFERENCES product_feature(product_feature_id)
);


CREATE TABLE unit_of_measure (
uom_id        VARCHAR(20) PRIMARY KEY,
description   VARCHAR(100)
);


CREATE TABLE product_price_type (
product_price_type_id VARCHAR(20) PRIMARY KEY,
description           VARCHAR(100)
);


CREATE TABLE product_price (
product_id              VARCHAR(20),
product_price_type_id   VARCHAR(20),
currency_uom_id         VARCHAR(20),
price                   DECIMAL(10,2),
from_date               DATETIME,
thru_date               DATETIME,

PRIMARY KEY (product_id, product_price_type_id, from_date),

    FOREIGN KEY (product_id)
    REFERENCES product(product_id),

    FOREIGN KEY (product_price_type_id)
    REFERENCES product_price_type(product_price_type_id),

    FOREIGN KEY (currency_uom_id)
    REFERENCES unit_of_measure(uom_id)
);


CREATE TABLE product_cost_type (
product_cost_type_id VARCHAR(20) PRIMARY KEY,
description          VARCHAR(100)
);


CREATE TABLE product_cost (
product_id            VARCHAR(20),
product_cost_type_id  VARCHAR(20),
cost                  DECIMAL(10,2),
from_date             DATETIME,
thru_date             DATETIME,

PRIMARY KEY (product_id, product_cost_type_id, from_date),

    FOREIGN KEY (product_id)
    REFERENCES product(product_id),

    FOREIGN KEY (product_cost_type_id)
    REFERENCES product_cost_type(product_cost_type_id)
);


CREATE TABLE product_association_type (
product_association_type_id VARCHAR(20) PRIMARY KEY,
description                 VARCHAR(100)
);


CREATE TABLE product_association (
product_id                  VARCHAR(20),
product_id_to               VARCHAR(20),
product_association_type_id VARCHAR(20),
from_date                   DATETIME,
thru_date                   DATETIME,

PRIMARY KEY (product_id, product_id_to, product_association_type_id, from_date),

    FOREIGN KEY (product_id)
    REFERENCES product(product_id),

    FOREIGN KEY (product_id_to)
    REFERENCES product(product_id),

    FOREIGN KEY (product_association_type_id)
    REFERENCES product_association_type(product_association_type_id)
);
