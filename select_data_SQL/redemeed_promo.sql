select 
  buyer.name as user_name,
  promo.name as promo_name,
  rp.created_at as redeem_at
from invoice.redeemed_promo rp
  inner join invoice.promo promo
    on promo.id = rp.promo_id
  inner join invoice."user" buyer
    on buyer.id = rp.user_id