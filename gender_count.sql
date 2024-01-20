select 
 (select count(*) from patients where gender='M') as Male_count,
 (select count(*) from patients where gender='F') as Female_count;
