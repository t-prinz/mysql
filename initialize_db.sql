create table tasks (id int NOT NULL, task varchar(255) DEFAULT NULL, due_date DATE DEFAULT NULL, status ENUM ('Not Started', 'In Progress', 'Complete') DEFAULT 'Not Started');

insert into tasks (id, task, due_date, status) values ('1', 'Complete cloud cert', '2022-12-31','Complete');
insert into tasks (id, task, due_date, status) values ('2', 'Complete SKO pre-work', '2023-01-20', 'In Progress');

select * from tasks;

