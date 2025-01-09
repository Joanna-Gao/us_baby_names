-- -------------
-- find the most popular male/female names of every decade
with baby_name_by_decade as (
	select 
		decade, 
		name,
		gender,
		sum(occurrence) as total_occurrence,
		row_number() over (partition by decade, gender order by sum(occurrence) desc) as seqnum
	from baby_names_wo_states
	group by decade, name, gender
)
select
	decade,
	name,
	total_occurrence
from baby_name_by_decade
where seqnum = 1 and gender = 'F';

-- name uniqueness over time
select
	year,
	count(distinct name) as unique_names
from baby_names_wo_states
where gender = 'F'
group by year
order by year;

select *
from baby_names_wo_states
where name = 'Maverick' and gender = 'M'
order by year;

-- name with the largest increase in popularity between decades