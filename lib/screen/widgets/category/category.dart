import 'package:flutter/material.dart';
import 'package:news/data/model/category.dart';
import 'package:news/data/webservic/news_web_service.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/data/model/sourcesResponse.dart';
import 'package:news/screen/widgets/category/source_tap.dart';

class CategoryDetails extends StatefulWidget {
  final Category category;
  const CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: NewsWebService.getSources(widget.category.id),

      builder: (context, snapshot) {
        //* loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.gray),
          );
          //* clint error
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text("Some thing wrong ...!"),
              ElevatedButton(onPressed: () {}, child: Text("Try again")),
            ],
          );
        }
        //* server response => error
        if (snapshot.data!.status != "ok") {
          return Column(
            children: [
              Text(snapshot.data!.message!),
              ElevatedButton(onPressed: () {}, child: Text("Try again")),
            ],
          );
        }
        //* server response => success
        var sourcesList = snapshot.data?.sources ?? [];
        return SourceTapWidget(listSources: sourcesList);
      },
    );
  }
}
