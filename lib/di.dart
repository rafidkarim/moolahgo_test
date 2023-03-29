import 'package:get_it/get_it.dart';
import 'package:moolah_go/core/shared/data/datasource/moolah_go_remote_datasource.dart';
import 'package:moolah_go/core/shared/data/datasource/moolah_go_remote_datasource_impl.dart';
import 'package:moolah_go/core/shared/data/repository/moolah_go_repository_impl.dart';
import 'package:moolah_go/core/shared/domain/repository/moolah_go_repository.dart';
import 'package:moolah_go/core/shared/domain/usecase/get_ads_usecase.dart';
import 'package:moolah_go/core/shared/domain/usecase/get_profile_usecase.dart';
import 'package:moolah_go/core/shared/domain/usecase/login_usecase.dart';

GetIt get = GetIt.instance;

Future<void> setupLocator() async {
  /// Usecases Shared goes here
  get.registerLazySingleton(
      () => LoginUsecase(moolahGoSharedRepository: get()));
  get.registerLazySingleton(
      () => GetAdsUsecase(moolahGoSharedRepository: get()));
  get.registerLazySingleton(
      () => GetProfileUsecase(moolahGoSharedRepository: get()));

  /// Repository Shared goes here
  get.registerLazySingleton<MoolahGoSharedRepository>(
      () => MoolahGoSharedRepositoryImpl(moolahGoRemoteDataSource: get()));

  /// Datasource Shared goes here
  get.registerLazySingleton<MoolahGoRemoteDataSource>(
      () => MoolahGoRemoteDataSourceImpl());
}
