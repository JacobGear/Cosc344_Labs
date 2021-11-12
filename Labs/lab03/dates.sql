drop table dates;

create table dates(
    justDate date,
    dateAndTime date
);

insert into dates values (to_date('2018-01-01', 'YYYY-MM-DD'), to_date('2017-01-21 12:34:56', 'YYYY-MM-DD HH24:MI:SS'));
insert into dates values (to_date('2019-02-02', 'YYYY-MM-DD'), to_date('2018-02-22 12:34:56', 'YYYY-MM-DD HH24:MI:SS'));
insert into dates values (to_date('2020-03-03', 'YYYY-MM-DD'), to_date('2019-03-23 12:34:56', 'YYYY-MM-DD HH24:MI:SS'));
insert into dates values (to_date('2021-04-04', 'YYYY-MM-DD'), to_date('2020-04-24 12:34:56', 'YYYY-MM-DD HH24:MI:SS'));

select * from dates;

select to_char(justDate, 'DD-MM-YYYY') from dates;
select to_char(justDate, 'MM/DD/YYYY') from dates;

select to_char(dateAndTime, 'DD/MM/YY HH:MI:SS') from dates;
