
class HttpConfig {

  /// 生产环境baseURL
  static const String baseURL = "http://api.douban.com/v2";
  /// 开发环境baseURL
//  static const String baseURL = "https://httpbin.org";

  /// 连接超时时间
  static const int connectTimeout = 5000;

}


/// 首页网络请求配置
class HomeConfig {
  // apiKey
  static const String apiKey = "0df993c66c0c636e29ecbb5344252a4a";
  // 电影数目
  static const int movieCount = 20;

}