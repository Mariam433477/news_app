import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/articale_model.dart';
import '../services/news_service.dart';
import 'news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key, required this.category,
  });
final String category;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  // List<ArticleModel> articles = [];
  var future;

  @override
  void initState() {
    // TODO: implement initState;
    super.initState();
    future= NewsService(Dio()).getTopHeadlines(
      category: widget.category,
    );
  }

  // Future<void> getGeneralNews() async {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return NewsListView(
              articles: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return SliverToBoxAdapter(
              child: Text('oops there was an error'),
            );
          } else {
            return SliverToBoxAdapter(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
    //   isLoading
    //     ? SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()))
    //     :articles.isNotEmpty? NewsListView(
    //   articles: articles,
    // ):SliverToBoxAdapter(child:Text('oops there was an error'));
  }
}
// class ErrorMessage extends StatelessWidget {
//   const ErrorMessage({
//     super.key, required this.message,
//   });
//   final String message;
//   @override
//   Widget build(BuildContext context) {
//     return Text(message);
//   }
// }
