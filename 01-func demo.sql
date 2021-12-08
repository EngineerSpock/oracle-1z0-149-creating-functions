DECLARE
    avg_salary NUMBER;
BEGIN
    SELECT(max_salary + min_salary) / 2
    INTO avg_salary
    FROM jobs
    WHERE job_id = 'AD_PRES';

    dbms_output.put_line(avg_salary);
END;

CREATE OR REPLACE FUNCTION get_avg_salary (
    p_job_id VARCHAR2
) RETURN NUMBER AS
    avg_salary NUMBER;
BEGIN
    SELECT(max_salary + min_salary) / 2
    INTO avg_salary
    FROM jobs
    WHERE job_id = p_job_id;

    RETURN avg_salary;
END;

SELECT *
FROM jobs;

DECLARE
    avg_salary NUMBER;
BEGIN
    avg_salary := get_avg_salary('AD_PRES');
    dbms_output.put_line(avg_salary);
    dbms_output.put_line(get_avg_salary('AD_PRES'));
END;

-- part of SELECT:
select get_avg_salary('AD_PRES') from dual;

select job_id, job_title, get_avg_salary(job_id)
from jobs;