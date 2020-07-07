show databases;

create table device_register_table (
	id varchar(50) not null,
	registration_time datetime not null,
	device_type varchar(50) not null,
	manufacturer varchar(50) not null,
	category varchar(50) not null
);

drop table device_register_table;