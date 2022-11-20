SELECT * FROM company 
JOIN pilot;

SELECT * 
FROM pilot 
WHERE name LIKE 'Jo%';

SELECT * 
FROM plane 
WHERE company_id = 1;

Select name, surname, pilot_id, plane_id, register_plate_id 
FROM plane_info JOIN pilot ON pilot_id = pilot.id;

SELECT  destination_id, pd.plane_id, pilot_id, register_plate_id
FROM plane_has_destination AS pd JOIN plane_info ON pd.plane_id = plane_info.plane_id
WHERE destination_id = 1;

