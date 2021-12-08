select * from all_objects 
where object_type in ('FUNCTION','PROCEDURE')
and owner = 'HR'

select * from all_procedures 
where object_type in ('FUNCTION','PROCEDURE') 
and owner = 'HR'

select * from user_objects
where object_name='GET_AVG_SALARY';

select line, text
from user_source
where name = 'GET_AVG_SALARY';

drop function get_avg_salary;

create or replace function get_name_by_id(obj_id number)
return varchar2
as
	obj_name varchar2(242);
begin
	select object_name into obj_name
	from all_procedures
	where object_id = obj_id;
	
	return obj_name;
end;

declare
	func_name varchar2(242);
begin
	func_name:=get_name_by_id(78162);
	
	execute immediate 'drop function ' || func_name;
end;