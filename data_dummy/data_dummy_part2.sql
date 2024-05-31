insert into
  invoice.transaction ("trasaction_code", "seller_id", "user_id", "shipper_id", "transaction_date", "is_asuransi", "total_asuransi_fee", "total_shipping", "service_fee", "app_fee", "total_transaction")
values
  ('tr-001', 1, 1, 1, NOW(), true, 2000, 3000, 1000, 1000, 400000 );
  
insert into
  invoice.transaction ("trasaction_code", "seller_id", "user_id", "shipper_id", "transaction_date", "is_asuransi", "total_asuransi_fee", "total_shipping", "service_fee", "app_fee", "total_transaction")
values
  ('tr-002', 1, 2, 3, NOW(), false, 0, 5000, 2000, 500, 900000 );

insert into
  invoice.transaction ("trasaction_code", "seller_id", "user_id", "shipper_id", "transaction_date", "is_asuransi", "total_asuransi_fee", "total_shipping", "service_fee", "app_fee", "total_transaction")
values
  ('tr-003', 2, 3, 2, NOW(), true, 2000, 3000, 1000, 1000, 80000 );
