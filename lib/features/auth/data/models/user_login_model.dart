import 'package:geos/features/auth/domain/entities/user_login_entity.dart';

class UserLoginModel {
  final String email;
  final String password;

  UserLoginModel({required this.email, required this.password});

  factory UserLoginModel.fromJson(Map<String, dynamic> json) =>
      UserLoginModel(email: json["email"], password: json["password"]);

  Map<String, dynamic> toJson() => {"email": email, "password": password};

  UserLoginEntity toEntity() => UserLoginEntity(email, password);
}
