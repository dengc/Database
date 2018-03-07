select d.dept_name, count(s.student_id)
from students s
right join departments d
on d.dept_id = s.dept_id
group by d.dept_name
order by COUNT(Student_id) DESC, d.dept_name;
