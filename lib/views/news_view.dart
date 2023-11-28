import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/views/cards_views.dart';
import 'package:news_app_ui_setup/views/news_list_view.dart';
import 'package:news_app_ui_setup/views/news_tile.dart';

import '../models/articale_model.dart';
import '../services/news_service.dart';
import 'categories_list_view.dart';
import 'news_list_view_builder.dart';

class NewsViews extends StatelessWidget {
  const NewsViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: 'News',
                    style: TextStyle(color: Colors.black, fontSize: 20)),
                TextSpan(
                    text: 'Cloud',
                    style: TextStyle(color: Colors.orange, fontSize: 20)),
              ],
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: CategoriesListView(),
            ),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 32,
            )),
            NewsListViewBuilder(category: 'general',),
          ],
        ),
      ),
    );
  }
}

