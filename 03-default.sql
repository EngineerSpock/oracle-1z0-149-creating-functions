create or replace function calc_increased_salary (
    emp_id number, rate number:=1/2
) return number as
    new_salary number;
begin
    select salary + (salary * rate) into new_salary    
    from employees
    where employee_id = emp_id;

    return new_salary;
end;

select * from employees;
begin
    dbms_output.put_line(calc_increased_salary(100, 1/2));
end;

begin
    dbms_output.put_line(calc_increased_salary(100));
end;

begin
    dbms_output.put_line(calc_increased_salary(100, rate => 1/2));
    dbms_output.put_line(calc_increased_salary(emp_id => 100, rate => 1/2));
    dbms_output.put_line(calc_increased_salary(emp_id => 100));
    
    --won't compile
    dbms_output.put_line(calc_increased_salary(emp_id => 100, 1/2));
end;