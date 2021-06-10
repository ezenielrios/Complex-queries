/*Write a query to count the number of invoices.*/

select count(*)
FROM Invoice;

/*Create a query to produce the total purchase per invoice, sorted by invoice number. The invoice total is the sum of the product purchases in the LINE that corresponds to the INVOICE. */

select invoice.inv_number, sum(line_units* line_price) as 'invoice total'
from invoice
join line on invoice.inv_number = line.inv_number
group by invoice.inv_number
order by invoice.inv_number;

 /*List the balances of customers who have made purchases during the current invoice cycle—that is, for the customers who appear in the INVOICE table. Sort the results by customer code */
 
 select distinct invoice.cus_code, cus_balance
 from customer
 join invoice on customer.cus_code = invoice.cus_code
 order by cus_code;
 
 /*Create a query to find the balance characteristics for all customers (ie sum, min, max, and average).*/
 
 select sum(cus_balance) as 'Total Balance', min(cus_balance) as 'Minimum Balance', AVG(cus_balance) as 'Average Balance'
 from customer;
 
 /*Find the listing of customers who did not make purchases during the invoicing period. Sort the results by customer code.  */
 
 select *
 from customer
 where cus_code not in (select cus_code from invoice)
 order by cus_code;
 
 /*Write a query using a left join to join all records from the vendor table and those that match from the product table. */
 
 select * from Vendor left join product on vendor.v_code = product.v_code;