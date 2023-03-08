use ftds;
create table Students
(
Id int not null auto_increment,
First_name varchar(20),
primary key(Id)
);

create table Papers
(
Title varchar(50),
Student_id int not null,
Grade int,
foreign key(Student_id) references Students(Id)
);

INSERT INTO students (first_name) VALUES  
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES 
(1, 'My First Book Report', 60), 
(1, 'My Second Book Report', 75), 
(2, 'Russian Lit Through The Ages', 94), 
(2, 'De Montaigne and The Art of The Essay', 98), 
(4, 'Borges and Magical Realism', 89); 

select a.First_name,b.Title,b.Grade from 
Students a left join Papers b
on a.Id = b.Student_id
order by b.Grade Desc;

select a.First_name,b.Title,b.Grade from 
Students a left join Papers b
on a.Id = b.Student_id;

select a.First_name,
ifnull(b.Title,'MISSING') as Title,
ifnull(b.Grade,0) as Grade
from Students a left join Papers b
on a.Id = b.Student_id;

select a.First_name,
ifnull(round(avg(b.Grade),2),0) as AVERAGE
from Students a left join Papers b
on a.Id = b.Student_id
group by a.First_name
order by AVERAGE DESC;

select a.First_name,
ifnull(round(avg(b.Grade),2),0) as AVERAGE,
case
	when ifnull(round(avg(b.Grade),2),0) > 75 THEN "PASSING"
    ELSE "FAILING"
end as Passing_status
from Students a left join Papers b
on a.Id = b.Student_id
group by a.First_name
order by AVERAGE DESC;