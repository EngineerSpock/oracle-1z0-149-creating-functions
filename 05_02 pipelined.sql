create or replace function rand_strings_pl(p_count int)
    return rand_strings_t
    PIPELINED
as
    strs rand_strings_t := rand_strings_t();
begin
    strs.extend(p_count);
    
    for idx in 1..p_count
    loop
        pipe row (dbms_random.string('u', 8));
    end loop;
    
    return;
end;

select *
from table(rand_strings_pl(10));

select *
from rand_strings_pl(10);