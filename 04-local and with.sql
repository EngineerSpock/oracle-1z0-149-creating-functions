create table highest_paid_employees as
select *
from employees
where 1 = 2;

declare   
    function get_avg_sal return number as
    avg_sal number;
    begin
        select avg(salary)
        into avg_sal
        from employees;
        
        return avg_sal;
    end;

    procedure insert_high_paid_emps as        
        avg_sal number;
    begin
        avg_sal := get_avg_sal();
        
        insert into highest_paid_employees
        select *
        from employees
        where salary > avg_sal;
    end;
begin
    insert_high_paid_emps();
end;

select * from highest_paid_employees;

with function get_avg_salary return number as
    avg_sal number;
    begin
        select avg(salary)
        into avg_sal
        from employees;
        
        return avg_sal;
    end;
select *
from employees
where salary > get_avg_salary();