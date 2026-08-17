{{ config(materialized='view') }}

-- Model: stg_example
-- Grain: one row per example record
-- Source: hardcoded literal values (no upstream source)

SELECT
    1 AS id,
    'alpha' AS "name"

UNION ALL

SELECT
    2 AS id,
    'beta' AS "name"

UNION ALL

SELECT
    3 AS id,
    'gamma' AS "name"
