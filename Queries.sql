-------------------------------------------------------------------------------------------------------
---QUERIES
-------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------
---Limitation of rows and columns
-------------------------------------------------------------------------------------------------------

---1.
SELECT wash_service_id "Service number",
       wash_name "Wash type", TO_CHAR(wash_service_price, 'L9,999.99') "Price"
FROM WASH_SERVICE_EMPLOYEE_VU
WHERE employee_fname = 'Zoë' AND employee_lname = 'Fabricious'
ORDER BY wash_name;

---2.
SELECT wash_service_id "Service number",
       wash_name "Wash type", vehicle_type_name "Vehicle type",
       washer_fname "Washer name", washer_lname "Washer surname"
FROM WASH_SERVICE_WASHER_VU
WHERE TO_CHAR(wash_service_datetime, 'YY/MON') = TO_CHAR(SYSDATE, 'YY/MON');

---3.
SELECT vehicle_type_name AS "Vehicle Type", wash_name AS "Wash Name" 
FROM VEHICLE_TYPE_WASH_VU
WHERE vehicle_type_name = INITCAP('&vehicle_type');

-------------------------------------------------------------------------------------------------------
---Sorting
-------------------------------------------------------------------------------------------------------

---1.
SELECT wash_service_id "Service number", 
       TO_CHAR(wash_service_datetime, 'YY/MON/DD') "Service Date",
       TO_CHAR(wash_service_datetime, 'HH24:MI') Booked,
       TO_CHAR(wash_service_datetime + (wash_service_duration/24/60), 'HH24:MI') Finishes,
       employee_fname "Employee name", employee_lname "Employee surname"
FROM WASH_SERVICE_EMPLOYEE_VU
ORDER BY "Service Date" DESC, Finishes ASC;

---2.
SELECT wash_name "Wash type", COUNT(wash_name) "Amount of washes"
FROM WASH_SERVICE_EMPLOYEE_VU
GROUP BY wash_name
ORDER BY COUNT(wash_name) DESC;

---3.
SELECT customer_fname "Customer name",
       customer_lname "Customer surname", 
       COUNT(*) "Amount of services"
FROM WASH_SERVICE_CUSTOMER_VU
GROUP BY customer_lname, customer_fname 
ORDER BY COUNT(*) DESC;

-------------------------------------------------------------------------------------------------------
--- LIKE, AND and OR
-------------------------------------------------------------------------------------------------------

---1.
SELECT person_fname "Customer name", person_lname "Customer surname",
       p_is_washer "Is a washer", p_is_emp "Is a employee"
FROM PERSON
WHERE (p_is_washer = 1 AND p_is_cus = 1) OR (p_is_emp = 1 AND p_is_cus = 1);

---2.
SELECT vehicle_regnumber "Registration number",vehicle_model "Vehicle", 
       customer_fname "Customer name", customer_lname "Customer surname",
       customer_cellphone "Cellphone number"
FROM WASH_SERVICE_CUSTOMER_VU
WHERE vehicle_regnumber LIKE '%GP 345%' AND
      TO_CHAR(wash_service_datetime, 'DD/MON/YY') = '02/MAY/25';

---3.
SELECT Wash_name "Wash type", vehicle_type_name "Vehicle type",
       wash_duration "Duration (min)", TO_CHAR(wash_price, 'L9,999.99') "Wash price"
FROM VEHICLE_TYPE_WASH_VU
WHERE vehicle_type_name = 'Sedan' AND wash_duration <= 60 AND wash_price <= 200;

-------------------------------------------------------------------------------------------------------
--- Variables and character functions
-------------------------------------------------------------------------------------------------------

---1.
SELECT person_fname "Name", person_lname "Surname",
       person_cellphone "Cellphone number",
       REPLACE(REPLACE(p_is_washer, 0,'No'), '1', 'Yes') "Is a washer",
       REPLACE(REPLACE(p_is_emp, 0,'No'), '1', 'Yes') "Is a employee",
       REPLACE(REPLACE(p_is_cus, 0,'No'), '1', 'Yes') "Is a customer"
FROM PERSON;

---2.
DEFINE wash_keyword = 'Interior';
SELECT wash_name "Wash type", wash_desc "Wash description"
FROM WASH
WHERE wash_desc LIKE LOWER('%&&wash_keyword%');
UNDEFINE wash_keyword;

