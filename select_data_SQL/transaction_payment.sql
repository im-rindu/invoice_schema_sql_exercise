select 
  transaction.trasaction_code as invoice_number,
  payment.name as payment_name,
  tp.amount as payment_amount
from invoice.transaction_payment tp
  inner join invoice.payment payment
    on payment.id = tp.payment_id
  inner join invoice.transaction transaction
    on transaction.id = tp.transaction_id
where
  transaction_id = 3