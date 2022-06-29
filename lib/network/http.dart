import 'package:dio/dio.dart';
import 'config.dart';

class Http {
  static final BaseOptions baseOptions = BaseOptions(
      baseUrl: NetworkConfig.baseUrl,
      queryParameters: {'apikey': NetworkConfig.apikey},
      connectTimeout: NetworkConfig.timeout);
  static final Dio dio = Dio(baseOptions);

  // 发送请求
  static Future<T> request<T>(String url,
      {String? method = 'GET',
      Map<String, dynamic>? params,
      Interceptor? interceptor}) async {
    final options = Options(method: method);

    Interceptor baseInterceptor =
        InterceptorsWrapper(onRequest: (option, handle) {
      print("onRequest: $option");
      handle.next(option);
    }, onResponse: (response, handle) {
      print("onResponse: $response");
      handle.next(response);
    }, onError: (error, handle) {
      print("onReonErrorsponse: $error");
      handle.next(error);
    });
    List<Interceptor> interceptors = [baseInterceptor];
    if (interceptor != null) {
      interceptors.add(interceptor);
    }
    dio.interceptors.addAll(interceptors);

    try {
      Response response =
          await dio.request(url, queryParameters: params, options: options);
      return response.data;
    } on Dio catch (e) {
      return Future.error(e);
    } catch (e) {
      return Future.error(e);
    }
  }
}
