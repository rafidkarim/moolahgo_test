import 'dart:io';

import 'package:moolah_go/core/error/failure.dart';
import 'package:moolah_go/core/mixin/connection_mixin.dart';
import 'package:moolah_go/core/shared/data/datasource/moolah_go_remote_datasource.dart';
import 'package:moolah_go/core/shared/domain/entity/user.dart';
import 'package:moolah_go/core/shared/domain/entity/credential.dart';
import 'package:moolah_go/core/shared/domain/entity/advertisement.dart';
import 'package:moolah_go/core/shared/domain/repository/moolah_go_repository.dart';
import 'package:dartz/dartz.dart';

class MoolahGoSharedRepositoryImpl
    with ConnectivityMixin
    implements MoolahGoSharedRepository {
  final MoolahGoRemoteDataSource moolahGoRemoteDataSource;

  MoolahGoSharedRepositoryImpl({required this.moolahGoRemoteDataSource});

  @override
  Future<Either<Failure, Advertisement>> getAds({required String token}) async {
    if (await isInConnection()) {
      try {
        final res = await moolahGoRemoteDataSource.getAds(token: token);
        return Right(res);
      } on Exception catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } else {
      return Left(NoConnection());
    }
  }

  @override
  Future<Either<Failure, User>> getUser({required String token}) async {
    if (await isInConnection()) {
      try {
        final res = await moolahGoRemoteDataSource.getUser(token: token);
        return Right(res);
      } on Exception catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } else {
      return Left(NoConnection());
    }
  }

  @override
  Future<Either<Failure, Credential>> login(
      {required String userName, required String password}) async {
    if (await isInConnection()) {
      try {
        final res = await moolahGoRemoteDataSource.login(
            password: password, userName: userName);
        return Right(res);
      } on Exception catch (e) {
        return Left(Failure(message: e.toString()));
      }
    } else {
      return Left(NoConnection());
    }
  }
}
