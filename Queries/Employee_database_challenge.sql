-- Deliverable 1: the number of retiring employees by title

SELECT e.emp_no, 
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees AS E
INNER JOIN titles AS ti
ON e.emp_no = ti.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-01-01'
ORDER BY e.emp_no;

-- Use Distinct with Orderby to remove duplicate employee numbers
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title,
	from_date,
	to_date
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

SELECT COUNT(title),
	title
INTO retiring_ttiles
FROM unique_titles
GROUP BY title 
ORDER BY count(title) DESC;

-- Deliverable 2: The Employees eligible for the mentorship program
SELECT DISTINCT ON (e.emp_no) e.emp_no, 
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de 
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE de.to_date = '9999-01-01' AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY e.emp_no;