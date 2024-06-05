CREATE SCHEMA invoice;


CREATE TABLE invoice."transaction" (
	"id" serial NOT NULL,
	"trasaction_code" text NOT NULL,
	"seller_id" int NOT NULL,
	"user_id" int NOT NULL,
	"shipper_id" int NOT NULL,
	"transaction_date" TIMESTAMPTZ NOT NULL,
	"is_asuransi" boolean NOT NULL,
	"total_asuransi_fee" float NOT NULL,
	"total_shipping" float NOT NULL,
	"service_fee" float,
	"app_fee" float,
	"created_at" TIMESTAMPTZ DEFAULT current_timestamp,
	"updated_at" TIMESTAMPTZ DEFAULT current_timestamp,
	"deleted_at" TIMESTAMPTZ,
	
	"total_transaction" float NOT NULL,
	PRIMARY KEY("id")
);

CREATE TABLE invoice."seller" (
	"id" serial NOT NULL,
	"name" text,
	"address" text,
	"created_at" TIMESTAMPTZ DEFAULT current_timestamp,
	"updated_at" TIMESTAMPTZ DEFAULT current_timestamp,
	"deleted_at" TIMESTAMPTZ,
	
	PRIMARY KEY("id")
);

CREATE TABLE invoice."user" (
	"id" serial NOT NULL,
	"name" text,
	"address" text,
	"created_at" TIMESTAMPTZ DEFAULT current_timestamp,
	"updated_at" TIMESTAMPTZ DEFAULT current_timestamp,
	"deleted_at" TIMESTAMPTZ,
	
	PRIMARY KEY("id")
);

CREATE TABLE invoice."shipper" (
	"id" serial NOT NULL,
	"name" text,
	"shipping_fee" float,
	
	PRIMARY KEY("id")
);

CREATE TABLE invoice."transaction_product" (
	"id" serial NOT NULL,
	"transaction_id" int,
	"product_id" int,
	"amount" int,
	"cur_product_price" float,
	"created_at" TIMESTAMPTZ DEFAULT current_timestamp,
	"updated_at" TIMESTAMPTZ DEFAULT current_timestamp,
	"deleted_at" TIMESTAMPTZ,
	
	PRIMARY KEY("id")
);

CREATE TABLE invoice."product" (
	"id" serial NOT NULL,
	"name" text,
	"price" float,
	"created_at" TIMESTAMPTZ DEFAULT current_timestamp,
	"updated_at" TIMESTAMPTZ DEFAULT current_timestamp,
	"deleted_at" TIMESTAMPTZ,
	
	PRIMARY KEY("id")
);

CREATE TABLE invoice."transaction_payment" (
	"id" serial NOT NULL,
	"transaction_id" int,
	"payment_id" int,
	"amount" float DEFAULT 0,
	"created_at" TIMESTAMPTZ DEFAULT current_timestamp,
	"updated_at" TIMESTAMPTZ DEFAULT current_timestamp,
	"deleted_at" TIMESTAMPTZ,
	
	PRIMARY KEY("id")
);

CREATE TABLE invoice."payment" (
	"id" serial NOT NULL,
	"name" text,
	"payment_type_id" int,
	"created_at" TIMESTAMPTZ DEFAULT current_timestamp,
	"updated_at" TIMESTAMPTZ DEFAULT current_timestamp,
	"deleted_at" TIMESTAMPTZ,
	
	PRIMARY KEY("id")
);

CREATE TABLE invoice."payment_type" (
	"id" serial NOT NULL,
	"name" text,
	"created_at" TIMESTAMPTZ DEFAULT current_timestamp,
	"updated_at" TIMESTAMPTZ DEFAULT current_timestamp,
	"deleted_at" TIMESTAMPTZ,
	
	PRIMARY KEY("id")
);

CREATE TABLE invoice."transaction_promo" (
	"id" serial NOT NULL,
	"transaction_id" int,
	"promo_id" int,
	"created_at" TIMESTAMPTZ DEFAULT current_timestamp,
	"updated_at" TIMESTAMPTZ DEFAULT current_timestamp,
	"deleted_at" TIMESTAMPTZ,
	PRIMARY KEY("id")
);

CREATE TYPE invoice."type_t" AS ENUM ('cashback', 'discount', 'free_shipment');

CREATE TYPE invoice."amount_type_t" AS ENUM ('percent', 'flat');


CREATE TABLE invoice."promo" (
	"id" serial NOT NULL,
	"name" text,
	"code" text,
	"type" invoice.type_t,
	"amount" float,
	"amount_type" invoice.amount_type_t,
	"requirement_id" int,
	"quota" int DEFAULT 0,
	"start_date" TIMESTAMPTZ DEFAULT current_timestamp,
	"end_date" TIMESTAMPTZ DEFAULT current_timestamp,
	"created_at" TIMESTAMPTZ DEFAULT current_timestamp,
	"updated_at" TIMESTAMPTZ DEFAULT current_timestamp,
	"deleted_at" TIMESTAMPTZ,
	
	PRIMARY KEY("id")
);

CREATE TABLE invoice."promo_requirement" (
	"id" serial NOT NULL,
	"requirement" text,
	"created_at" TIMESTAMPTZ DEFAULT current_timestamp,
	"updated_at" TIMESTAMPTZ DEFAULT current_timestamp,
	"deleted_at" TIMESTAMPTZ,
	
	PRIMARY KEY("id")
);

CREATE TABLE
  invoice.redeemed_promo (
    id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    user_id BIGINT NOT NULL,
    promo_id BIGINT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
    deleted_at TIMESTAMP WITH TIME ZONE,
    FOREIGN KEY (user_id) REFERENCES invoice."user" (id),
    FOREIGN KEY (promo_id) REFERENCES invoice.promo (id)
  );

ALTER TABLE invoice."transaction"
ADD FOREIGN KEY("seller_id") REFERENCES invoice."seller"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE invoice."transaction"
ADD FOREIGN KEY("user_id") REFERENCES invoice."user"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE invoice."transaction"
ADD FOREIGN KEY("shipper_id") REFERENCES invoice."shipper"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE invoice."transaction_product"
ADD FOREIGN KEY("transaction_id") REFERENCES invoice."transaction"("id")
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE invoice."transaction_product"
ADD FOREIGN KEY("product_id") REFERENCES invoice."product"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE invoice."transaction_payment"
ADD FOREIGN KEY("transaction_id") REFERENCES invoice."transaction"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE invoice."transaction_payment"
ADD FOREIGN KEY("payment_id") REFERENCES invoice."payment"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE invoice."payment"
ADD FOREIGN KEY("payment_type_id") REFERENCES invoice."payment_type"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE invoice."transaction_promo"
ADD FOREIGN KEY("transaction_id") REFERENCES invoice."transaction"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE invoice."transaction_promo"
ADD FOREIGN KEY("promo_id") REFERENCES invoice."promo"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;

ALTER TABLE invoice."promo"
ADD FOREIGN KEY("requirement_id") REFERENCES invoice."promo_requirement"("id")
ON UPDATE NO ACTION ON DELETE NO ACTION;