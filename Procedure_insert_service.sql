CREATE OR REPLACE PROCEDURE insert_wash_service(
    in_vehicle_id IN NUMBER,
    in_vehicle_type_wash_id IN NUMBER,
    in_employee_id IN NUMBER,
    in_customer_id IN NUMBER,
    in_wash_service_datetime IN DATE DEFAULT SYSDATE)
AS
BEGIN
	DECLARE 
        d_wash_service_duration NUMBER(3);
        d_wash_service_price NUMBER(6,2);  
    BEGIN
        SELECT vtw.wash_duration, vtw.wash_price INTO d_wash_service_duration, d_wash_service_price
	FROM VEHICLE_TYPE_WASH vtw WHERE vtw.vehicle_type_wash_id = in_vehicle_type_wash_id;   
        
        INSERT INTO WASH_SERVICE(wash_service_id, vehicle_id, vehicle_type_wash_id, employee_id,
	                        customer_id, wash_service_datetime, wash_service_duration, wash_service_price)
        VALUES (w_s_wash_service_id_seq.NEXTVAL, in_vehicle_id, in_vehicle_type_wash_id, in_employee_id,
                in_customer_id, in_wash_service_datetime, d_wash_service_duration, d_wash_service_price);
    END;
END;