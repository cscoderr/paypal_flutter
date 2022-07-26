import 'package:json_annotation/json_annotation.dart';

part 'approve.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Approve {
  Approve({
    this.billigToken,
    this.facilitatorAccessToken,
    this.orderID,
    this.payerID,
    this.paymentID,
    this.subscriptionID,
    this.authCode,
  });

  factory Approve.fromJson(Map<String, dynamic> json) =>
      _$ApproveFromJson(json);

  final String? billigToken;
  final String? facilitatorAccessToken;
  final String? orderID;
  final String? payerID;
  final String? paymentID;
  final String? subscriptionID;
  final String? authCode;
}
