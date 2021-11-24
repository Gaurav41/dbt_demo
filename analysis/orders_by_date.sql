with orders as (
    select  * from {{ref('stg_orders')}}
),

daily as(
    select 
        order_date,
        count(*) as order_num,

    {% for order_status in ['completed','pending','returned','return_pending','placed']%}
        sum(case when status ='{{order_status}}' then 1 else 0 end) as {{order_status}}_total
        {% if not loop.last%}
        ,
        {% endif %}
    {% endfor %}
    from orders
    group by 1 
)


-- select * from daily