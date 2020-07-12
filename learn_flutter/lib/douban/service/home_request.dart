import 'package:learn_flutter/douban/model/home_model.dart';
import 'package:learn_flutter/douban/service/http_request.dart';
import 'package:learn_flutter/douban/service/config.dart';

class HomeRequest {

  static Future<List<MovieItem>> requestMovieList(int start) async {
    /// 1、构建URL
    final movieURL = "/movie/in_theaters?apikey=${HomeConfig.apiKey}&start=$start&count=${HomeConfig.movieCount}";
//    http://api.douban.com/v2/movie/in_theaters?apikey=0df993c66c0c636e29ecbb5344252a4a&start=0&count=10

    /// 2、await拿到异步请求的结果 发送网络请求获取结果
//    final result = await HttpRequest.request(movieURL).then((res){
//      print(res);
//    });

    final result = await HttpRequest.request(movieURL);
    final subjects = result["subjects"];

    /// 3、将Map转成Model
    List<MovieItem> movies = [];
    for (var subject in subjects) {
      movies.add(MovieItem.fromMap(subject));
    }

    print(movies);
    return movies;
  }
}

