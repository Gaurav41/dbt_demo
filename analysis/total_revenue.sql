with pyaments as(
    select * from {{ref('stg_payments')}}
),

aggregate as (
    select sum(amount) as total_revenue
    from pyaments
    where status = 'success'
)

select * from aggregate