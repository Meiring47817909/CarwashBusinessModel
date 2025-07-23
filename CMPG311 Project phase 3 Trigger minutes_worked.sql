CREATE OR REPLACE TRIGGER TRIGGER_INSERT_SERVICE_WASHER_BF
BEFORE INSERT OR UPDATE ON SERVICE_WASHER 
REFERENCING OLD AS OLD NEW AS NEW
FOR EACH ROW
BEGIN
    DECLARE   
        d_contract_end_date DATE;
        d_wash_service_datetime DATE;
        d_wash_service_duration NUMBER(3);       
    BEGIN         
        SELECT w.contract_end_date, ws.wash_service_datetime, ws.wash_service_duration INTO d_contract_end_date, d_wash_service_datetime, d_wash_service_duration
        FROM WASH_SERVICE ws, WASHER w
        WHERE ws.wash_service_id = :NEW.wash_service_id AND w.person_id = :NEW.person_id;

        IF (d_wash_service_datetime > d_contract_end_date) THEN
            raise_application_error(-20000, 'The washer cannot perform a service later than their contract end date.');
        ELSIF (:NEW.minutes_worked > d_wash_service_duration) THEN
            raise_application_error(-20001, 'The washer cannot work longer than the service duration.');
        END IF;
    END;
END;