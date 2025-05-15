import 'package:flutter/material.dart';
import 'package:newshttp/shared/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CategoryModel {
  String image;
  String title;
  Color color;
  String id;

  CategoryModel({
    required this.image,
    required this.title,
    required this.color,
    required this.id,
  });

  // // ✅ استخدم دالة بدال static list
  // static List<CategoryModel> getCategories(BuildContext context) {
  //   return [
  //     CategoryModel(
  //       image: "assets/images/sports.png",
  //       title: AppLocalizations.of(context)!.sports,
  //       color: AppTheme.red,
  //       id: "sports",
  //     ),
  //     CategoryModel(
  //       image: "assets/images/Politics.png",
  //       title: AppLocalizations.of(context)!.politics,
  //       color: AppTheme.blue,
  //       id: "general",
  //     ),
  //     CategoryModel(
  //       image: "assets/images/health.png",
  //       title: AppLocalizations.of(context)!.health,
  //       color: AppTheme.pink,
  //       id: "health",
  //     ),
  //     CategoryModel(
  //       image: "assets/images/bussines.png",
  //       title: AppLocalizations.of(context)!.bussines,
  //       color: AppTheme.brown,
  //       id: "business",
  //     ),
  //     CategoryModel(
  //       image: "assets/images/environment.png",
  //       title: AppLocalizations.of(context)!.entertainment,
  //       color: AppTheme.lightBlue,
  //       id: "entertainment",
  //     ),
  //     CategoryModel(
  //       image: "assets/images/science.png",
  //       title: AppLocalizations.of(context)!.science,
  //       color: AppTheme.yellow,
  //       id: "science",
  //     ),
  //   ];
  // }
  static List<CategoryModel> getCategories(BuildContext context) {
    final loc = AppLocalizations.of(context);
    if (loc == null) {
// ممكن ترجع نسخة مؤقتة أو ترمي استثناء أو ترجع قائمة فاضية حسب ما يناسبك
      return [
        CategoryModel(
          image: "assets/images/sports.png",
          title: AppLocalizations.of(context)!.sports,
          color: AppTheme.red,
          id: "sports",
        ),
        CategoryModel(
          image: "assets/images/Politics.png",
          title: AppLocalizations.of(context)!.politics,
          color: AppTheme.blue,
          id: "general",
        ),
        CategoryModel(
          image: "assets/images/health.png",
          title: AppLocalizations.of(context)!.health,
          color: AppTheme.pink,
          id: "health",
        ),
        CategoryModel(
          image: "assets/images/bussines.png",
          title: AppLocalizations.of(context)!.bussines,
          color: AppTheme.brown,
          id: "business",
        ),
        CategoryModel(
          image: "assets/images/environment.png",
          title: AppLocalizations.of(context)!.entertainment,
          color: AppTheme.lightBlue,
          id: "entertainment",
        ),
        CategoryModel(
          image: "assets/images/science.png",
          title: AppLocalizations.of(context)!.science,
          color: AppTheme.yellow,
          id: "science",
        ),
      ];
    }

    return [
      CategoryModel(
        image: "assets/images/sports.png",
        title: AppLocalizations.of(context)!.sports,
        color: AppTheme.red,
        id: "sports",
      ),
      CategoryModel(
        image: "assets/images/Politics.png",
        title: AppLocalizations.of(context)!.politics,
        color: AppTheme.blue,
        id: "general",
      ),
      CategoryModel(
        image: "assets/images/health.png",
        title: AppLocalizations.of(context)!.health,
        color: AppTheme.pink,
        id: "health",
      ),
      CategoryModel(
        image: "assets/images/bussines.png",
        title: AppLocalizations.of(context)!.bussines,
        color: AppTheme.brown,
        id: "business",
      ),
      CategoryModel(
        image: "assets/images/environment.png",
        title: AppLocalizations.of(context)!.entertainment,
        color: AppTheme.lightBlue,
        id: "entertainment",
      ),
      CategoryModel(
        image: "assets/images/science.png",
        title: AppLocalizations.of(context)!.science,
        color: AppTheme.yellow,
        id: "science",
      ),
    ];
  }
}

