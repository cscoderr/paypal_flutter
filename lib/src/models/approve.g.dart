// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'approve.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Approve _$ApproveFromJson(Map<String, dynamic> json) => Approve(
      billigToken: json['billig_token'] as String?,
      facilitatorAccessToken: json['facilitator_access_token'] as String?,
      orderID: json['order_i_d'] as String?,
      payerID: json['payer_i_d'] as String?,
      paymentID: json['payment_i_d'] as String?,
      subscriptionID: json['subscription_i_d'] as String?,
      authCode: json['auth_code'] as String?,
    );

Map<String, dynamic> _$ApproveToJson(Approve instance) => <String, dynamic>{
      'billig_token': instance.billigToken,
      'facilitator_access_token': instance.facilitatorAccessToken,
      'order_i_d': instance.orderID,
      'payer_i_d': instance.payerID,
      'payment_i_d': instance.paymentID,
      'subscription_i_d': instance.subscriptionID,
      'auth_code': instance.authCode,
    };
