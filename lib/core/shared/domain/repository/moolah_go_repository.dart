import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:moolah_go/core/error/failure.dart';
import 'package:moolah_go/core/shared/domain/entity/advertisement.dart';
import 'package:moolah_go/core/shared/domain/entity/credential.dart';
import 'package:moolah_go/core/shared/domain/entity/user.dart';

abstract class MoolahGoSharedRepository {
  Future<Either<Failure, Credential>> login(
      {required String userName, required String password});

  Future<Either<Failure, User>> getUser({required String token});

  Future<Either<Failure, Advertisement>> getAds({required String token});
}
