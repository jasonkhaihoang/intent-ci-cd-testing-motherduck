{{ config(materialized='view') }}

-- Model: stg_salescloud__account
-- Grain: one row per account_id
-- Source: source('salescloud', 'account')

WITH source AS (

  SELECT * FROM {{ source('salescloud', 'account') }}

),

renamed AS (

  SELECT
    id AS account_id,
    name AS account_name,
    type AS account_type,
    industry,
    billingcity AS billing_city,
    billingstate AS billing_state,
    billingcountry AS billing_country,
    ownerid AS owner_id,
    CAST(isdeleted AS BOOLEAN) AS is_deleted,
    CAST(createddate AS TIMESTAMP) AS created_date,
    CAST(lastmodifieddate AS TIMESTAMP) AS last_modified_date
  FROM source
  WHERE isdeleted = FALSE

)

SELECT * FROM renamed
