create or replace PROCEDURE find_sname
(o_employee_id IN NUMBER,
o_employee_name OUT VARCHAR2,
o_employee_pos OUT varchar2
)
AS
BEGIN
SELECT employee_name, employee_pos
INTO o_employee_name, o_employee_pos
FROM employee
WHERE employee_id = o_employee_id;
EXCEPTION
WHEN OTHERS
THEN
DBMS_OUTPUT.PUT_LINE('Error in finding employee_id: '||o_employee_id);
END find_sname;
/