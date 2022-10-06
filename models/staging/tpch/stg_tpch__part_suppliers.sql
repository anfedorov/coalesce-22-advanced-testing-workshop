with 

source as (
    select * from {{ source('TPCH_SF1', 'partsupp') }}
),

cleaned as (
    select
        ps_partkey as part_id,
        ps_suppkey as supplier_id,
        ps_availqty as available_qty,
        --Insert 33 nulls, then re-BUILD
        -- case
        --     when ps_availqty = 3640 then null
        --     else ps_availqty
        -- end as available_qty,
        ps_supplycost as supply_cost,
        ps_comment as comment
    from source
)

select * from cleaned