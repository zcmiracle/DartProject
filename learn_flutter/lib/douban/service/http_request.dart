import 'package:dio/dio.dart';
import 'config.dart';

class HttpRequest {

  static final BaseOptions baseOptions = BaseOptions(
    baseUrl: HttpConfig.baseURL,
    connectTimeout: HttpConfig.connectTimeout
  );
  /// 创建Dio
  static final Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url, {
                              String method = "get",
                              Map<String, dynamic> parameter}) async {
    /// 1、创建单独配置
    final options = Options(method: method);

    /// 2、发送网络请求
    try {
      Response response = await dio.request(
          url,
          queryParameters: parameter,
          options: options
      );
      // 返回请求结果
      return response.data;
    } on DioErrorType catch(error) {
      // 返回错误
      return Future.error(error);
    }

  }



}