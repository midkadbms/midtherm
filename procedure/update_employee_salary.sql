create or replace PROCEDURE update_employee_salary(
    n_employee_id IN employee.employee_id%TYPE,
    i_perc IN NUMBER
)
IS
no_found exception;
BEGIN
    UPDATE employee
    SET employee_salary = employee_salary * (1 + i_perc/100)
    WHERE employee_id = n_employee_id;
     
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'No employee found with ID ' || n_employee_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Salary updated for employee ' || n_employee_id || '.');
    END IF;
EXCEPTION
   WHEN no_found THEN 
      dbms_output.put_line('No such employee!');
   WHEN OTHERS THEN 
      DBMS_OUTPUT.PUT_LINE('Error: '|| SQLERRM);
END;
/