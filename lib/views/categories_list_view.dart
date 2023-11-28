import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/category_model.dart';

import 'cards_views.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });
final List<CategoryModel> categories=const [

  CategoryModel(imageAssets: 'assets/business.avif', CategoryName: 'Business'),
  CategoryModel(imageAssets: 'assets/entertaiment.avif', CategoryName: 'Entertaiment'),
  CategoryModel(imageAssets: 'assets/general.avif', CategoryName: 'General'),
  CategoryModel(imageAssets: 'assets/health.avif', CategoryName: 'Health'),
  CategoryModel(imageAssets: 'assets/science.avif', CategoryName: 'Science'),
  CategoryModel(imageAssets: 'assets/sports.avif', CategoryName: 'Sports'),
  CategoryModel(imageAssets: 'assets/technology.jpeg', CategoryName: 'Technology'),


];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index){
            return CardsView(category: categories[index]) ;
          }),
    );
  }
}