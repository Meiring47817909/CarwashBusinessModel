DROP TABLE SERVICE_WASHER;
DROP TABLE WASH_SERVICE;
DROP TABLE VEHICLE_TYPE_WASH;
DROP TABLE VEHICLE;
DROP TABLE VEHICLE_TYPE;
DROP TABLE WASH;
DROP TABLE CUSTOMER;
DROP TABLE WASHER;
DROP TABLE EMPLOYEE;
DROP TABLE PERSON;

CREATE TABLE PERSON(
person_id NUMBER(4),
p_is_washer NUMBER(1) DEFAULT 0,
p_is_emp NUMBER(1) DEFAULT 0,
p_is_cus NUMBER(1) DEFAULT 1,
person_lname VARCHAR2(50) NOT NULL,
person_fname VARCHAR2(50) NOT NULL,
person_cellphone VARCHAR2(20) NOT NULL,
    CONSTRAINT person_pk PRIMARY KEY(person_id),
    CONSTRAINT person_cellphone_uk UNIQUE(person_cellphone),
    CONSTRAINT person_is_valid_ch 
        CHECK(p_is_washer IN(0,1) AND p_is_emp IN(0,1) AND p_is_cus IN(0,1))
);
CREATE TABLE EMPLOYEE(
person_id NUMBER(4),
emp_manager NUMBER(4),
emp_password VARCHAR2(50) NOT NULL,
emp_username VARCHAR2(50) NOT NULL,
    CONSTRAINT employee_pk PRIMARY KEY(person_id),
    CONSTRAINT employee_username_uk UNIQUE(emp_username),
    CONSTRAINT employee_person_fk FOREIGN KEY(person_id)
        REFERENCES PERSON(person_id),
    CONSTRAINT employee_manager_fk FOREIGN KEY(emp_manager)
        REFERENCES EMPLOYEE(person_id)
);
CREATE TABLE WASHER(
person_id NUMBER(4),
contract_start_date DATE NOT NULL,
contract_end_date DATE NOT NULL,
    CONSTRAINT washer_pk PRIMARY KEY(person_id),
    CONSTRAINT contract_end_date_ch
        CHECK(contract_end_date > contract_start_date),
    CONSTRAINT washer_person_fk FOREIGN KEY(person_id)
        REFERENCES PERSON(person_id)
);
CREATE TABLE CUSTOMER(
person_id NUMBER(4),
register_date DATE DEFAULT SYSDATE,
    CONSTRAINT customer_pk PRIMARY KEY(person_id),
    CONSTRAINT customer_person_fk FOREIGN KEY(person_id)
        REFERENCES PERSON(person_id)
);
CREATE TABLE WASH(
wash_id NUMBER(2),
wash_name VARCHAR2(50) NOT NULL,
wash_desc VARCHAR2(200) NOT NULL,     
    CONSTRAINT wash_pk PRIMARY KEY(wash_id),
    CONSTRAINT wash_name_uk UNIQUE(wash_name)
);
CREATE TABLE VEHICLE_TYPE(
vehicle_type_id NUMBER(2),
vehicle_type_name VARCHAR2(50) NOT NULL,
    CONSTRAINT vehicle_type_pk PRIMARY KEY(vehicle_type_id),
    CONSTRAINT vehicle_type_name_uk UNIQUE(vehicle_type_name)
);
CREATE TABLE VEHICLE_TYPE_WASH(
vehicle_type_wash_id NUMBER(3),
vehicle_type_id NUMBER(2) NOT NULL,
wash_id NUMBER(2) NOT NULL,
num_washers_required NUMBER(1) NOT NULL,
wash_price NUMBER(6,2) NOT NULL,
wash_duration NUMBER(3) NOT NULL,
    CONSTRAINT vehicle_type_wash_pk PRIMARY KEY(vehicle_type_wash_id),
    CONSTRAINT v_t_w_vehicle_type_fk FOREIGN KEY(vehicle_type_id)
        REFERENCES VEHICLE_TYPE(vehicle_type_id),
    CONSTRAINT v_t_w_wash_fk FOREIGN KEY(wash_id)
        REFERENCES WASH(wash_id)
);
CREATE TABLE VEHICLE(
vehicle_id NUMBER(4),
vehicle_type_id NUMBER(2) NOT NULL,
vehicle_model VARCHAR2(50) NOT NULL,
vehicle_regnumber VARCHAR2(15) NOT NULL,
    CONSTRAINT vehicle_pk PRIMARY KEY(vehicle_id),
    CONSTRAINT vehicle_regnumber_uk UNIQUE(vehicle_regnumber),
    CONSTRAINT vehicle_vehicle_type_fk FOREIGN KEY(vehicle_type_id)
        REFERENCES VEHICLE_TYPE(vehicle_type_id)
);
CREATE TABLE WASH_SERVICE(
wash_service_id NUMBER(6),
vehicle_id NUMBER(4) NOT NULL,
vehicle_type_wash_id NUMBER(3) NOT NULL,
employee_id NUMBER(4) NOT NULL,
customer_id NUMBER(4) NOT NULL,
wash_service_datetime DATE DEFAULT SYSDATE,
wash_service_duration NUMBER(3) NOT NULL,
wash_service_price NUMBER(6,2) NOT NULL,
    CONSTRAINT wash_service_pk PRIMARY KEY(wash_service_id),
    CONSTRAINT wash_service_time_start_ch
        CHECK(TO_CHAR(wash_service_datetime, 'HH24:MI:SS') >= '08:00:00'),
    CONSTRAINT wash_service_time_end_ch
        CHECK(TO_CHAR(wash_service_datetime+(wash_service_duration/24)/60,'HH24:MI:SS')<='18:00:00'),
    CONSTRAINT wash_service_vehicle_fk FOREIGN KEY(vehicle_id)
        REFERENCES VEHICLE(vehicle_id),
    CONSTRAINT wash_service_v_t_w_fk FOREIGN KEY(vehicle_type_wash_id)
        REFERENCES VEHICLE_TYPE_WASH(vehicle_type_wash_id),
    CONSTRAINT wash_service_employee_fk FOREIGN KEY(employee_id)
        REFERENCES EMPLOYEE(person_id),
    CONSTRAINT wash_service_customer_fk FOREIGN KEY(customer_id)
        REFERENCES CUSTOMER(person_id)
);
CREATE TABLE SERVICE_WASHER(
wash_service_id NUMBER(6),
person_id NUMBER(4),
minutes_worked NUMBER(3),
    CONSTRAINT service_washer_pk PRIMARY KEY(wash_service_id, person_id),
    CONSTRAINT s_w_wash_service_fk FOREIGN KEY(wash_service_id)
        REFERENCES WASH_SERVICE(wash_service_id),
    CONSTRAINT s_w_washer_fk FOREIGN KEY(person_id)
        REFERENCES WASHER(person_id)
);