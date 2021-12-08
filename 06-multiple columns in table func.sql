create type emp_high_sal_ot is object
(
	full_name varchar2(64),
	phone_number varchar(20),
	salary_number(10,2)
);
create type emp_high_sal_nt is table of emp_high_sal_ot;

create or replace function get_highest_paid_emps return emp_high_sal_nt
as
	rec_set emp_high_sal_nt;
	avg_sal number;
begin
	select avg(salary)
	into avg_salf
	from employees;
	
	select emp_high_sal_ot(
		last_name || ' ' || first_name,
		phone_number,
		salary
	)
	bulk collect into rec_set
	from employees
	where salary > avg_sal;
	
	return rec_set;
end;