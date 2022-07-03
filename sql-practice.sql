-- Show unique birth years from patients and order them by ascending.

select distinct(year(birth_date)) as unique_birthdays from patients
order by year(birth_date)

-- Show unique first names from the patients table which only occurs once in the list.
-- For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list.
-- If only 1 person is named 'Leo' then include them in the output.
select first_name from patients
group by first_name
having count(first_name) = 1

-- Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.
select patient_id , first_name from patients 
where first_name like 's%s' and len(first_name) >= 6

-- Show patient_id, first_name, last_name from patients whos primary_diagnosis is 'Dementia'.
-- Primary diagnosis is stored in the admissions table.

select a.patient_id, first_name, last_name from patients as p
inner join admissions as a
on a.patient_id = p.patient_id
where primary_diagnosis = 'Dementia'
