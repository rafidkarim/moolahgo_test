import 'dart:io';

import 'package:dio/dio.dart';
import 'package:moolah_go/core/shared/data/model/advertisement_model.dart';
import 'package:moolah_go/core/shared/data/model/credential_model.dart';
import 'package:moolah_go/core/shared/data/model/user_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:http_parser/http_parser.dart';

part 'moolahgo_api.g.dart';

@RestApi()
abstract class MoolahGoApi {
  factory MoolahGoApi(Dio dio, {required String baseUrl}) = _MoolahGoApi;

  @POST('/login')
  @FormUrlEncoded()
  Future<CredentialModel> login(
      @Field("userName") userName, @Field("password") password);

  @POST('/getUser')
  @FormUrlEncoded()
  Future<UserModel> getUser(@Field("token") token);

  @POST('/getAdvertisement')
  @FormUrlEncoded()
  Future<AdvertisementModel> getAdvertisement(@Field("token") token);
}
