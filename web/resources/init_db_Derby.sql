
CREATE  TABLE customer (
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1) ,
  name VARCHAR(45) NOT NULL ,
  email VARCHAR(45) NOT NULL ,
  phone VARCHAR(45) NOT NULL ,
  address VARCHAR(45) NOT NULL ,
  city_region VARCHAR(2) NOT NULL ,
  cc_number VARCHAR(19),
  PRIMARY KEY (id) );

CREATE  TABLE customer_order (
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1) ,
  amount DECIMAL(6,2) NOT NULL ,
  date_created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  confirmation_number INT  NOT NULL ,
  customer_id INT NOT NULL ,
  PRIMARY KEY (id) ,
  CONSTRAINT fk_customer_order_customer
    FOREIGN KEY (customer_id)
    REFERENCES customer (id ));

CREATE  TABLE category (
   id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1) ,
  name VARCHAR(45) NOT NULL ,
  PRIMARY KEY (id));

CREATE  TABLE product (
  id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1) ,
  name VARCHAR(45) NOT NULL ,
  price DECIMAL(5,2) NOT NULL ,
  description VARCHAR(45) ,
  last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  category_id INTEGER NOT NULL ,
  PRIMARY KEY (id) ,
  CONSTRAINT fk_product_category1
    FOREIGN KEY (category_id )
    REFERENCES category (id ));

CREATE  TABLE ordered_product (
  customer_order_id INT  NOT NULL ,
  product_id INT  NOT NULL ,
  quantity SMALLINT  NOT NULL DEFAULT 1 ,
  PRIMARY KEY (customer_order_id, product_id) ,
  CONSTRAINT fk_ordered_product_customer_order
    FOREIGN KEY (customer_order_id)
    REFERENCES customer_order (id ),
  CONSTRAINT fk_ordered_product_product
    FOREIGN KEY (product_id)
    REFERENCES product (id));

INSERT INTO customer (name,email,phone,address,city_region) VALUES ('valen','valen@hotmail.com','4444','barna','ba');

INSERT INTO category (name) VALUES ('FISH'),('DOGS'),('CATS'),('BIRDS');

INSERT INTO  product  ( name , price, description, category_id) VALUES ('Angelfish', 1.70, 'Salt Water fish from Australia', 1);
INSERT INTO  product  ( name , price, description, category_id) VALUES ('Tiger Shark', 2.39, 'Salt Water fish from Australia', 1);
INSERT INTO  product  ( name , price, description, category_id) VALUES ('Koi', 1.09, 'unsalted (250g)', 1);
INSERT INTO  product  ( name , price, description, category_id) VALUES ('Goldfish', 1.76, 'Fresh Water fish from China', 1);

INSERT INTO  product  ( name , price, description, category_id) VALUES ('Bulldog', 2.29, 'Friendly dog from England', 2);
INSERT INTO  product  ( name , price, description, category_id) VALUES ('Poodle', 3.49, 'Cute dog from France', 2);
INSERT INTO  product  ( name , price, description, category_id) VALUES ('Dalmation', 2.59, 'Great dog for a Fire Station', 2);
INSERT INTO  product  ( name , price, description, category_id) VALUES ('Golden Retriever', 3.55, 'Great family dog', 2);

INSERT INTO  product  ( name , price, description, category_id) VALUES ('Manx', 1.89, 'Great for reducing mouse populations', 3);
INSERT INTO  product  ( name , price, description, category_id) VALUES ('Persian', 1.19, 'Friendly house cat, doubles as a princess', 3);

INSERT INTO  product  ( name , price, description, category_id) VALUES ('Amazon Parrot', 1.59, 'Great companion for up to 75 years', 4);
INSERT INTO  product  ( name , price, description, category_id) VALUES ('Finch', 2.49, 'Great stress reliever', 4);


