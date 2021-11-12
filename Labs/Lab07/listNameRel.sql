declare
	cursor cs is select * from dependent;
	dpt cs%rowtype;
begin
	for dpt in cs
	loop
	dbms_output.put_line(dpt.dependent_name || ' ' || dpt.relationship);
	end loop;
end;
/
