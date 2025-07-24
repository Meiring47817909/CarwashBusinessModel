---Insert different washes
INSERT INTO WASH(wash_id, wash_name, wash_desc)								
	VALUES(w_wash_id_seq.NEXTVAL, 'Wash &' || ' Go', 'Exterior wash: Includes rinsing, applying soap, scrubbing, and drying.');
INSERT INTO WASH(wash_id, wash_name, wash_desc)								
	VALUES(w_wash_id_seq.NEXTVAL, 'Basic wash', 'Exterior wash and interior vacuum plus window polish.');
INSERT INTO WASH(wash_id, wash_name, wash_desc)								
	VALUES(w_wash_id_seq.NEXTVAL, 'Full valet', 'Besides basic exterior wash it includes special wax, polish and engine bay cleaning. Plus extensive interior deep vacuuming, shampooing carpets and seats.');

---Insert different vehicle types
INSERT INTO VEHICLE_TYPE(vehicle_type_id, vehicle_type_name)				
	VALUES(v_t_vehicle_type_id_seq.NEXTVAL, 'Sedan');
INSERT INTO VEHICLE_TYPE(vehicle_type_id, vehicle_type_name)					
	VALUES(v_t_vehicle_type_id_seq.NEXTVAL, 'SUV');
INSERT INTO VEHICLE_TYPE(vehicle_type_id, vehicle_type_name)				
	VALUES(v_t_vehicle_type_id_seq.NEXTVAL, 'Van');
INSERT INTO VEHICLE_TYPE(vehicle_type_id, vehicle_type_name)				
	VALUES(v_t_vehicle_type_id_seq.NEXTVAL, 'Truck');
INSERT INTO VEHICLE_TYPE(vehicle_type_id, vehicle_type_name)					
	VALUES(v_t_vehicle_type_id_seq.NEXTVAL, 'Bus');

---Insert vehicle wash combinations
---Wash & Go with all vehicle types
INSERT INTO VEHICLE_TYPE_WASH(vehicle_type_wash_id, vehicle_type_id, wash_id, num_washers_required, wash_price, wash_duration)	
	VALUES(v_t_w_vehicle_type_wash_id_seq.NEXTVAL, 1, 1, 1, 75, 30);
INSERT INTO VEHICLE_TYPE_WASH(vehicle_type_wash_id, vehicle_type_id, wash_id, num_washers_required, wash_price, wash_duration)		
	VALUES(v_t_w_vehicle_type_wash_id_seq.NEXTVAL, 2, 1, 1, 100, 30);
INSERT INTO VEHICLE_TYPE_WASH(vehicle_type_wash_id, vehicle_type_id, wash_id, num_washers_required, wash_price, wash_duration)		
	VALUES(v_t_w_vehicle_type_wash_id_seq.NEXTVAL, 3, 1, 1, 125, 45);
INSERT INTO VEHICLE_TYPE_WASH(vehicle_type_wash_id, vehicle_type_id, wash_id, num_washers_required, wash_price, wash_duration)		
	VALUES(v_t_w_vehicle_type_wash_id_seq.NEXTVAL, 4, 1, 2, 300, 60);
INSERT INTO VEHICLE_TYPE_WASH(vehicle_type_wash_id, vehicle_type_id, wash_id, num_washers_required, wash_price, wash_duration)		
	VALUES(v_t_w_vehicle_type_wash_id_seq.NEXTVAL, 5, 1, 3, 330, 45);
---Basic wash with all vehicle types	
INSERT INTO VEHICLE_TYPE_WASH(vehicle_type_wash_id, vehicle_type_id, wash_id, num_washers_required, wash_price, wash_duration)		
	VALUES(v_t_w_vehicle_type_wash_id_seq.NEXTVAL, 1, 2, 1, 140, 45);
INSERT INTO VEHICLE_TYPE_WASH(vehicle_type_wash_id, vehicle_type_id, wash_id, num_washers_required, wash_price, wash_duration)		
	VALUES(v_t_w_vehicle_type_wash_id_seq.NEXTVAL, 2, 2, 1, 200, 45);
INSERT INTO VEHICLE_TYPE_WASH(vehicle_type_wash_id, vehicle_type_id, wash_id, num_washers_required, wash_price, wash_duration)		
	VALUES(v_t_w_vehicle_type_wash_id_seq.NEXTVAL, 3, 2, 2, 230, 60);
