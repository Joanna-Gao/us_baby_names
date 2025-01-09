-- load baby names with state (1910 - present)
create table baby_names (
	state char(2),
	gender char(1),
	year int,
	name varchar,
	occurrence int
);

copy baby_names
from '/Users/SilverJr/Documents/PersonalProject/us_baby_names/raw_data/combined_names_w_state.csv'
with (format CSV);

-- -------------
-- load baby names without state (1880 - present)
create table baby_names_wo_states (
	year int,
	name varchar,
	gender char(1),
	occurrence int
);

copy baby_names_wo_states
from '/Users/SilverJr/Documents/PersonalProject/us_baby_names/combined_names.csv'
with (format CSV, delimiter ' ');

-- -------------
-- add a column indicating the most popular name in the decade
alter table baby_names
add column decade int;

UPDATE baby_names
set decade = (year / 10) * 10;

alter table baby_names_wo_states
add column decade int;

UPDATE baby_names_wo_states
set decade = (year / 10) * 10;
