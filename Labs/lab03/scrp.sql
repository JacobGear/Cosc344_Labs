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
