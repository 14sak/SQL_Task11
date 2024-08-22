--Task 11
--Part 1 :create 5 function on ecom			
 	
select * from sales
select * from product
select * from customer


--1.Here we created checkCategory function which checks the category of the things
select distinct category  from product
select distinct sub_category from product where category='Technology'
	
	
create or replace function checkCategory(sub_cat varchar)
returns varchar as $$
	declare
	output varchar;
begin
	if sub_cat in ('Tables','Bookcases','Chairs','Furnishings') then output := 'Furniture_Category';
	elseif sub_cat in ('Accessories','Phones','Copiers','Machines') then output := 'Technology_Category'; 
	else output :='Office Supplies';
	end if;
	return output;
end ;
$$language plpgsql;
select checkCategory('Tables')

	
--2.Here we created checkCountry function which checks the conutry after passing state names
select distinct country from customer 
 
create or replace function checkCountry(state varchar)
returns varchar as $$
	declare
	output varchar;
begin
	if state in ('mh')then output:='india';
	else output:='United States';
	end if ;
	return output;
end;
$$ language plpgsql

select checkCountry('mh')
select checkCountry('California')
 

--3. we created Checkregion function which checks/gets the region of customers through customer id
select distinct region from customer

create or replace function checkRegion(CustomerID varchar)
returns varchar as $$
	declare  
	output varchar;
    Customer_Region varchar;
	begin
	 select region into Customer_Region from customer where customer_id=CustomerID;
	 case
	when Customer_Region  in ('Central') then output:= 'Region is Central';
	when Customer_Region  in ('South') then output:= 'Region is South';
	when Customer_Region  in ('East') then output:= 'Region is East';
	when Customer_Region  in ('West') then output:= 'Region is West'; 
	else output:='Not Known';
	end case;
	return output;
	end;
	$$ language plpgsql
 
select checkRegion('GH-14485') 


--4.We created checkSegment region which check the segment of the customer through their names
select * from customer
select distinct segment from customer
create or replace function checkSegment(CustomerName varchar)
returns varchar as $$
		declare 
		cust_segment varchar;
        Customer_Segment varchar;
		begin
		select segment into Customer_Segment from customer where customer_name =CustomerName;
        case
		when Customer_Segment in('Home Office') then cust_segment:= 'Segment is Home Office'; 
		when Customer_Segment in('Consumer')then cust_segment:= 'Consumer';  
		when Customer_Segment in('Corporate') then cust_segment:= 'Corporate';
		else cust_segment='Any other Segment';
		end case;
		return cust_segment;
		end;
		$$ language plpgsql 
 
select checkSegment('Paul Gonzalez')

			
--5.Generation function which checks customer age and distinguish in adult citizen,senior citizen ,teenager and old people
select * from customer
 
select age from customer
create or replace function generation(age int)
returns varchar as $$
	declare
	output varchar;
begin
	if age <= 18 then output:= 'Teenager';
	elseif age between 19 and 45 then output := 'Adult Citizen' ;  
	elseif age between 45 and 58 then output := 'Senior Citizen' ;
	else output:='Old People';
    end if;
    return output;
end;
	$$ language plpgsql

select age,generation(age) from customer
