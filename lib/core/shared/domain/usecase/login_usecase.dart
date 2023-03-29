import 'package:dartz/dartz.dart';
import 'package:moolah_go/core/error/failure.dart';
import 'package:moolah_go/core/shared/domain/entity/credential.dart';
import 'package:moolah_go/core/shared/domain/repository/moolah_go_repository.dart';
import 'package:moolah_go/core/usecase/usecase.dart';

class LoginUsecase implements UseCase<Credential, LoginParam> {
  final MoolahGoSharedRepository moolahGoSharedRepository;

  LoginUsecase({required this.moolahGoSharedRepository});

  @override
  Future<Either<Failure, Credential>> call(params) async {
    return moolahGoSharedRepository.login(
        userName: params.username, password: params.password);
  }
}

class LoginParam {
  final String username;
  final String password;

  LoginParam({required this.username, required this.password});
}
