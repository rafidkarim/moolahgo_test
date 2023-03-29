import 'dart:io';

import 'package:moolah_go/core/shared/data/model/advertisement_model.dart';
import 'package:moolah_go/core/shared/data/model/credential_model.dart';
import 'package:moolah_go/core/shared/data/model/user_model.dart';
import 'package:moolah_go/core/shared/domain/entity/credential.dart';

abstract class MoolahGoRemoteDataSource {
  Future<CredentialModel> login(
      {required String userName, required String password});

  Future<UserModel> getUser({required String token});

  Future<AdvertisementModel> getAds({required String token});
}
