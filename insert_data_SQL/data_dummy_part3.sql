
insert into
  invoice.transaction_product ("transaction_id", "product_id", "amount", "cur_product_price")
values
  (3,1,2,200000);

insert into
  invoice.transaction_product ("transaction_id", "product_id", "amount", "cur_product_price")
values
  (3,2,1,300000);

insert into
  invoice.transaction_product ("transaction_id", "product_id", "amount", "cur_product_price")
values
  (2,3,3,50000);

  insert into
  invoice.payment ("name", payment_type_id)
values
  ('BRIVA', 1);

insert into
  invoice.payment ("name", payment_type_id)
values
  ('BCA VA', 1);

insert into
  invoice.payment ("name", payment_type_id)
values
  ('Gopay Coin', 2);


insert into
  invoice.promo ("name", "code", "type", "amount", "amount_type", "requirement_id")
values
  ('Discount 10%', 'P-001', 'discount', 0.1, 'percent', 1);

insert into
  invoice.promo ("name", "code", "type", "amount", "amount_type", "requirement_id")
values
  ('Cashback 20%', 'P-002', 'cashback', 0.2, 'percent', 3);

insert into
  invoice.promo ("name", "code", "type", "amount", "amount_type", "requirement_id")
values
  ('Free Ongkir Rp 5000', 'P-003', 'free_shipment', 5000, 'flat', 2);