---3.
DEFINE pickup_date = '07/MAY/25';
DEFINE pickup_time = '13:00';
SELECT wash_service_id "Service number", wash_service_datetime "Date",
       TO_CHAR(wash_service_datetime, 'HH24:MI')"Pickup Time",
       wash_name "Wash type", TO_CHAR(wash_service_price, 'L9,999.99') "Price"       
FROM WASH_SERVICE_EMPLOYEE_VU
WHERE TO_CHAR(wash_service_datetime, 'DD/MON/YY') = '&pickup_date' AND
      TO_CHAR(wash_service_datetime, 'HH24:MI') >= '&pickup_time'
ORDER BY TO_CHAR(wash_service_datetime, 'HH24:MI');
UNDEFINE pickup_date;
UNDEFINE pickup_time;

-------------------------------------------------------------------------------------------------------
--- Round and/or trunc
-------------------------------------------------------------------------------------------------------

---1.
SELECT vehicle_type_name "Vehicle type",
       TO_CHAR(ROUND(AVG(wash_price)), 'L9,999.99') "Average price",
       ROUND(AVG(wash_duration)) "Average duration (min)"
FROM VEHICLE_TYPE_WASH_VU
GROUP BY vehicle_type_name;

---2.
SELECT TO_CHAR(wash_service_datetime, 'YYYY MONTH') "Year and month",
       washer_fname "Washer name",  washer_lname "Washer surname",
       ROUND(SUM(minutes_worked) / 60, 2) AS "Hours Worked"
FROM WASH_SERVICE_WASHER_VU
GROUP BY TO_CHAR(wash_service_datetime, 'YYYY MONTH'), washer_lname, washer_fname
ORDER BY TO_CHAR(wash_service_datetime, 'YYYY MONTH') DESC;

-------------------------------------------------------------------------------------------------------
--- Date functions
-------------------------------------------------------------------------------------------------------

---1.
SELECT TO_CHAR(TRUNC(wash_service_datetime, 'MONTH'), 'YYYY MONTH') "Year and month",
       COUNT(*) "Amount of services"
FROM WASH_SERVICE
GROUP BY TO_CHAR(TRUNC(wash_service_datetime, 'MONTH'), 'YYYY MONTH')
ORDER BY TO_CHAR(TRUNC(wash_service_datetime, 'MONTH'), 'YYYY MONTH') DESC;

---2.
SELECT
    person_fname "Washer name", person_lname "Washer surname",
    contract_start_date "Contract started", contract_end_date "Contract ends",
    ROUND(ABS(MONTHS_BETWEEN(contract_end_date, SYSDATE))) "Months left"
FROM WASHER NATURAL JOIN PERSON
WHERE contract_end_date > SYSDATE
ORDER BY ROUND(ABS(MONTHS_BETWEEN(contract_end_date, SYSDATE)));

---3.
SELECT
    COUNT(CASE WHEN TO_CHAR(wash_service_datetime, 'HH24:MI') < '12:00'
        THEN TO_CHAR(wash_service_datetime, 'HH24:MI') END) "Amount of morning services",
    COUNT(CASE WHEN TO_CHAR(wash_service_datetime, 'HH24:MI') >= '12:00'
        THEN TO_CHAR(wash_service_datetime, 'HH24:MI') END) "Amount of afternoon services"
FROM WASH_SERVICE;

-------------------------------------------------------------------------------------------------------
--- Aggregate functions
-------------------------------------------------------------------------------------------------------

---1.
SELECT TO_CHAR(WASH_SERVICE_DATETIME, 'YYYY') "Year",
       employee_fname "Employee name", employee_lname "Employee surname",
       COUNT(*) "Number of services booked"
FROM WASH_SERVICE_EMPLOYEE_VU
GROUP BY TO_CHAR(WASH_SERVICE_DATETIME, 'YYYY'), employee_lname, employee_fname
ORDER BY TO_CHAR(WASH_SERVICE_DATETIME, 'YYYY') DESC, employee_lname, employee_fname; 

---2.
SELECT TO_CHAR(wash_service_datetime, 'YYYY MONTH') "Year and month",
       TO_CHAR(SUM(wash_service_price), 'L999,999.99') "Income per month"
FROM WASH_SERVICE_EMPLOYEE_VU
GROUP BY TO_CHAR(wash_service_datetime, 'YYYY MONTH')
ORDER BY TO_CHAR(wash_service_datetime, 'YYYY MONTH') DESC;

