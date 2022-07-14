-- FUNCTIONS.
-- Creating tables.
-- The first table is called table_main with attributes name, id, and type, where type can only be "IN" or "EX".
-- A second table called table_in with the ID of all teachers with attribute type = "IN" and another table called table_ex of all teachers, where type = "EX".

-- Function.

create or replace function trig_fun() 
returns trigger AS
$$
declare

	name varchar;
	id integer;
	type varchar;
	pic varchar;

begin

 type = new.type;
 id = new.id;
 name = new.name;
 pic = new.pic; 

if(type = 'IN') then
insert into table_in values(new.name, new.id, new.type, new.pic);
end if;

if(type = 'EX') then
insert into table_ex values(new.name, new.id, new.type, new.pic);
end if;

return new;
end;
$$
language plpgsql

-- Trigger.

create trigger trig_on_insert 
after insert on 
table_main
for each row
execute procedure trig_fun()