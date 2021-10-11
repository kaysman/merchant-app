import 'package:json_annotation/json_annotation.dart';
import 'package:merchant_helper/config/enums.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  const Order({
    this.orderId,
    this.approvalStatus,
    this.customerCompany,
    this.customerEmail,
    this.customerFirstName,
    this.customerLastName,
    this.customerPhoneNumber,
    this.deliveryAddressLine1,
    this.deliveryAddressLine2,
    this.deliveryDate,
    this.deliveryPostalCode,
    this.merchantName,
    this.orderDescription,
    this.pickupAddressLine1,
    this.pickupAddressLine2,
    this.pickupDate,
    this.pickupPostalCode,
    this.quantity,
    this.weight,
  });

  @JsonKey(name: "order_id")
  final String? orderId;

  @JsonKey(name: "order_description")
  final String? orderDescription;

  final String? weight;
  final String? quantity;

  @JsonKey(name: "pickup_date")
  final String? pickupDate;

  @JsonKey(name: "pickup_address_line_1")
  final String? pickupAddressLine1;

  @JsonKey(name: "pickup_address_line_2")
  final String? pickupAddressLine2;

  @JsonKey(name: "pickup_postal_code")
  final String? pickupPostalCode;

  @JsonKey(name: "delivery_date")
  final String? deliveryDate;

  @JsonKey(name: "delivery_address_line_1")
  final String? deliveryAddressLine1;

  @JsonKey(name: "delivery_address_line_2")
  final String? deliveryAddressLine2;

  @JsonKey(name: "delivery_postal_code")
  final String? deliveryPostalCode;

  @JsonKey(name: "customer_first_name")
  final String? customerFirstName;

  @JsonKey(name: "customer_last_name")
  final String? customerLastName;

  @JsonKey(name: "customer_email")
  final String? customerEmail;

  @JsonKey(name: "customer_phone_number")
  final String? customerPhoneNumber;

  @JsonKey(name: "customer_company")
  final String? customerCompany;

  @JsonKey(name: "merchant_name")
  final String? merchantName;

  @JsonKey(name: "approval_status")
  final OrderStatus? approvalStatus;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
