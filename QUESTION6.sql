create or replace PROCEDURE X_QUES6 IS
BEGIN

SELECT COUNT(ORDER_ID) AS TOTAL_ORDER, to_char(ORD_L_LINE_AMOUNT , '99,999,990.00') FROM tbl_order_list c where a.ORDER_ID = c.ORDER_ID AND c.ord_l_date >=  '2017-01-01' and c.ord_l_date < '2017-08-31', 
(SELECT SUPP_NAME, SUBSTR(a.SUPP_CONTACT_NUMBER,1, INSTR(a.SUPP_CONTACT_NUMBER, '.')-1) AS SUPPL_NUMBER1 , 
SUBSTR(a.SUPP_CONTACT_NUMBER, INSTR(a.SUPP_CONTACT_NUMBER,',')+1) AS SUPPL_NUMBER2 
regexp_replace(to_char(SUPPL_NUMBER1),((^|, )(('[0-9]{3})([0-9]{3})([0-9]{4})','\1-\2-\3')|'([0-9]{4})([0-9]{3})([0-9]{4})','\1-\2-\3')))+$'),
regexp_replace(to_char(SUPPL_NUMBER2),((^|, )(('[0-9]{3})([0-9]{3})([0-9]{4})','\1-\2-\3')|'([0-9]{4})([0-9]{3})([0-9]{4})','\1-\2-\3')))+$')

FROM tbl_supplier a where a.supp_id = b.supp_id)

from tbl_order;


end X_QUES6;