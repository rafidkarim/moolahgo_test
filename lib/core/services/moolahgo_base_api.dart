import 'package:dio/dio.dart';
import 'package:moolah_go/core/interceptor/curl_log_interceptor.dart';
import 'package:moolah_go/core/interceptor/query_interceptor.dart';
import 'package:moolah_go/core/services/moolahgo_api.dart';

abstract class MoolahGoBaseApi {
  late final MoolahGoApi _apiClient;

  /// [identityBaseUrl] use for refreshing token later
  ///
  MoolahGoBaseApi(
      {String? identityBaseUrl,
      bool ignoreConnection = false,
      bool ignoreToken = false}) {
    final dio = Dio();
    dio.interceptors.add(CurlLogInterceptor(disableRequestBody: false));
    dio.interceptors.add(QueryInterceptor(
      identityBaseDomain: identityBaseUrl,
      ignoreConnection: ignoreConnection,
      ignoreToken: ignoreToken,
    ));
    _apiClient = MoolahGoApi(dio,
        baseUrl: "https://51eea27e-6354-4d21-bfba-cf995372ce4e.mock.pstmn.io");
  }

  MoolahGoApi get apiClient => _apiClient;
}
