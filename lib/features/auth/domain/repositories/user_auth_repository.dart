import 'package:dartz/dartz.dart';
import 'package:geos/core/error/exceptions.dart';
import 'package:geos/features/auth/domain/entities/user_login_entity.dart';
import 'package:geos/features/auth/domain/entities/user_registration_entity.dart';

abstract class UserAuthRepository {
  Future<Either<ServerError, UserRegistrationEntity>> registerUser();
  Future<Either<ServerError, UserLoginEntity>> loginUser();
}