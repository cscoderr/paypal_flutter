// Generated by https://quicktype.io

import 'package:json_annotation/json_annotation.dart';
import 'package:paypal_flutter/paypal_flutter.dart';

part 'order_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class OrderResponse {
  const OrderResponse({
    this.id,
    this.status,
    this.links,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderResponseFromJson(json);

  final String? id;
  final String? status;
  final List<Link>? links;
}
