select 
    transaction.trasaction_code as invoice_number,
    transaction.created_at as transaction_date,
    buyer.name as user_name,
    buyer.address as user_address,
    seller.name as seller_name,
    shipper.name as shipper_name,
    SUM(tp.cur_product_price * tp.amount) as total_price,
    transaction.total_shipping,
    transaction.is_asuransi,
    transaction.total_asuransi_fee,
    SUM(tp.cur_product_price * tp.amount) + transaction.total_shipping + transaction.total_asuransi_fee as total_purchase,
    transaction.service_fee,
    transaction.app_fee,
    SUM(tp.cur_product_price * tp.amount) + transaction.total_shipping + transaction.total_asuransi_fee + transaction.service_fee + transaction.app_fee as total_bill,
    SUM(promo.amount) as total_promo
  from invoice.transaction transaction
  inner join invoice.seller seller
    on seller.id = transaction.seller_id 
  inner join invoice.shipper shipper
    on shipper.id = transaction.shipper_id
  inner join invoice.user buyer
    on buyer.id = transaction.user_id
  inner join invoice.transaction_product tp
    on tp.transaction_id = transaction.id
  inner join invoice.transaction_promo tpr
    on tpr.transaction_id = transaction.id
  inner join invoice.promo promo
    on tpr.promo_id = promo.id
  group by
    invoice_number,
    transaction.created_at,
    user_name,
    user_address,
    seller_name,
    shipper_name,
    transaction.total_shipping,
    transaction.is_asuransi,
    transaction.total_asuransi_fee,
    transaction.service_fee,
    transaction.app_fee
  limit 100;