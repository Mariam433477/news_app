import 'package:dio/dio.dart';

import '../models/articale_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);
  Future<List<ArticleModel>> getTopHeadlines({required String category}) async {
    try {
      final response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=7967809dbeee46ada6f7d4ccbf8d8046&category=$category');
      // print(response);
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      List<ArticleModel> articlesList = [];
      for (var article in articles) {
        ArticleModel articleModel = ArticleModel.fromJson(article);
        articlesList.add(articleModel);
      }

      return articlesList;
    } catch (e) {
      return [];
    }
  }

  // void getSportsNews() async {
  //   final response = await dio.get('https://newsapi.org/v2/top-headlines?q=bitcoin&apiKey=7967809dbeee46ada6f7d4ccbf8d8046');
  //   print(response);
  // }
}
