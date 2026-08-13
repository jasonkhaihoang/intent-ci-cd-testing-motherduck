{{ config(materialized='view') }}

-- Model: stg_salescloud__opportunityhistory
-- Grain: one row per opportunity_history_id
-- Source: source('salescloud', 'opportunityhistory')

WITH source AS (

  SELECT * FROM {{ source('salescloud', 'opportunityhistory') }}

),

renamed AS (

  SELECT
    "Id" AS opportunity_history_id,
    "OpportunityId" AS opportunity_id,
    "StageName" AS stage_name,
    "Amount" AS amount,
    "Probability" AS probability,
    CAST("CloseDate" AS DATE) AS close_date,
    CAST("CreatedDate" AS TIMESTAMP) AS created_date
  FROM source

)

SELECT * FROM renamed
