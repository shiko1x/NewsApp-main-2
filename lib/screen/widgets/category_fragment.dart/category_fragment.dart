import 'package:flutter/material.dart';
import 'package:news/core/helper/sizebox_helper.dart';
import 'package:news/data/model/category.dart';
import 'package:news/screen/widgets/category_fragment.dart/category_items.dart';

typedef OnCategoryItemClick = void Function(Category);

class CategoryFragment extends StatelessWidget {
  OnCategoryItemClick onCategoryItemClick;
  CategoryFragment({super.key, required this.onCategoryItemClick});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    List<Category> categoryList = [];
    categoryList = Category.listCategory(false);
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            "Good Morning\nHere is Some News For You",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          // category
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: height * 0.02),
              itemCount: categoryList.length,
              separatorBuilder: (context, index) =>
                  context.sizedBoxHelper(height: 10),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // calling
                    onCategoryItemClick(categoryList[index]);
                  },
                  child: CategoryItems(
                    category: categoryList[index],
                    index: index,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
