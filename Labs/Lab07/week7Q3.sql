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
		
