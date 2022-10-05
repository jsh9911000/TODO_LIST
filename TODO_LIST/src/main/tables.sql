/*
 * users table.
 */
create table users(num number primary key, users_id varchar2(50) not null,
users_pwd varchar2(50) not null, users_name varchar2(50) not null, users_age number,
users_addr varchar2(100), users_email varchar2(100));

create sequence users_seq;

/*
 * todo table.
 */
create table todo(num number primary key, userID varchar2(50) not null, userName varchar2(50) not null, 
todoTitle varchar2(50) not null, todoContent varchar2(100) not null, todoDate DATE);

create sequence todo_seq;