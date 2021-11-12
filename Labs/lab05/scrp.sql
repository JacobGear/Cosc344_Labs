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

/* Q18 */
select distinct s.snum, s.sname from salespeople s, customers outer where exists (select * from customers inner where inner.snum=outer.snum and inner.cnum <> outer.cnum) and s.snum=outer.snum;

/* Q19 */
select * from orders outer where amt > (select avg(amt) from orders inner where outer.cnum=inner.cnum);

/* Q20 */
select fname, lname from employee where not exists (select * from dependent where ssn=essn);

/* Q21 */
select pnumber from project p, employee e, department d where d.mgrssn = e.ssn and d.dnumber=p.dnum and lname='Smith' union select pno from  works_on w, employee e where e.ssn = w.essn and lname='Smith'; 

/* Q22 */
select lname, salary from employee;

/* Q23 */
drop table hou_emp;
create table hou_emp as (select * from employee where address like '%Houston%');
select * from hou_emp;

/* Q24 */
drop table emp_dep;
create table emp_dep as (select e.fname, e.lname, d.dependent_name, d.sex, d.bdate from employee e, dependent d where e.ssn = d.essn);
select * from emp_dep;
