import 'package:geos/features/auth/domain/entities/user_registration_entity.dart';

class UserRegisterModel {
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? suffix;
  final String? phoneNumber;
  final String? email;
  final String? password;
  final String? nationality;
  final String? province;
  final String? municipality;
  final String? barangay;

  UserRegisterModel({
    this.firstName,
    this.middleName,
    this.lastName,
    this.suffix,
    this.phoneNumber,
    this.email,
    this.password,
    this.nationality,
    this.province,
    this.municipality,
    this.barangay,
  });

  factory UserRegisterModel.fromJson(Map<String, dynamic> json) =>
      UserRegisterModel(
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        suffix: json["suffix"],
        phoneNumber: json["phoneNumber"],
        email: json["email"],
        password: json["password"],
        nationality: json["nationality"],
        province: json["province"],
        municipality: json["municipality"],
        barangay: json["barangay"],
      );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "middleName": middleName,
    "lastName": lastName,
    "suffix": suffix,
    "phoneNumber": phoneNumber,
    "email": email,
    "password": password,
    "nationality": nationality,
    "province": province,
    "municipality": municipality,
    "barangay": barangay,
  };

  UserRegistrationEntity toEntity() => UserRegistrationEntity(
    firstName,
    middleName,
    lastName,
    suffix,
    phoneNumber,
    email,
    password,
    nationality,
    province,
    municipality,
    barangay,
  );
}
