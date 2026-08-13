{{ config(materialized='view') }}

-- Model: stg_salescloud__opportunityhistory
-- Grain: one row per opportunity_history_id
-- Source: source('salescloud', 'opportunityhistory')

WITH source AS (

    SELECT * FROM {{ source('salescloud', 'opportunityhistory') }}

),

renamed AS (

    SELECT
        id AS opportunity_history_id,
        opportunityid AS opportunity_id,
        stagename AS stage_name,
        amount,
        probability,
        CAST(closedate AS DATE) AS close_date,
        CAST(createddate AS TIMESTAMP) AS created_date
    FROM source

)

SELECT * FROM renamed
