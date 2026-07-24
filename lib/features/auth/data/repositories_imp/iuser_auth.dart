import 'package:dartz/dartz.dart';
import 'package:geos/core/error/exceptions.dart';
import 'package:geos/features/auth/domain/entities/user_login_entity.dart';
import 'package:geos/features/auth/domain/entities/user_registration_entity.dart';
import 'package:geos/features/auth/domain/repositories/user_auth_repository.dart';

class IUserAuth implements UserAuthRepository {
  @override
  Future<Either<ServerError, UserLoginEntity>> loginUser() {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  Future<Either<ServerError, UserRegistrationEntity>> registerUser() {
    // TODO: implement registerUser
    throw UnimplementedError();
  }

}