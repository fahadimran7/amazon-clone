import 'package:freezed_annotation/freezed_annotation.dart';
part 'application_models.freezed.dart';
part 'application_models.g.dart';

@freezed
abstract class User with _$User {
  factory User({
    @Default('') @JsonKey(name: '_id') String? id,
    String? fullName,
    required String email,
    required String password,
    @Default('') String? address,
    @Default('') String? type,
    @Default('') String? token,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
abstract class Product with _$Product {
  factory Product({
    @Default('') @JsonKey(name: '_id') String? id,
    required String name,
    required String brand,
    required String imageUrl,
    required double price,
    required int rating,
    required bool inStock,
    @Default('') String? description,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