---3.
SELECT TO_CHAR(AVG(SUM(wash_service_price)), 'L999,999.99') "Average monthly income"
FROM WASH_SERVICE_EMPLOYEE_VU
GROUP BY TO_CHAR(wash_service_datetime, 'YY/MM');

---4.
SELECT ROUND(MIN(num_washers_required)) "Washers required to perform minimum services",
 ROUND(AVG(num_washers_required)) "Washers required to perform most services",
 MAX(num_washers_required) "Washers required to perform all services"
FROM VEHICLE_TYPE_WASH_VU;

-------------------------------------------------------------------------------------------------------
--- Group by and having
-------------------------------------------------------------------------------------------------------

---1.
SELECT  TO_CHAR(register_date, 'YYYY MONTH') Month,
    COUNT(*) "Customers gained"
FROM CUSTOMER
GROUP BY  TO_CHAR(register_date, 'YYYY MONTH')
ORDER BY TO_CHAR(register_date, 'YYYY MONTH') DESC;

---2.
SELECT  vehicle_type_name "Vehicle type", wash_name "Wash type",
        TO_CHAR(wash_price, 'L9,999.99') Price
FROM VEHICLE_TYPE_WASH_VU
GROUP BY vehicle_type_name, wash_name, wash_price
HAVING wash_price BETWEEN 300 AND 400
ORDER BY wash_price;

---3.
SELECT  vehicle_type_name "Vehicle type", wash_name "Wash type",
        wash_duration "Wash duration (min)"
FROM VEHICLE_TYPE_WASH_VU
GROUP BY vehicle_type_name, wash_name, wash_duration
HAVING wash_duration > 60
ORDER BY wash_duration;

-------------------------------------------------------------------------------------------------------
--- JOINS
-------------------------------------------------------------------------------------------------------

---1.
SELECT CONCAT(p_emp.person_fname, CONCAT(' ', p_emp.person_lname)) "Employee details",
       CONCAT(p_mgr.PERSON_FNAME, CONCAT(' ', p_mgr.person_lname)) "Manager details"
FROM EMPLOYEE emp INNER JOIN EMPLOYEE mgr ON (emp.emp_manager = mgr.person_id)
                  INNER JOIN PERSON p_emp ON(emp.person_id = p_emp.person_id)
                  INNER JOIN PERSON p_mgr ON(mgr.person_id = p_mgr.person_id);

---2.
SELECT person_fname "Washer name", person_lname "Washer surname", 
       wash_service_id "Service number", wash_service_datetime "Service date"
FROM WASH_SERVICE_WASHER_VU wswvu RIGHT OUTER JOIN WASHER w ON(w.person_id = wswvu.washer_id)
     AND TO_CHAR(wswvu.wash_service_datetime, 'DD/MM/YY') = TO_CHAR(TO_DATE('&in_date', 'DD/MON/YY'), 'DD/MM/YY')
     INNER JOIN PERSON p ON(w.person_id = p.person_id) AND SYSDATE >= w.contract_start_date
     AND w.contract_end_date >= SYSDATE;

---3.
SELECT ws.wash_service_id "Service number", ws.wash_service_datetime "Service date",
       wsevu.wash_name "Wash name", wscvu.vehicle_type_name "Vehicle type",
       wscvu.vehicle_model "Vehicle model", wscvu.vehicle_regnumber "Vehicle registration",
       washer_fname "Washer name", washer_lname "Washer surname"
FROM WASH_SERVICE ws INNER JOIN WASH_SERVICE_EMPLOYEE_VU wsevu ON(ws.wash_service_id = wsevu.wash_service_id)
INNER JOIN WASH_SERVICE_CUSTOMER_VU wscvu ON(ws.wash_service_id = wscvu.wash_service_id)
LEFT OUTER JOIN WASH_SERVICE_WASHER_VU wswvu ON(ws.wash_service_id = wswvu.wash_service_id)
WHERE TO_CHAR(ws.wash_service_datetime, 'DD/MM/YY') = TO_CHAR(TO_DATE('&in_date', 'DD/MON/YY'), 'DD/MM/YY');

