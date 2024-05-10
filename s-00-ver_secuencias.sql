col sequence_owner format A16
col sequence_name format A25
set pagesize 70
select sequence_owner, sequence_name, min_value, last_number 
from all_sequences
where sequence_owner = 'JP_PROY_ADMIN';