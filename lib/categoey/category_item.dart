import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/category_model.dart';
import '../provider/setting_provider.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;int index;
   CategoryItem({required this.categoryModel,required this.index});

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider=Provider.of<SettingProvider>(context);
    return Container(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(categoryModel.image,height: 100,
            fit: BoxFit.cover,
            ),
            SizedBox(height: 12.0,),
            Text(categoryModel.title,style:
            Theme.of(context).textTheme.headlineMedium,)
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(25.0),
          topEnd: Radius.circular(25.0),
          bottomStart: index.isEven?Radius.circular(25):Radius.zero,
          bottomEnd: index.isOdd?Radius.circular(25):Radius.zero,
        )
      ),
    );
  }
}
