/*Show unique birth years from patients and order them by ascending.*/
select distinct year(birth_date) from patients
order by birth_date;

/*Show unique first names from the patients table which only occurs once in the list. For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. If only 1 person is named 'Leo' then include them in the output.*/

select distinct first_name from patients
group by first_name
having count(first_name)<=1;

