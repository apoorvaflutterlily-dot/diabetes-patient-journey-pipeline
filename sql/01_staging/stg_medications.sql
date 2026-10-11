CREATE OR REPLACE TABLE staging.stg_medications AS
SELECT
    PATIENT                     AS patient_id,
    ENCOUNTER                   AS encounter_id,
    CAST("START" AS DATE)       AS start_date,
    CAST("STOP" AS DATE)        AS stop_date,
    CAST(CODE AS VARCHAR)       AS medication_code,
    DESCRIPTION                 AS medication_description,
    CAST(DISPENSES AS INTEGER)  AS dispenses
FROM raw.medications;
