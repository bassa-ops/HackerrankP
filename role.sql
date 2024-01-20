/* Show first name, last name and role of every person that is either patient or doctor.
The roles are either "Patient" or "Doctor" */

SELECT first_name, last_name, 'patients' as role FROM patients 
  UNION ALL
SELECT first_name, last_name, 'Doctors' FROM doctors;
