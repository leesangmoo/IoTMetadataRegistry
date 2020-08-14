show databases;

create table device_register_table (
	id int(10) not null auto_increment primary key,
	model_name varchar(30) not null,
	registration_time datetime not null,
	device_type varchar(30) not null,
	manufacturer varchar(30) not null,
	category varchar(30) not null
);

drop table device_register_table;

create table specific_metadata (
	id varchar(20) not null,
	metadata_key varchar(30) not null,
	metadata_value varchar(30) not null
);

create table device_register (
	id int(10) not null auto_increment primary key,
	item_id varchar(50) not null,
	office_name varchar(50) not null,
	deployment_time varchar(100) not null,
	latitude double not null,
	longitude double not null
);

drop table device_register; 

select last_insert_id() from device_register_table;
