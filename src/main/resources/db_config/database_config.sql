
CREATE TABLE users (
                       id BIGSERIAL PRIMARY KEY,
                       username VARCHAR(50) UNIQUE NOT NULL,
                       email VARCHAR(100),
                       password VARCHAR(255) NOT NULL,
                       status VARCHAR(20) DEFAULT 'ACTIVE',
                       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE product (
                         id BIGSERIAL PRIMARY KEY,
                         name VARCHAR(100) NOT NULL,
                         price DECIMAL(12,2) NOT NULL,
                         stock INT NOT NULL,
                         status VARCHAR(20) DEFAULT 'ACTIVE',
                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
                        id BIGSERIAL PRIMARY KEY,
                        user_id BIGINT NOT NULL,
                        total_amount DECIMAL(12,2),
                        status VARCHAR(20),
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

                        CONSTRAINT fk_order_user
                            FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE order_item (
                            id BIGSERIAL PRIMARY KEY,
                            order_id BIGINT NOT NULL,
                            product_id BIGINT NOT NULL,
                            quantity INT NOT NULL,
                            price DECIMAL(12,2) NOT NULL,

                            CONSTRAINT fk_item_order
                                FOREIGN KEY (order_id) REFERENCES orders(id),

                            CONSTRAINT fk_item_product
                                FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE payment (
                         id BIGSERIAL PRIMARY KEY,
                         order_id BIGINT NOT NULL,
                         method VARCHAR(30),
                         status VARCHAR(20),
                         transaction_ref VARCHAR(100),
                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

                         CONSTRAINT fk_payment_order
                             FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE transaction_log (
                                 id BIGSERIAL PRIMARY KEY,
                                 ref_id VARCHAR(100),
                                 action VARCHAR(50),
                                 status VARCHAR(20),
                                 message TEXT,
                                 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

