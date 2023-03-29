import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moolah_go/core/error/failure.dart';
import 'package:moolah_go/core/shared/domain/entity/advertisement.dart';
import 'package:moolah_go/core/shared/domain/entity/credential.dart';
import 'package:moolah_go/core/shared/domain/repository/moolah_go_repository.dart';
import 'package:moolah_go/core/usecase/usecase.dart';

class GetAdsUsecase implements UseCase<Advertisement, NoParam> {
  final MoolahGoSharedRepository moolahGoSharedRepository;

  GetAdsUsecase({required this.moolahGoSharedRepository});

  @override
  Future<Either<Failure, Advertisement>> call(params) async {
    FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
    String? token = await flutterSecureStorage.read(key: "token");

    if (token != null) {
      return moolahGoSharedRepository.getAds(token: token);
    } else {
      throw const Failure(message: "Empty Token");
    }
  }
}
