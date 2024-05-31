insert into
  invoice.shipper ("name", "shipping_fee")
values
  ('SiNgebut', 10000);

insert into
  invoice.shipper ("name", "shipping_fee")
values
  ('EntarAja', 9000);

insert into
  invoice.shipper ("name", "shipping_fee")
values
  ('Iki', 13000);

insert into
  invoice.seller ("name", "address")
values
  (
    'Toko Bata Merah Bersahaja',
    'Jl. komplek pertokoan bersahaja'
  );

insert into
  invoice.seller ("name", "address")
values
  ('Toko Emas Tidak Barokah', 'Jl. tol km 72');

insert into
  invoice.seller ("name", "address")
values
  ('Cilok Baso Frozen', 'Jl. Beku kaya kutub no 88');

insert into
  invoice.user ("name", "address")
values
  ('Dono Perkoso', 'Jl. rumah rumahan no 881');

insert into
  invoice.user ("name", "address")
values
  ('Asep Surkasep', 'Jl. Asosiasi Asep Amanah no 2');

insert into
  invoice.user ("name", "address")
values
  ('Toni Hartoni', 'Jl. martono haroto no 1');


insert into
  invoice.product ("name", "price")
values
  ('Laptop canggih paling canggih', 100000);

insert into
  invoice.product ("name", "price")
values
  ('Susu kotak 1 dus', 230000);

insert into
  invoice.product ("name", "price")
values
  ('Handle Pintu 2 arah', 300000);



insert into
  invoice.payment_type ("name")
values
  ('Credit or Debit Card');

insert into
  invoice.payment_type ("name")
values
  ('Virtual Account');

insert into
  invoice.payment_type ("name")
values
  ('Poin');

insert into
  invoice.promo_requirement ("requirement")
values
  ('Minimal belanja 20000');

insert into
  invoice.promo_requirement ("requirement")
values
  ('Gunakan virtual account ABC');

insert into
  invoice.promo_requirement ("requirement")
values
  ('Beli di Toko Bata Merah Bersahaja');