INSERT INTO VEHICLE_TYPE_WASH(vehicle_type_wash_id, vehicle_type_id, wash_id, num_washers_required, wash_price, wash_duration)		
	VALUES(v_t_w_vehicle_type_wash_id_seq.NEXTVAL, 4, 2, 3, 600, 90);
INSERT INTO VEHICLE_TYPE_WASH(vehicle_type_wash_id, vehicle_type_id, wash_id, num_washers_required, wash_price, wash_duration)		
	VALUES(v_t_w_vehicle_type_wash_id_seq.NEXTVAL, 5, 2, 5, 650, 90);
---Full valet with all vehicle types
INSERT INTO VEHICLE_TYPE_WASH(vehicle_type_wash_id, vehicle_type_id, wash_id, num_washers_required, wash_price, wash_duration)		
	VALUES(v_t_w_vehicle_type_wash_id_seq.NEXTVAL, 1, 3, 1, 300, 60);
INSERT INTO VEHICLE_TYPE_WASH(vehicle_type_wash_id, vehicle_type_id, wash_id, num_washers_required, wash_price, wash_duration)		
	VALUES(v_t_w_vehicle_type_wash_id_seq.NEXTVAL, 2, 3, 1, 415, 60);
INSERT INTO VEHICLE_TYPE_WASH(vehicle_type_wash_id, vehicle_type_id, wash_id, num_washers_required, wash_price, wash_duration)		
	VALUES(v_t_w_vehicle_type_wash_id_seq.NEXTVAL, 3, 3, 2, 500, 60);

---Insert persons specifically washers (*1 customer)
INSERT INTO PERSON(person_id, p_is_washer, p_is_emp, p_is_cus, person_lname, person_fname, person_cellphone)
    VALUES(p_person_id_seq.NEXTVAL, 1, 0, 0, 'Kellerman', 'Mark', '0284561787');
INSERT INTO PERSON(person_id, p_is_washer, p_is_emp, p_is_cus, person_lname, person_fname, person_cellphone)	
    VALUES(p_person_id_seq.NEXTVAL, 1, 0, 0, 'Oberem', 'Tracy', '0854615275');	
INSERT INTO PERSON(person_id, p_is_washer, p_is_emp, p_is_cus, person_lname, person_fname, person_cellphone)
    VALUES(p_person_id_seq.NEXTVAL, 1, 0, 1, 'van den Berg', 'Marco', '0723876354'); ---is washer and customer;

---Insert persons specifically employees (*1 customer)
INSERT INTO PERSON(person_id, p_is_washer, p_is_emp, p_is_cus, person_lname, person_fname, person_cellphone)	
    VALUES(p_person_id_seq.NEXTVAL, 0, 1, 0, 'Vermeulen', 'Hanro', '0753876354');
INSERT INTO PERSON(person_id, p_is_washer, p_is_emp, p_is_cus, person_lname, person_fname, person_cellphone)	
    VALUES(p_person_id_seq.NEXTVAL, 0, 1, 0, 'Goosen', 'Joshua', '0423876354');
INSERT INTO PERSON(person_id, p_is_washer, p_is_emp, p_is_cus, person_lname, person_fname, person_cellphone)	
    VALUES(p_person_id_seq.NEXTVAL, 0, 1, 1, 'Fabricious', 'Zoë', '0917861425'); ---is employee and customer;
	
---Insert persons specifically customers
INSERT INTO PERSON(person_id, person_lname, person_fname, person_cellphone)
    VALUES(p_person_id_seq.NEXTVAL, 'Brown', 'Linda', '0903435870');
INSERT INTO PERSON(person_id, person_lname, person_fname, person_cellphone)
    VALUES(p_person_id_seq.NEXTVAL, 'Garcia', 'Patricia', '0529094032');
INSERT INTO PERSON(person_id, person_lname, person_fname, person_cellphone)
    VALUES(p_person_id_seq.NEXTVAL, 'Davis', 'Susan', '0771986694');
INSERT INTO PERSON(person_id, person_lname, person_fname, person_cellphone)
    VALUES(p_person_id_seq.NEXTVAL, 'Jones', 'Jennifer', '0745703994');
