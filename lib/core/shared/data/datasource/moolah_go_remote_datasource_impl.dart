import 'package:moolah_go/core/services/moolahgo_base_api.dart';
import 'package:moolah_go/core/shared/data/datasource/moolah_go_remote_datasource.dart';
import 'package:moolah_go/core/shared/data/model/user_model.dart';
import 'package:moolah_go/core/shared/data/model/credential_model.dart';
import 'package:moolah_go/core/shared/data/model/advertisement_model.dart';

class MoolahGoRemoteDataSourceImpl extends MoolahGoBaseApi
    implements MoolahGoRemoteDataSource {
  MoolahGoRemoteDataSourceImpl() : super();
  @override
  Future<AdvertisementModel> getAds({required String token}) async {
    final res = await apiClient.getAdvertisement(token);
    return res;
  }

  @override
  Future<UserModel> getUser({required String token}) {
    final res = apiClient.getUser(token);
    return res;
  }

  @override
  Future<CredentialModel> login(
      {required String userName, required String password}) {
    final res = apiClient.login(userName, password);
    return res;
  }
}
