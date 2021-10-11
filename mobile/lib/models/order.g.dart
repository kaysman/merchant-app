// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      orderId: json['order_id'] as String?,
      approvalStatus:
          _$enumDecodeNullable(_$OrderStatusEnumMap, json['approval_status']),
      customerCompany: json['customer_company'] as String?,
      customerEmail: json['customer_email'] as String?,
      customerFirstName: json['customer_first_name'] as String?,
      customerLastName: json['customer_last_name'] as String?,
      customerPhoneNumber: json['customer_phone_number'] as String?,
      deliveryAddressLine1: json['delivery_address_line_1'] as String?,
      deliveryAddressLine2: json['delivery_address_line_2'] as String?,
      deliveryDate: json['delivery_date'] as String?,
      deliveryPostalCode: json['delivery_postal_code'] as String?,
      merchantName: json['merchant_name'] as String?,
      orderDescription: json['order_description'] as String?,
      pickupAddressLine1: json['pickup_address_line_1'] as String?,
      pickupAddressLine2: json['pickup_address_line_2'] as String?,
      pickupDate: json['pickup_date'] as String?,
      pickupPostalCode: json['pickup_postal_code'] as String?,
      quantity: json['quantity'] as String?,
      weight: json['weight'] as String?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'order_id': instance.orderId,
      'order_description': instance.orderDescription,
      'weight': instance.weight,
      'quantity': instance.quantity,
      'pickup_date': instance.pickupDate,
      'pickup_address_line_1': instance.pickupAddressLine1,
      'pickup_address_line_2': instance.pickupAddressLine2,
      'pickup_postal_code': instance.pickupPostalCode,
      'delivery_date': instance.deliveryDate,
      'delivery_address_line_1': instance.deliveryAddressLine1,
      'delivery_address_line_2': instance.deliveryAddressLine2,
      'delivery_postal_code': instance.deliveryPostalCode,
      'customer_first_name': instance.customerFirstName,
      'customer_last_name': instance.customerLastName,
      'customer_email': instance.customerEmail,
      'customer_phone_number': instance.customerPhoneNumber,
      'customer_company': instance.customerCompany,
      'merchant_name': instance.merchantName,
      'approval_status': _$OrderStatusEnumMap[instance.approvalStatus],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$OrderStatusEnumMap = {
  OrderStatus.NOT_PICKED_UP: 'NOT_PICKED_UP',
  OrderStatus.IN_PROGRESS: 'IN_PROGRESS',
  OrderStatus.COMPLETED: 'COMPLETED',
  OrderStatus.FAILED: 'FAILED',
};
