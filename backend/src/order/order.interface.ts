export interface OrderObjectType {
    order_id: String;
    order_description: String;
    weight: String;
    quantity: String;
    pickup_date: String;
    pickup_address_line_1: String,
    pickup_address_line_2: String,
    pickup_postal_code: String,
    delivery_date: String,
    delivery_address_line_1: String,
    delivery_address_line_2: String,
    delivery_postal_code: String,
    customer_first_name: String,
    customer_last_name: String,
    customer_email: String,
    customer_phone_number: String,
    customer_company: String,
    merchant_name: String,
    approval_status: String
}