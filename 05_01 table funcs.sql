create or replace type rand_strings_t is table of varchar2(64);

create or replace function rand_strings(p_count int)
    return rand_strings_t
as
    strs rand_strings_t := rand_strings_t();
begin
    strs.extend(p_count);
    
    for idx in 1..p_count
    loop
        strs(idx) := dbms_random.string('u', 8);
    end loop;
    
    return strs;
end;

declare
    strs rand_strings_t := rand_strings(10);
begin
    for idx in 1 .. strs.count
    loop
        dbms_output.put_line(strs(idx));
    end loop;
end;
    
select column_value rand_string from table (rand_strings(10)); 

select column_value rand_string from rand_strings(10);