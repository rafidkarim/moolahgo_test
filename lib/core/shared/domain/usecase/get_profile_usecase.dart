import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moolah_go/core/error/failure.dart';
import 'package:moolah_go/core/shared/domain/entity/advertisement.dart';
import 'package:moolah_go/core/shared/domain/entity/credential.dart';
import 'package:moolah_go/core/shared/domain/entity/user.dart';
import 'package:moolah_go/core/shared/domain/repository/moolah_go_repository.dart';
import 'package:moolah_go/core/usecase/usecase.dart';

class GetProfileUsecase implements UseCase<User, NoParam> {
  final MoolahGoSharedRepository moolahGoSharedRepository;

  GetProfileUsecase({required this.moolahGoSharedRepository});

  @override
  Future<Either<Failure, User>> call(params) async {
    FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
    String? token = await flutterSecureStorage.read(key: "token");

    if (token != null) {
      return moolahGoSharedRepository.getUser(token: token);
    } else {
      throw const Failure(message: "Empty Token");
    }
  }
}
