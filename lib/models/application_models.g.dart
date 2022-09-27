// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['_id'] as String?,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      address: json['address'] as String?,
      type: json['type'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'password': instance.password,
      'address': instance.address,
      'type': instance.type,
      'token': instance.token,
    };
