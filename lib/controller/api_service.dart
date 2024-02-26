import 'package:dio/dio.dart';

// ignore: unused_element

abstract class NewsApi {
  getTopHeadLines();
  getNews();
  getCategoryNews(String category);
}

class ApiService implements NewsApi {
  // ignore: unused_field
  final String _apiKey = '77309ebb84ac40c2a7e242e54842e37a';

  @override
  Future<dynamic> getCategoryNews(String category) async {
    final dio = Dio();
    // ignore: unused_local_variable
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=$_apiKey";

    try {
      Response res;
      res = await dio.get(url);
      // ignore: unused_local_variable
      if (res.statusCode == 200) {
        return res.data;
      }
      return res.statusCode;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Future<dynamic> getNews() async {
    final dio = Dio();
    // ignore: unused_local_variable
    String url =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$_apiKey";

    try {
      Response res;
      res = await dio.get(url);
      // ignore: unused_local_variable
      if (res.statusCode == 200) {
        return res.data;
      }
      return res.statusCode;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Future<dynamic> getTopHeadLines() async {
    final dio = Dio();
    // ignore: unused_local_variable
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&pageSize=90&apiKey=$_apiKey";

    try {
      Response res;
      res = await dio.get(url);
      // ignore: unused_local_variable
      if (res.statusCode == 200) {
        return res.data;
      }
      return res.statusCode;
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
