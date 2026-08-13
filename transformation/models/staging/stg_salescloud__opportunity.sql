{{ config(materialized='view') }}

-- Model: stg_salescloud__opportunity
-- Grain: one row per opportunity_id
-- Source: source('salescloud', 'opportunity')

WITH source AS (

  SELECT * FROM {{ source('salescloud', 'opportunity') }}

),

renamed AS (

  SELECT
    id AS opportunity_id,
    accountid AS account_id,
    ownerid AS owner_id,
    name AS opportunity_name,
    stagename AS stage_name,
    type AS opportunity_type,
    leadsource AS lead_source,
    amount,
    probability,
    expectedrevenue AS expected_revenue,
    CAST(createddate AS TIMESTAMP) AS created_date,
    CAST(closedate AS DATE) AS close_date,
    CAST(laststagechangedate AS TIMESTAMP) AS last_stage_change_date,
    CAST(isclosed AS BOOLEAN) AS is_closed,
    CAST(iswon AS BOOLEAN) AS is_won,
    CAST(isdeleted AS BOOLEAN) AS is_deleted,
    CAST(lastmodifieddate AS TIMESTAMP) AS last_modified_date,
    CAST(systemmodstamp AS TIMESTAMP) AS system_modified_timestamp
  FROM source
  WHERE isdeleted = FALSE

)

SELECT * FROM renamed
