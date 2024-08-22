--Task 11
--Part 3 :create select and find function 	


--Created 'TestResult'function to show test results of the patient 
select * from patient

select distinct test_results from patient 

create or replace function TestResult(PatientName varchar)
returns varchar as $$
	declare
	Report varchar;
	PatientReport varchar;
begin
	select test_results into PatientReport from patient where name=PatientName;
	if PatientReport ='Abnormal' then Report:= 'Test Result of the patient is ABNORMAL';
	elseif PatientReport='Inconclusive' then Report :='Test Results of the patient are inappropriate,do test again';
	else Report:='Test Results are Normal,No need to worry';
	end if;
	return Report;
end;
$$ language plpgsql

select TestResult('LesLie TErRy')
	
select name,TestResult(name) from patient
