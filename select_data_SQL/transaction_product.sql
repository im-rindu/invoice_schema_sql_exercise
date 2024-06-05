select 
  transaction.trasaction_code as invoice_number,
  product.name as product_name,
  tp.amount as quantity,
  tp.cur_product_price as price,
  tp.cur_product_price * tp.amount as total_price,
  tp.curr_weight as total_weight
from invoice.transaction_product tp
  inner join invoice.product product
    on product.id = tp.product_id
  inner join invoice.transaction transaction
    on transaction.id = tp.transaction_id
where
  transaction_id = 3