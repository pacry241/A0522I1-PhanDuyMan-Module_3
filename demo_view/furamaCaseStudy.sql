CREATE DATABASE furamaCaseStudy;
drop database if exists furamaCaseStudy;
USE furamaCaseStudy;
create table `position`(
position_id int primary key,
position_name varchar(45)
);

create table education_degree(
education_degree_id int primary key,
education_degree_name varchar(45)
);

create table division(
division_id int primary key,
division_name varchar(45)
);

create table `role`(
role_id int primary key,
role_name varchar(255)
);

create table `user`(
username varchar(255) primary key,
`password` varchar(255)
);

create table user_role(
role_id int,
username varchar(255),

constraint u_role_id foreign key (role_id) REFERENCES `role`(role_id),
constraint u_username foreign key (username) REFERENCES `user`(username)
);



create table attach_service(
attach_service_id int primary key,
attach_service_name varchar(45),
attach_service_cost double,
attach_service_unit int,
attach_service_status varchar(45)
);


create table rent_type(
rent_type_id int  primary key,
rent_type_name varchar(45),
rent_type_cost double
);

create table service_type(
service_type_id int primary key,
service_type_name varchar(45)
);

create table service(
service_id int primary key,
service_name varchar(45),
service_area int,
service_cost double,
service_max_people int,
rent_type_id int,
service_type_id int,
standard_room varchar(45),
description_other_covenience varchar(45),
pool_area double,
number_of_floors int,

constraint s_rent_id foreign key (rent_type_id) REFERENCES rent_type(rent_type_id),
constraint s_service_id foreign key (service_type_id) REFERENCES service_type(service_type_id)
);

create table customer_type(
customer_type_id int primary key,
customer_type_name varchar(45)
);

create table customer(
customer_id varchar(15) primary key,
customer_type_id int,
customer_name varchar(45),
customer_birthday Date,
customer_gender bit(1),
customer_id_card varchar(45),
customer_phone varchar(45),
customer_email varchar(45),
customer_address varchar(45),

foreign key (customer_type_id) REFERENCES customer_type(customer_type_id)
);

create table employee(
employee_id int primary key,
employee_name varchar(45),
employee_birthday date,
employee_id_card varchar(45),
employee_salary double,
employee_phone varchar(45),
employee_email varchar(45),
employee_address varchar(45),
position_id int,
education_degree_id int,
division_id int ,
username varchar(255),

constraint e_position_id foreign key (position_id) REFERENCES `position`(position_id),
constraint e_education_degree_id foreign key (education_degree_id) REFERENCES education_degree(education_degree_id),
constraint e_division_id foreign key (division_id) REFERENCES division(division_id),
constraint e_username foreign key (username) REFERENCES `user`(username)
);

create table contract(
contract_id int primary key,
contract_start_date datetime,
contract_end_date datetime,
contract_deposit double,
contract_total_money double,
employee_id int,
customer_id varchar(15),
service_id int,

constraint ct_employee_id foreign key (employee_id) REFERENCES employee(employee_id),
constraint ct_customer_id foreign key (customer_id) REFERENCES customer(customer_id),
constraint ct_service_id foreign key (service_id) REFERENCES service(service_id)
);

create table contract_detail(
contract_detail_id int primary key,
contract_id int,
attach_service_id int,
quantity int,

constraint cd_contract_id foreign key (contract_id) REFERENCES contract(contract_id),
constraint cd_attach_service_id foreign key (attach_service_id) REFERENCES attach_service(attach_service_id)
);