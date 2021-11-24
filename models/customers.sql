with customers as (
    select * from {{ref('stg_customers')}}
),
employee as(
    select * from {{ref('employee')}}
),
orders as (
    select * from {{ref('stg_orders')}}
),

customer_orders as (
    select customer_id,
    
    min(ORDER_DATE) as first_order_date,
    max(ORDER_DATE) as last_order_date,
    count(*) as total_orders
    from orders
    group by 1
),
final as (
    select 
    customers.customer_id,
    customers.first_name,
    customers.last_name,
    employee.employee_id is not null as is_employee,
    customer_orders.first_order_date,
    customer_orders.last_order_date,
    customer_orders.total_orders
    from customers
    left join  customer_orders using (customer_id)
    left join  employee using (customer_id)



)

select * from final;