INSERT INTO PERSON(person_id, person_lname, person_fname, person_cellphone)
    VALUES(p_person_id_seq.NEXTVAL, 'Smith', 'Michael', '0981874305');
INSERT INTO PERSON(person_id, person_lname, person_fname, person_cellphone)
    VALUES(p_person_id_seq.NEXTVAL, 'Brown', 'Robert', '0859839389');
INSERT INTO PERSON(person_id, person_lname, person_fname, person_cellphone)
    VALUES(p_person_id_seq.NEXTVAL, 'Davis', 'Robert', '0282790202');
INSERT INTO PERSON(person_id, person_lname, person_fname, person_cellphone)
    VALUES(p_person_id_seq.NEXTVAL, 'Garcia', 'Jennifer', '0419365871');

---New person (washer)
INSERT INTO PERSON(person_id, p_is_washer, p_is_emp, p_is_cus, person_lname, person_fname, person_cellphone)
    VALUES(p_person_id_seq.NEXTVAL, 1, 0, 0, 'Odendal', 'Markus', '0284561741');	

---New person (customer)
INSERT INTO PERSON(person_id, person_lname, person_fname, person_cellphone)	
    VALUES(p_person_id_seq.NEXTVAL, 'Van den Berg', 'David', '0918715264');

---Insert washers
INSERT INTO WASHER(person_id, contract_start_date, contract_end_date)
    VALUES(1, '1-Apr-24', '30-Mar-25');
INSERT INTO WASHER(person_id, contract_start_date, contract_end_date)
    VALUES(2, '1-Jul-24', '30-Jun-25');
INSERT INTO WASHER(person_id, contract_start_date, contract_end_date)
    VALUES(3, '1-Jul-24', '30-Jun-25');

---Insert employees
INSERT INTO EMPLOYEE(person_id, emp_manager, emp_password, emp_username)
    VALUES(4, NULL, 'admin08172!@', 'HanroAdmin21');
INSERT INTO EMPLOYEE(person_id, emp_manager, emp_password, emp_username)
    VALUES(5, 4, '10+10=Twenty', 'JoshuaGoose');
INSERT INTO EMPLOYEE(person_id, emp_manager, emp_password, emp_username)
    VALUES(6, 4, 'ne4124ne', 'Zoë12');

---Insert customers
INSERT INTO CUSTOMER(person_id, register_date)
    VALUES(7, '3-MAR-25');
INSERT INTO CUSTOMER(person_id, register_date)
    VALUES(8, '5-MAR-25');
INSERT INTO CUSTOMER(person_id, register_date)
    VALUES(3, '7-MAR-25');
INSERT INTO CUSTOMER(person_id, register_date)
    VALUES(9,'12-MAR-25');
INSERT INTO CUSTOMER(person_id, register_date)
    VALUES(10, '18-MAR-25');
INSERT INTO CUSTOMER(person_id, register_date)
    VALUES(11, '27-MAR-25');
INSERT INTO CUSTOMER(person_id, register_date)
    VALUES(12,'4-APR-25');
INSERT INTO CUSTOMER(person_id, register_date)
    VALUES(6, '11-APR-25');
INSERT INTO CUSTOMER(person_id, register_date)
    VALUES(13, '20-APR-25');
INSERT INTO CUSTOMER(person_id, register_date)
    VALUES(14, '25-APR-25');

---New washer
INSERT INTO WASHER(person_id, contract_start_date, contract_end_date)	
    VALUES(15, '12-MAY-25', '31-DEC-25');	

---New customer
INSERT INTO CUSTOMER(person_id, register_date)	
        VALUES(16, '08-MAY-25');

---Insert vehicles	
INSERT INTO VEHICLE(vehicle_id, vehicle_type_id, vehicle_model, vehicle_regnumber)	
	VALUES(v_vehicle_id_seq.NEXTVAL, 1, 'Corolla SD 1.8 XR HEV', 'CA 123-456');
INSERT INTO VEHICLE(vehicle_id, vehicle_type_id, vehicle_model, vehicle_regnumber)
	VALUES(v_vehicle_id_seq.NEXTVAL, 3, '2020 Renault Trafic L2 LWB', 'GP 345-678');
