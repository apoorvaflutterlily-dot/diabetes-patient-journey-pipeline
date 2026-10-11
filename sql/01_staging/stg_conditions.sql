CREATE OR REPLACE TABLE staging.stg_conditions AS
SELECT
    PATIENT                     AS patient_id,
    ENCOUNTER                   AS encounter_id,
    CAST("START" AS DATE)       AS start_date,
    CAST("STOP" AS DATE)        AS stop_date,
    CAST(CODE AS VARCHAR)       AS condition_code,
    DESCRIPTION                 AS condition_description
FROM raw.conditions;
