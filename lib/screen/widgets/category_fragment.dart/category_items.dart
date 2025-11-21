import 'package:flutter/material.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/data/model/category.dart';

class CategoryItems extends StatelessWidget {
  final Category category;
  final int index;
  const CategoryItems({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        alignment: index.isEven
            ? AlignmentGeometry.bottomRight
            : AlignmentGeometry.bottomLeft,
        children: [
          // image
          Image.asset(category.image),
          // Button
          Container(
            padding: EdgeInsetsDirectional.only(
              start: index.isEven ? width * 0.02 : 0,
              end: index.isEven ? width * 0:0.02,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: width * 0.04,
              vertical: height * 0.02,
            ),
            width: width * 0.40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: AppColors.gray,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: index.isEven
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              children: [
                Text("View All", style: Theme.of(context).textTheme.titleMedium),
                CircleAvatar(
                  backgroundColor: AppColors.black,
                  radius: 25,
                  child: Icon(
                    index.isEven
                        ? Icons.arrow_forward_ios_rounded
                        : Icons.arrow_back_ios_new,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
