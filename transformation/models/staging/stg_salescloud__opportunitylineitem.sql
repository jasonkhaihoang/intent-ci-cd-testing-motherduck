{{ config(materialized='view') }}

-- Model: stg_salescloud__opportunitylineitem
-- Grain: one row per line_item_id
-- Source: source('salescloud', 'opportunitylineitem')

WITH source AS (

    SELECT * FROM {{ source('salescloud', 'opportunitylineitem') }}

),

renamed AS (

    SELECT
        id AS line_item_id,
        opportunityid AS opportunity_id,
        pricebookentryid AS pricebook_entry_id,
        product2id AS product_id,
        name AS product_name,
        productcode AS product_code,
        quantity,
        unitprice AS unit_price,
        totalprice AS total_price,
        discount,
        description,
        CAST(servicedate AS DATE) AS service_date,
        sortorder AS sort_order,
        CAST(createddate AS TIMESTAMP) AS created_date
    FROM source

)

SELECT * FROM renamed
