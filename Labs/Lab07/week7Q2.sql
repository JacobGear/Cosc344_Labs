create or replace procedure worked_hours(pnum in int)
as
	cursor cs is select * from works_on where pnum = pno;
	pro cs%rowtype;
	toolittle exception;
begin
	for pro in cs
	loop
	dbms_output.put_line(pro.essn || ' '  || pro.hours);
	if pro.hours < 8.0 then
		raise toolittle;
	end if;
	end loop;
exception
	when toolittle then dbms_output.put_line('Employee has worked less than 8.0 hours');
end;
/
