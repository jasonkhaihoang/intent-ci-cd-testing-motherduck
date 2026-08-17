# Design: stg_example smoke-test staging view

## Architecture

Add one staging view, `stg_example`, materialized as a `view`, that selects hardcoded literal rows. Grain: one row per example record. No upstream source — the view is a self-contained smoke test of the MotherDuck dbt build path for a brand-new repo.

## Inventory

### Model Inventory

| Model | Materialization | Grain | Columns |
| --- | --- | --- | --- |
| stg_example | view | one row per example record | id, name |

## Source Mapping / Discovery

No source mapping — the model reads no `source()` or `ref()`; it selects hardcoded literal values only.

## Change Impact

New staging view; no existing models are touched and there are no downstream consumers. Greenfield repo — no impact on shipped products.
