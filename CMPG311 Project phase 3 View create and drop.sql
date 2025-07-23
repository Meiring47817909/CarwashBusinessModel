DROP VIEW VEHICLE_TYPE_WASH_VU;
DROP VIEW WASH_SERVICE_EMPLOYEE_VU;
DROP VIEW WASH_SERVICE_WASHER_VU;
DROP VIEW WASH_SERVICE_CUSTOMER_VU;

---1. Detailed vehicle_type_wash combination information:
CREATE OR REPLACE VIEW VEHICLE_TYPE_WASH_VU 
AS SELECT Vehicle_Type_Wash_ID, Wash_name, vehicle_type_name, 
       num_washers_required, wash_price, wash_duration 
FROM VEHICLE_TYPE_WASH vtw NATURAL JOIN WASH
     JOIN VEHICLE_TYPE vt ON(vtw.vehicle_type_id = vt.vehicle_type_id)
WITH READ ONLY;

---2. Detailed service all information with employee information:
CREATE OR REPLACE VIEW WASH_SERVICE_EMPLOYEE_VU 
AS SELECT
    wash_service_id, wash_service_datetime, wash_name,
    wash_service_price, wash_service_duration,
    emp.person_fname employee_fname, emp.person_lname employee_lname
FROM
    WASH_SERVICE ws JOIN VEHICLE_TYPE_WASH USING(vehicle_type_wash_id)
    JOIN WASH USING(wash_id)
    JOIN PERSON emp ON (emp.person_id = ws.employee_id)
WITH READ ONLY;

---3. Detailed service all information with washer information:
CREATE OR REPLACE VIEW WASH_SERVICE_WASHER_VU 
AS SELECT
    sw.wash_service_id, wash_service_datetime, wash_name, vehicle_type_name,
    sw.person_id washer_id, person_fname washer_fname,
    person_lname washer_lname, minutes_worked
FROM
    SERVICE_WASHER sw INNER JOIN WASH_SERVICE ws ON(sw.wash_service_id = ws.wash_service_id)
    INNER JOIN VEHICLE_TYPE_WASH vtw ON(ws.vehicle_type_wash_id = vtw.vehicle_type_wash_id)
    INNER JOIN WASH w ON(vtw.wash_id = w.wash_id)
    INNER JOIN VEHICLE_TYPE vt ON(vtw.vehicle_type_id = vt.vehicle_type_id)
    INNER JOIN PERSON p ON(sw.person_id = p.person_id)
WITH READ ONLY;

---4. Detailed service all information with customer information:
CREATE OR REPLACE VIEW WASH_SERVICE_CUSTOMER_VU 
AS SELECT
    wash_service_id, wash_service_datetime, vehicle_type_name, vehicle_model, 
    vehicle_regnumber, cus.person_fname customer_fname,
    cus.person_lname customer_lname, person_cellphone customer_cellphone
FROM
    WASH_SERVICE ws JOIN VEHICLE_TYPE_WASH USING(vehicle_type_wash_id)
    JOIN WASH USING(wash_id)
    JOIN PERSON cus ON (cus.person_id = ws.customer_id)
    JOIN VEHICLE v on (v.vehicle_id = ws.vehicle_id)
    JOIN VEHICLE_TYPE vt ON (vt.vehicle_type_id = v.vehicle_type_id)
WITH READ ONLY;