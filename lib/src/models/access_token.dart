import 'package:json_annotation/json_annotation.dart';

part 'access_token.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AccessToken {
  AccessToken({
    this.accessToken,
    this.expiresIn,
    this.appId,
    this.tokenType,
    this.message = 'Success',
    this.status = Status.success,
  });

  factory AccessToken.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenFromJson(json);

  final String? accessToken;
  final int? expiresIn;
  final String? appId;
  final String? tokenType;
  final String message;
  final Status status;
}

enum Status {
  success,
  error,
}
