drop table if exists person_audit;

create table person_audit (
    created timestamp with time zone default(current_timestamp(0)) not null,
    type_event char(1) default('I') not null,
    constraint type_event check(type_event in ('I', 'U', 'D')),
    row_id bigint primary key ,
    name varchar not null,
    age integer not null default 10,
    gender varchar default 'female' not null,
    address varchar
);

create
or replace function fnc_trg_person_insert_audit() 
returns trigger as $person_audit$ 
begin 
if (tg_op = 'INSERT') then
insert into
    person_audit
values(
    default,
    'I',
    new.*);
return new;
end if;
end;
$person_audit$ language plpgsql;

create trigger person_audit after insert on person 
for each row execute function fnc_trg_person_insert_audit();


insert into person values (10,'Damir', 22, 'male', 'Irkutsk');