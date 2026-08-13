{{ config(materialized='view') }}

-- Model: stg_salescloud__user
-- Grain: one row per user_id
-- Source: source('salescloud', 'user')

WITH source AS (

  SELECT * FROM {{ source('salescloud', 'user') }}

),

renamed AS (

  SELECT
    id AS user_id,
    name AS user_name,
    email,
    username,
    userroleid AS user_role_id,
    profileid AS profile_id,
    title AS job_title,
    CAST(isactive AS BOOLEAN) AS is_active,
    CAST(createddate AS TIMESTAMP) AS created_date,
    CAST(lastmodifieddate AS TIMESTAMP) AS last_modified_date
  FROM source

)

SELECT * FROM renamed
