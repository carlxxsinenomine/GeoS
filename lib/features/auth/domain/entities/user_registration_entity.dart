class UserRegistrationEntity {
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

  UserRegistrationEntity(
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
  );
}