--4.
SELECT
    wsevu.wash_service_id "Service number",TO_CHAR(wsevu.wash_service_datetime, 'DD MON YYYY') "Service date",
    wsevu.wash_name "Wash type",
    TO_CHAR(wash_service_price, 'L9,999.99') "Price",
    employee_fname || ' ' || employee_lname "Booked by employee",
    TO_CHAR(wsevu.wash_service_datetime, 'HH24:MI') "Booked at",
    vehicle_model "Vehicle",
    customer_fname || ' ' || customer_lname "For customer",
    TO_CHAR(wsevu.wash_service_datetime + (wsevu.wash_service_duration/24/60), 'HH24:MI') "Pickup at",
    customer_cellphone "Customer contact"
FROM WASH_SERVICE_EMPLOYEE_VU wsevu INNER JOIN WASH_SERVICE_CUSTOMER_VU wscvu
     ON(wsevu.wash_service_id = wscvu.wash_service_id)
WHERE TO_CHAR(wsevu.wash_service_datetime, 'YY/MM') = '&in_year_month'
ORDER BY wsevu.wash_service_datetime DESC;

-------------------------------------------------------------------------------------------------------
--- Sub-queries
-------------------------------------------------------------------------------------------------------

---1.
SELECT emp_username "Username", emp_password "Password"
FROM EMPLOYEE
WHERE person_id = (SELECT person_id FROM PERSON
                   WHERE LOWER(person_fname) = LOWER('&name') AND 
                        LOWER(person_lname) = LOWER('&surname'));

---2.
SELECT TO_CHAR(WASH_SERVICE_DATETIME, 'YYYY') "Year",
       employee_fname "Employee name", employee_lname "Employee surname",
       COUNT(*) "Amount of services booked"
FROM WASH_SERVICE_EMPLOYEE_VU
GROUP BY TO_CHAR(WASH_SERVICE_DATETIME, 'YYYY'), employee_lname, employee_fname
HAVING COUNT(*) = (SELECT MAX(COUNT(*)) FROM WASH_SERVICE_EMPLOYEE_VU
                   WHERE TO_CHAR(WASH_SERVICE_DATETIME, 'YYYY') = '&year'
                   GROUP BY TO_CHAR(WASH_SERVICE_DATETIME, 'YYYY'), employee_lname, employee_fname);

---Verify 2's result
SELECT TO_CHAR(WASH_SERVICE_DATETIME, 'YYYY') "Year",
       employee_fname "Employee name", employee_lname "Employee surname",
       COUNT(*) "Number of services booked"
FROM WASH_SERVICE_EMPLOYEE_VU
GROUP BY TO_CHAR(WASH_SERVICE_DATETIME, 'YYYY'), employee_lname, employee_fname
ORDER BY TO_CHAR(WASH_SERVICE_DATETIME, 'YYYY') DESC, employee_lname, employee_fname; 

---3.
DEFINE in_year_month = '2025/04';    
SELECT 
   TO_CHAR(WASH_SERVICE_DATETIME, 'YYYY MONTH') "Year Month",
   CONCAT(WASHER_FNAME, ' ' || WASHER_LNAME) AS "Washer Details",
   ROUND(SUM(MINUTES_WORKED) / 60, 2)"Hours worked per month"
FROM WASH_SERVICE_WASHER_VU
WHERE TO_CHAR(WASH_SERVICE_DATETIME, 'YYYY/MM') = '&in_year_month'
GROUP BY 
   TO_CHAR(WASH_SERVICE_DATETIME, 'YYYY MONTH'),
   CONCAT(WASHER_FNAME, ' ' || WASHER_LNAME)   
   HAVING ROUND(SUM(MINUTES_WORKED) / 60, 2) > (SELECT ROUND(AVG(SUM(MINUTES_WORKED) / 60), 2)
                                                FROM WASH_SERVICE_WASHER_VU
                                                WHERE TO_CHAR(WASH_SERVICE_DATETIME, 'YYYY/MM') = '&in_year_month'
                                                GROUP BY 
                                                   TO_CHAR(WASH_SERVICE_DATETIME, 'YYYY MONTH'),
                                                   CONCAT(WASHER_FNAME, ' ' || WASHER_LNAME));

---Verify 3's result
SELECT TO_CHAR(wash_service_datetime, 'YYYY MONTH') "Year and month",
       washer_fname "Washer name",  washer_lname "Washer surname",
       ROUND(SUM(minutes_worked) / 60, 2) AS "Hours Worked"
FROM WASH_SERVICE_WASHER_VU
GROUP BY TO_CHAR(wash_service_datetime, 'YYYY MONTH'), washer_lname, washer_fname
ORDER BY TO_CHAR(wash_service_datetime, 'YYYY MONTH') DESC;