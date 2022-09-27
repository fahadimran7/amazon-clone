import 'package:freezed_annotation/freezed_annotation.dart';
part 'application_models.freezed.dart';
part 'application_models.g.dart';

@freezed
abstract class User with _$User {
  factory User({
    @JsonKey(name: '_id') String? id,
    required String fullName,
    required String email,
    required String password,
    String? address,
    String? type,
    String? token,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
