import 'package:flutter/material.dart';
import 'package:news/data/webservic/news_web_service.dart';
import 'package:news/core/helper/sizebox_helper.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/data/model/news_response.dart';
import 'package:news/data/model/sourcesResponse.dart';
import 'package:news/screen/widgets/news/news_item.dart';

class NewsWidget extends StatefulWidget {
  final Sources sources;

  const NewsWidget({super.key, required this.sources});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return FutureBuilder<NewsResponse>(
      future: NewsWebService.getNews(widget.sources.id ?? ""),
      builder: (context, snapshot) {
        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.gray),
          );
          // clint error
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text("Something wrong ... !"),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    NewsWebService.getNews(widget.sources.id ?? "");
                  });
                },
                child: Text("try again"),
              ),
            ],
          );
        }
        // server response => error
        if (snapshot.data!.status != "ok") {
          return Text(snapshot.data!.message ?? "");
        } else {
          // server response => success
          var listNews = snapshot.data?.articles ?? [];
          return RefreshIndicator(
            color: Colors.blue,
            onRefresh: () {
              setState(() {});
              return NewsWebService.getNews(widget.sources.id ?? "");
            },
            child: ListView.separated(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: height * 0.03, right: width * 0.02,left: width* 0.02),
              itemCount: listNews.length,
              separatorBuilder: (context, index) =>
                  context.sizedBoxHelper(height: 15),
              itemBuilder: (context, index) {
                return NewsItem(news: listNews[index]);
              },
            ),
          );
        }
      },
    );
  }
}
