with payments as (

    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status,

        --amount is stored in cents, converting to dollars
        {{ cents_to_dollars('amount') }} as amount

    from {{ source('stripe', 'payment') }}

)

select * from payments