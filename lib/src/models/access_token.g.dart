// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessToken _$AccessTokenFromJson(Map<String, dynamic> json) => AccessToken(
      accessToken: json['access_token'] as String?,
      expiresIn: json['expires_in'] as int?,
      appId: json['app_id'] as String?,
      tokenType: json['token_type'] as String?,
      message: json['message'] as String? ?? 'Success',
      status: $enumDecodeNullable(_$StatusEnumMap, json['status']) ??
          Status.success,
    );

Map<String, dynamic> _$AccessTokenToJson(AccessToken instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'expires_in': instance.expiresIn,
      'app_id': instance.appId,
      'token_type': instance.tokenType,
      'message': instance.message,
      'status': _$StatusEnumMap[instance.status]!,
    };

const _$StatusEnumMap = {
  Status.success: 'success',
  Status.error: 'error',
};
