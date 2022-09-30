// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['_id'] as String? ?? '',
      fullName: json['fullName'] as String?,
      email: json['email'] as String,
      password: json['password'] as String,
      favorites: (json['favorites'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      address: json['address'] as String? ?? '',
      type: json['type'] as String? ?? '',
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'email': instance.email,
      'password': instance.password,
      'favorites': instance.favorites,
      'address': instance.address,
      'type': instance.type,
    };

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      id: json['_id'] as String? ?? '',
      name: json['name'] as String,
      brand: json['brand'] as String,
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toDouble(),
      rating: json['rating'] as int,
      inStock: json['inStock'] as bool,
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'brand': instance.brand,
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'rating': instance.rating,
      'inStock': instance.inStock,
      'description': instance.description,
    };