INSERT INTO VEHICLE(vehicle_id, vehicle_type_id, vehicle_model, vehicle_regnumber)
	VALUES(v_vehicle_id_seq.NEXTVAL, 1, '2016 Chevy Volt', 'L 654-321');
INSERT INTO VEHICLE(vehicle_id, vehicle_type_id, vehicle_model, vehicle_regnumber)
	VALUES(v_vehicle_id_seq.NEXTVAL, 2, 'Starlet Cross 1.5L XR AT', 'ND 789-012');
INSERT INTO VEHICLE(vehicle_id, vehicle_type_id, vehicle_model, vehicle_regnumber)
	VALUES(v_vehicle_id_seq.NEXTVAL, 1, '2018 Audi A3 Sedan 1.4TFSI Auto', 'BSC 987-654');
INSERT INTO VEHICLE(vehicle_id, vehicle_type_id, vehicle_model, vehicle_regnumber)	
	VALUES(v_vehicle_id_seq.NEXTVAL, 2, '2022 Chevrolet Equinox LT 1.5T', 'NW 456-321');
INSERT INTO VEHICLE(vehicle_id, vehicle_type_id, vehicle_model, vehicle_regnumber)
	VALUES(v_vehicle_id_seq.NEXTVAL, 4, '2012 Isuzu FTR 850', 'TR 845-673 GP');
INSERT INTO VEHICLE(vehicle_id, vehicle_type_id, vehicle_model, vehicle_regnumber)	
	VALUES(v_vehicle_id_seq.NEXTVAL, 2, '2017 Fiat 500X 1.4T Cross Auto', 'MP 908-765');

---New vehicle
INSERT INTO VEHICLE(vehicle_id, vehicle_type_id, vehicle_model, vehicle_regnumber)
	VALUES(v_vehicle_id_seq.NEXTVAL, 1, '2018 Hyundai Accent', 'ND 123-456');


---Insert wash_services
EXEC insert_wash_service(1, 1, 6, 7, TO_DATE('2025/03/03 08:00:00','YYYY/MM/DD HH24:MI:SS'));
EXEC insert_wash_service(2, 8, 6, 8, TO_DATE('2025/03/05 09:00:00','YYYY/MM/DD HH24:MI:SS'));
EXEC insert_wash_service(3, 6, 5, 3, TO_DATE('2025/03/07 11:00:00','YYYY/MM/DD HH24:MI:SS'));
EXEC insert_wash_service(4, 7, 5, 9, TO_DATE('2025/03/12 13:00:00','YYYY/MM/DD HH24:MI:SS'));
EXEC insert_wash_service(5, 11, 4, 10, TO_DATE('2025/03/18 10:30:00','YYYY/MM/DD HH24:MI:SS'));
EXEC insert_wash_service(6, 2, 5, 10, TO_DATE('2025/03/19 14:11:00','YYYY/MM/DD HH24:MI:SS'));
EXEC insert_wash_service(7, 4, 6, 11, TO_DATE('2025/03/27 09:15:00','YYYY/MM/DD HH24:MI:SS'));
EXEC insert_wash_service(1, 6, 6, 12, TO_DATE('2025/04/04 16:00:00','YYYY/MM/DD HH24:MI:SS'));
EXEC insert_wash_service(3, 6, 5, 3, TO_DATE('2025/04/07 08:00:00','YYYY/MM/DD HH24:MI:SS'));
EXEC insert_wash_service(8, 7, 5, 6, TO_DATE('2025/04/11 12:00:00','YYYY/MM/DD HH24:MI:SS'));
EXEC insert_wash_service(4, 12, 4, 13, TO_DATE('2025/04/20 14:00:00','YYYY/MM/DD HH24:MI:SS'));
EXEC insert_wash_service(2, 13, 6, 14, TO_DATE('2025/04/25 15:00:00','YYYY/MM/DD HH24:MI:SS'));
EXEC insert_wash_service(1, 1, 6, 7, TO_DATE('2025/05/01 08:00:00','YYYY/MM/DD HH24:MI:SS'));
EXEC insert_wash_service(2, 3, 6, 8, TO_DATE('2025/05/02 09:00:00','YYYY/MM/DD HH24:MI:SS'));
EXEC insert_wash_service(3, 6, 5, 3, TO_DATE('2025/05/02 11:00:00','YYYY/MM/DD HH24:MI:SS'));
EXEC insert_wash_service(5, 1, 5, 10, TO_DATE('2025/05/05 10:30:00','YYYY/MM/DD HH24:MI:SS'));
EXEC insert_wash_service(4, 12, 4, 9, TO_DATE('2025/05/05 13:00:00','YYYY/MM/DD HH24:MI:SS'));
EXEC insert_wash_service(8, 7, 5, 6, TO_DATE('2025/05/06 12:00:00','YYYY/MM/DD HH24:MI:SS'));
EXEC insert_wash_service(7, 4, 6, 11, TO_DATE('2025/05/07 14:00:00','YYYY/MM/DD HH24:MI:SS'));
EXEC insert_wash_service(6, 7, 5, 10, TO_DATE('2025/05/07 14:11:00','YYYY/MM/DD HH24:MI:SS'));

