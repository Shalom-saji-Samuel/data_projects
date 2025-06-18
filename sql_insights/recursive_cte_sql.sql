USE org_insights;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100),
    parent_dept_id INT
);

INSERT INTO departments (dept_id, dept_name, parent_dept_id) VALUES
(1, 'Corporate', NULL),
(2, 'Sales', 1),
(3, 'Engineering', 1),
(4, 'Support', 2),
(5, 'QA', 3),
(6, 'Dev', 3);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    manager_id INT,
    dept_id INT,
    hire_date DATE,
    salary INT
);

INSERT INTO employees (emp_id, emp_name, manager_id, dept_id, hire_date, salary) VALUES
(1, 'Alice', NULL, 1, '2015-01-10', 150000),
(2, 'Bob', 1, 2, '2016-03-15', 120000),
(3, 'Charlie', 1, 3, '2017-05-20', 130000),
(4, 'David', 2, 4, '2018-07-01', 90000),
(5, 'Eva', 2, 4, '2019-09-10', 85000),
(6, 'Frank', 3, 5, '2020-11-25', 95000),
(7, 'Grace', 3, 6, '2021-02-14', 98000),
(8, 'Hannah', 6, 6, '2022-06-18', 88000);

-- finding department hierarchy--
WITH recursive dep_hierarchy as (
	SELECT dept_id , dept_name , parent_dept_id , 0 as lvl
    FROM departments 
    WHERE dept_name ='Corporate'
    
	UNION ALL 
    
    SELECT d.dept_id , d.dept_name , d.parent_dept_id , dh.lvl +1
    FROM departments d 
    JOIN dep_hierarchy dh ON d.parent_dept_id = dh.dept_id
)
SELECT dept_name , lvl as level_from_corperate FROM dep_hierarchy;

--  finding chain of command--
WITH recursive m_chain as (
	SELECT emp_id , emp_name, manager_id , 0 as lvl
    FROM employees 
    WHERE emp_name = 'Hannah' 
    
    UNION ALL 
    
    SELECT e.emp_id, e.emp_name, e.manager_id , mc.lvl +1 
    FROM employees e 
    JOIN m_chain mc ON e.emp_id = mc.manager_id 
)
SELECT emp_name, lvl from m_chain;

-- team size analysis --
WITH recursive count_of_emps as(
	SELECT emp_id , emp_name , manager_id , 0 as lvl
    FROM employees 
    WHERE emp_name = 'Charlie'
    
    UNION ALL
    
    SELECT e.emp_id , e.emp_name, e.manager_id , c.lvl + 1
    FROM employees e
    JOIN count_of_emps c ON e.manager_id = c.emp_id
)
SELECT COUNT(*) - 1 as team_size from count_of_emps;