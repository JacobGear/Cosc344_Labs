DROP TABLE e1 cascade constraints;
DROP TABLE d1 cascade constraints;

CREATE TABLE d1
  (dname        VARCHAR2(15)  NOT NULL UNIQUE,
   dnumber      NUMBER(2)     PRIMARY KEY,
   tot_sal      NUMBER(12) DEFAULT 0);

INSERT INTO d1 VALUES
   ('Research', 5, 0);
INSERT INTO d1 VALUES
   ('Administration', 4, 0);
INSERT INTO d1 VALUES
   ('Headquarters', 1, 0);


CREATE TABLE e1
  (fname    VARCHAR2(15) NOT NULL,
   ssn      CHAR(9)      PRIMARY KEY,
   salary   NUMBER(6),
   dno      INT          NOT NULL 
      REFERENCES d1(dnumber));

create or replace trigger update_salary
        after update or insert or delete of salary on e1
        for each row
        begin
                if inserting then
                        update d1
                        set tot_sal = tot_sal + :NEW.salary
                        where dnumber = :NEW.dno;
                elsif updating then
                        update d1
                        set tot_sal = tot_sal + :NEW.salary - :OLD.salary
                        where dnumber = :OLD.dno;
                else -- deleting
                        update d1
                        set tot_sal = tot_sal - :OLD.salary
                        where dnumber = :OLD.dno;
                end if;
        end;
        /
create or replace trigger changing_departments
        after update of dno on e1
        for each row
        begin
                update d1
                set tot_sal = tot_sal + :NEW.salary
                where dnumber = :NEW.dno;
                update d1
                set tot_sal = tot_sal - :NEW.salary
                where dnumber = :OLD.dno;
        end;
        /

INSERT INTO e1 VALUES
  ('John','123456789',30000,5);
INSERT INTO e1 VALUES
  ('Franklin','333445555',40000,5);
INSERT INTO e1 VALUES
  ('Alicia','999887777',25000,4);
INSERT INTO e1 VALUES
  ('Jennifer','987654321',43000,4);
INSERT INTO e1 VALUES
  ('Ramesh','666884444',38000,5);
INSERT INTO e1 VALUES
  ('Joyce','453453453',25000,5);
INSERT INTO e1 VALUES
  ('Ahmad','987987987',25000,4);
INSERT INTO e1 VALUES
  ('James','888665555',55000,1);

/* my inserts */
select * from d1;
insert into e1 values
	('Jacob', '543216789', 10000, 1);
select * from d1;
update e1 set salary='20000' where ssn='543216789';
select * from d1;
update e1 set dno=4 where ssn='543216789';
select * from d1;
delete from e1 where ssn='543216789';
select * from d1;


COMMIT;










