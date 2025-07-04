use example_DB;
select * from employees;
-- 1.stored procedure
DELIMITER //
create procedure UpdateSalary(IN emp_ID INT,IN  newsalary Decimal(10,2))
 BEGIN
	update employees set salary=newsalary 
    where employee_id=emp_ID;
 END//
DELIMITER ;
-- procedure call
call UpdateSalary(101,20000);
-- stored procedure high salary employees 
DELIMITER //
create procedure HighSalaryEmp(IN newsalary decimal(10,2))
BEGIN
	select employee_id,salary from employees 
    where salary>newsalary;
END//
DELIMITER ;
-- procedure call
call HighSalaryEmp(12000);

-- 2.stored functions
DELIMITER //
create function GetFullName(emp_id INT)
RETURNS varchar(100)
DETERMINISTIC
BEGIN
	DECLARE fullname VARCHAR(100);
	select concat(first_name,' ',last_name) INTO fullname
    from employees where employee_id=emp_id;
    return fullname;
END//
DELIMITER ;
-- select stored function GetFullName
select GetFullName(101);
