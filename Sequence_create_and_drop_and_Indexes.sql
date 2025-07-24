DROP SEQUENCE p_person_id_seq;
DROP SEQUENCE w_wash_id_seq;
DROP SEQUENCE v_t_vehicle_type_id_seq;
DROP SEQUENCE v_t_w_vehicle_type_wash_id_seq;
DROP SEQUENCE v_vehicle_id_seq;
DROP SEQUENCE w_s_wash_service_id_seq;

CREATE SEQUENCE p_person_id_seq
    INCREMENT BY 1
    MAXVALUE 9999
    NOCACHE
    NOCYCLE;
    
CREATE SEQUENCE w_wash_id_seq
    INCREMENT BY 1
    MAXVALUE 99
    NOCACHE
    NOCYCLE;
    
CREATE SEQUENCE v_t_vehicle_type_id_seq
    INCREMENT BY 1
    MAXVALUE 99
    NOCACHE
    NOCYCLE;
    
CREATE SEQUENCE v_t_w_vehicle_type_wash_id_seq
    INCREMENT BY 1
    MAXVALUE 999
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE v_vehicle_id_seq
    INCREMENT BY 1
    MAXVALUE 9999
    NOCACHE
    NOCYCLE;

CREATE SEQUENCE w_s_wash_service_id_seq
    INCREMENT BY 1
    MAXVALUE 999999
    NOCACHE
    NOCYCLE;

CREATE INDEX person_names_idx ON PERSON (person_fname, person_lname); 
CREATE INDEX wash_price_idx ON VEHICLE_TYPE_WASH(wash_price); 