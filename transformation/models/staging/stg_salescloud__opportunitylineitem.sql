{{ config(materialized='view') }}

-- Model: stg_salescloud__opportunitylineitem
-- Grain: one row per line_item_id
-- Source: source('salescloud', 'opportunitylineitem')

WITH source AS (

  SELECT * FROM {{ source('salescloud', 'opportunitylineitem') }}

),

renamed AS (

  SELECT
    "Id" AS line_item_id,
    "OpportunityId" AS opportunity_id,
    "PricebookEntryId" AS pricebook_entry_id,
    "Product2Id" AS product_id,
    "Name" AS product_name,
    "ProductCode" AS product_code,
    "Quantity" AS quantity,
    "UnitPrice" AS unit_price,
    "TotalPrice" AS total_price,
    "Discount" AS discount,
    "Description" AS description,
    CAST("ServiceDate" AS DATE) AS service_date,
    "SortOrder" AS sort_order,
    CAST("CreatedDate" AS TIMESTAMP) AS created_date
  FROM source

)

SELECT * FROM renamed
