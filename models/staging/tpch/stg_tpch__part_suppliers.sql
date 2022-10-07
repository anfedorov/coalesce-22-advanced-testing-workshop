with 

source as (
    select * from {{ source('TPCH_SF1', 'partsupp') }}
),

cleaned as (
    select
        ps_partkey as part_id,
        ps_suppkey as supplier_id,
        -- Intentionally add 33 nulls to the table
        case
            when ps_availqty = 3640 then null
            else ps_availqty
        end as available_qty,
        ps_supplycost as supply_cost,
        ps_comment as comment
    from source
)

select * from cleaned