---New service
EXEC insert_wash_service(9, 6, 5, 16, TO_DATE('2025/05/07 15:00:00','YYYY/MM/DD HH24:MI:SS'));


---Insert SERVICE_WASHER
INSERT INTO SERVICE_WASHER(wash_service_id, person_id, minutes_worked)
	VALUES(1, 1, 30);
	
INSERT INTO SERVICE_WASHER(wash_service_id, person_id, minutes_worked)
	VALUES(2, 1, 60);
INSERT INTO SERVICE_WASHER(wash_service_id, person_id, minutes_worked)
	VALUES(2, 2, 50);
INSERT INTO SERVICE_WASHER(wash_service_id, person_id, minutes_worked)
	VALUES(3, 3, 45);
	
INSERT INTO SERVICE_WASHER(wash_service_id, person_id, minutes_worked)
	VALUES(4, 1, 45);
	
INSERT INTO SERVICE_WASHER(wash_service_id, person_id, minutes_worked)
	VALUES(5, 3, 60);
	
INSERT INTO SERVICE_WASHER(wash_service_id, person_id, minutes_worked)
	VALUES(6, 1, 30);
	
INSERT INTO SERVICE_WASHER(wash_service_id, person_id, minutes_worked)
	VALUES(7, 1, 40);
INSERT INTO SERVICE_WASHER(wash_service_id, person_id, minutes_worked)
	VALUES(7, 2, 60);
INSERT INTO SERVICE_WASHER(wash_service_id, person_id, minutes_worked)
	VALUES(8, 3, 45);
	
INSERT INTO SERVICE_WASHER(wash_service_id, person_id, minutes_worked)
	VALUES(9, 2, 45);
	
INSERT INTO SERVICE_WASHER(wash_service_id, person_id, minutes_worked)
	VALUES(10, 3, 45);
	
INSERT INTO SERVICE_WASHER(wash_service_id, person_id, minutes_worked)
	VALUES(11, 2, 60);
	
INSERT INTO SERVICE_WASHER(wash_service_id, person_id, minutes_worked)
	VALUES(12, 3, 60);
INSERT INTO SERVICE_WASHER(wash_service_id, person_id, minutes_worked)
	VALUES(12, 2, 55);
INSERT INTO SERVICE_WASHER(wash_service_id, person_id, minutes_worked)
	VALUES(13, 2, 30);
	
INSERT INTO SERVICE_WASHER(wash_service_id, person_id, minutes_worked)
	VALUES(14, 2, 45);
	
INSERT INTO SERVICE_WASHER(wash_service_id, person_id, minutes_worked)
	VALUES(15, 3, 45);
	
INSERT INTO SERVICE_WASHER(wash_service_id, person_id, minutes_worked)
	VALUES(16, 2, 30);
	
INSERT INTO SERVICE_WASHER(wash_service_id, person_id, minutes_worked)
	VALUES(17, 2, 30);
	
INSERT INTO SERVICE_WASHER(wash_service_id, person_id, minutes_worked)
	VALUES(18, 3, 45);
	
INSERT INTO SERVICE_WASHER(wash_service_id, person_id, minutes_worked)
	VALUES(19, 2, 60);
INSERT INTO SERVICE_WASHER(wash_service_id, person_id, minutes_worked)
	VALUES(19, 3, 60);
	
INSERT INTO SERVICE_WASHER(wash_service_id, person_id, minutes_worked)
	VALUES(20, 3, 45);