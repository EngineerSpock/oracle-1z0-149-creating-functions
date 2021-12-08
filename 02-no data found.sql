begin
	dbms_output.put_line(get_avg_salary('1AD_PRES'));
end;

select get_avg_salary('1AD_PRES') from dual;

create or replace function get_avg_salary (
    p_job_id varchar2
) return number as
    avg_salary number;
begin
    select(max_salary + min_salary) / 2
    into avg_salary
    from jobs
    where job_id = p_job_id;

    return avg_salary;
exception
	when no_data_found then
		return -1;
end;