select distinct city_names.name
from city_names
inner join baby_names on city_names.name=baby_names.name
order by city_names.name;