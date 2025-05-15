import 'package:flutter/material.dart';
import 'package:newshttp/categoey/category_detials.dart';
import 'package:newshttp/categoey/category_tab.dart';
import 'package:newshttp/drawer/drawe.dart';
import 'package:newshttp/models/category_model.dart';
import 'package:newshttp/search/search_tab.dart';
import 'package:newshttp/settings/settings.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomePage extends StatefulWidget {
  static String routeName="/HomePage";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height:double.infinity,
      decoration: BoxDecoration(color: Colors.white,
        image: DecorationImage(image:
        AssetImage("assets/images/pattern.png"),
            fit: BoxFit.fill)
      ),
      child: Scaffold(
        drawer: HomeDrawer(
          onTap:selectDrawer ,
        ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.newsapp),
          actions: [
            IconButton(onPressed: (){
              showSearch(context: context,
                  delegate: SearchTab());
            }, icon: Icon(
              Icons.search,
              size: 24.0,
            ))
          ],
        ),
        body:selectedCategory!=null? CategoryDetials(
          id: selectedCategory!.id!,
        ):cats==
            MyDrawer.Categories? CategoryTab(
          onSelectCategory: selectCategory,
        ):SettingTab(),
      ),
    );
  }
  MyDrawer cats=MyDrawer.Categories;
  CategoryModel? selectedCategory;
  selectCategory(CategoryModel categoryModel){
    selectedCategory=categoryModel;
    setState(() {

    });

  }
 void selectDrawer(MyDrawer drawer){
    cats=drawer;
    setState(() {

    });
    selectedCategory=null;
    Navigator.pop(context);
  }
}
