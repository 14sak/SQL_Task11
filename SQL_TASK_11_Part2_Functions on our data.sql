--Task 11
--Part 2 :create 2 function on your own data			

select * from patient
select * from hospital

--1.Created patientMedicalCondition funtion which tells medical condition of the patient 
select distinct medical_condition from patient 

create or replace function patientMedicalCondition(PatientId int)
returns varchar as $$
	declare pCondition  varchar;
	Patient_Condition varchar;
begin 
	select medical_condition into Patient_Condition from patient where patient_id=PatientId;
    case
	when Patient_Condition = 'Cancer' then pCondition:='Patient is suffering from Cancer';
	when Patient_Condition = 'Diabetes' then pCondition:='Patient is suffering from Diabetes';
	when Patient_Condition = 'Arthritis' then pCondition:='Patient is suffering from Arthritis';
	when Patient_Condition = 'Hypertension' then pCondition:='Patient is suffering from Hypertension';
	when Patient_Condition = 'Asthma' then pCondition:='Patient is suffering from Asthma';
	else pCondition:='Patient is suffering from Obesity';
	end case;
	return pCondition;
end;
$$ language plpgsql 

select patientMedicalCondition(1)



--2.Created HospitalType function which checks the hospital type of the patients
select * from hospital
select distinct hospital_type from hospital
create or replace function HospitalType(PatientId int)
returns varchar as $$
	declare 
	Type varchar;
	TypeHospital varchar;
begin
	select hospital_type into TypeHospital from hospital where patient_id=PatientId;
	case
	when TypeHospital='Critical Access Hospitals' then Type:= 'This is Crtical Access type of hospital';
	when TypeHospital='Acute Care Hospitals' then Type:= 'This is Acute Care type of hospital';
	else Type:= 'This is Childrens type of hospital';
	end case;
	return Type;
end;
$$ language plpgsql
select HospitalType(2001)
 
