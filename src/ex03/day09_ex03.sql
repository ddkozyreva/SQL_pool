drop trigger trg_person_insert_audit on person;
drop trigger trg_person_update_audit on person;
drop trigger trg_person_delete_audit on person;

drop function fnc_trg_person_insert_audit;
drop function fnc_trg_person_update_audit;
drop function fnc_trg_person_delete_audit;

create
or replace function fnc_trg_person_audit() 
returns trigger as $trg_person_delete_audit$ 
begin

if (tg_op = 'INSERT') then
insert into
    person_audit
values(
    default,
    'I',
    new.*);
end if;

if (tg_op = 'UPDATE') then
insert into
    person_audit
values(
    default,
    'U',
    new.*);
end if;

if (tg_op = 'DELETE') then
insert into
    person_audit
values(
    default,
    'D',
    old.*);
end if;
return new;

end;
$trg_person_delete_audit$ language plpgsql;

create trigger trg_person_delete_audit after insert or update or delete on person 
for each row execute function fnc_trg_person_audit();
INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;