/*
 * users table.
 */
create table users(num number primary key, users_id varchar2(50) not null,
users_pwd varchar2(50) not null, users_name varchar2(50) not null, users_age number,
users_addr varchar2(100), users_email varchar2(100));

create sequence users_seq;
