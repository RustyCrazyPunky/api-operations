drop table if exists operation_transition;
drop table if exists operation_detail;
drop table if exists operation;
drop table if exists operation_status;
drop table if exists operation_type;

delete
from flyway_schema_history
where script like concat('V1_0__', '%');