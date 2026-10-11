CREATE OR REPLACE TABLE staging.stg_patients AS
SELECT
    Id                          AS patient_id,
    CAST(BIRTHDATE AS DATE)     AS birth_date,
    CAST(DEATHDATE AS DATE)     AS death_date,
    GENDER                      AS gender,
    RACE                        AS race,
    ETHNICITY                   AS ethnicity,
    STATE                       AS state
FROM raw.patients;
