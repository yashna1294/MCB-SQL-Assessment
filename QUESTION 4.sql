create or replace PROCEDURE QUES4 IS
BEGIN 

Select Distinct (SELECT DISTINCT (TRIM(BOTH(REGEXP_REPLACE(ORDER_REF, '[^0-9A-Za-z ]+', '.')))) FROM tbl_order a where f.order_id = a.order_id ), 
(SELECT DISTINCT  ltrim(TO_CHAR(ORD_L_DATE(CHECKED_DATE,'dd/mm/yyyy'),'mm-yyyy'),'0'), ORD_L_STATUS,  to_char(ORD_L_TOTAL_AMOUNT, '99,999,990.00') FROM tbl_order_list b
where a.ORDER_ID = b.ORDER_ID),
(SELECT DISTINCT SUPP_NAME FROM tbl_SUPPLIER c
where a.SUPP_ID = c.SUPP_ID),
(SELECT DISTINCT INV_REFERENCE from tbl_INVOICE d where d.inv_id = f.INV_ID),(SELECT DISTINCT to_char(ORD_L_TOTAL_AMOUNT, '99,999,990.00'), INV_L_STATUS from tbl_INVOICE_LIST e
where d.INV_ID  = e. INV_ID ),
CASE
  WHEN INV_L_STATUS = 'Paid'  THEN 'OK'
  WHEN INV_L_STATUS = 'Pending' THEN 'To follow up'
  WHEN INV_L_STATUS = 'Blank'  THEN 'To verify'
END
from tbl_INV_order f;

end  QUES4;

