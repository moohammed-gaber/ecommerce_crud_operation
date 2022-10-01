import 'package:dartz/dartz.dart';
import 'package:ecommerce_crud_operation/app/core/domain/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_crud_operation/app/core/domain/failures/failure.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/domain/entities/user.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/domain/repository/auth_repo.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/domain/value_objects/user_email.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/domain/value_objects/user_full_name.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/domain/value_objects/user_password.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/domain/value_objects/user_token.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/infrastructure/data_sources/auth_local_data_source.dart';
import 'package:ecommerce_crud_operation/app/modules/auth/infrastructure/data_sources/auth_remote_data_source.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoggedUser>> login(
      UserEmail email, UserPassword password);

  Future<Either<Failure, Unit>> register(
      UserFullName name, UserPassword password, UserEmail email);

  Future<Either<Failure, Profile>> getMyProfile();

  UserToken? getSavedToken();
}
