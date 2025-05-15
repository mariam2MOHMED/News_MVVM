import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newshttp/categoey/category_item.dart';
import 'package:newshttp/models/category_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CategoryTab extends StatelessWidget {
  final Function(CategoryModel) onSelectCategory;

  CategoryTab({required this.onSelectCategory});

  @override
  Widget build(BuildContext context) {
    final cats = CategoryModel.getCategories(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
           AppLocalizations.of(context)!.pickyourcategory ,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              itemCount: cats.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onSelectCategory(cats[index]);
                  },
                  child: CategoryItem(
                    categoryModel: cats[index],
                    index: index,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

