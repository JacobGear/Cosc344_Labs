/* Q1  */
describe employee;

/* Q2 */
select dependent_name from dependent where relationship='Daughter' OR relationship='Spouse';

/* Q3 */
select * from project where plocation is null;

/* Q4 */
select fname, lname, dname from employee, department where ssn=mgrssn;

/* Q5 */
select distinct(fname), lname from employee, works_on where ssn=essn and hours < 18;

/* Q6 */
select fname, lname from employee where lname like 'W%';

/* Q7 */
select sname from salespeople where city in ('San Jose', 'Barcelona');

/* Q8 */
select cname, amt from customers, orders where amt between 1500 and 5000 and customers.cnum=orders.cnum;

/* Q9 */
select count(*) from orders;

/* Q10 */
select avg(amt) from orders;

/* Q11 */
select salespeople.snum, max(amt) from orders, salespeople where salespeople.snum=orders.snum group by salespeople.snum order by salespeople.snum;

/* Q12 */
select salespeople.snum, max(amt) from orders, salespeople where salespeople.snum=orders.snum group by salespeople.snum having max(amt) > 3000 order by salespeople.snum;

/* Q13 */
select fname, lname, salary from employee order by salary, lname;

/* Q14 */
select onum, cname, c.cnum, s.snum from salespeople s, customers c, orders o where o.cnum = c.cnum and o.snum = s.snum and not c.city = s.city;

/* Q15 */
select cname, amt from customers c, orders o where o.cnum = c.cnum and amt = (select max(amt) from orders);

/* Q16 */
select * from orders where amt > (select avg(amt) from orders where odate = to_date('03-10-1990', 'DD-MM-YYYY'));

/* Q17 */
select * from orders o where o.snum in (select s.snum from salespeople s where city = 'London') order by odate;
