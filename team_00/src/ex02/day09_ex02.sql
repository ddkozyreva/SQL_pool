create
or replace function fnc_trg_person_delete_audit() 
returns trigger as $trg_person_delete_audit$ 
begin 
if (tg_op = 'DELETE') then
insert into
    person_audit
values(
    default,
    'D',
    old.*);
return new;
end if;
end;
$trg_person_delete_audit$ language plpgsql;

create trigger trg_person_delete_audit after delete on person 
for each row execute function fnc_trg_person_delete_audit();

delete from person where id = 10;
