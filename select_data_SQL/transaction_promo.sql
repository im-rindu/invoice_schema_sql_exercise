select 
  transaction.trasaction_code as invoice_number,
  promo.name as promo_name,
  promo.amount as promo_amount
from invoice.transaction_promo tp
  inner join invoice.promo promo
    on promo.id = tp.promo_id
  inner join invoice.transaction transaction
    on transaction.id = tp.transaction_id
where
  transaction_id = 3