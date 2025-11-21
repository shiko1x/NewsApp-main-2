import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/core/helper/sizebox_helper.dart';
import 'package:news/data/model/news_response.dart';
import 'package:news/screen/widgets/news/web_viewe_screen.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  final News news;
  const NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        showNewsInfo(context);
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: Theme.of(context).colorScheme.outline),
        ),
        child: Column(
          spacing: height * 0.01,
          children: [
            // Image Network
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? "",
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(color: Colors.lightBlue),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            // Title
            Text(
              news.title ?? "",
              style: Theme.of(context).textTheme.titleSmall,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            // members & time
            Row(
              children: [
                // by: author
                Expanded(
                  child: Text(
                    "By: ${news.author ?? "Unknown"}",
                    style: Theme.of(context).textTheme.labelSmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                SizedBox(width: 8),
                // time ago
                Text(
                  timeago.format(
                    DateTime.parse(news.publishedAt ?? ""),
                    locale: "en",
                  ),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showNewsInfo(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(top: 40, bottom: 40),
          child: Container(
            width: width * 0.9,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: news.urlToImage ?? "",
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                          color: Colors.lightBlue,
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  context.sizedBoxHelper(height: 10),
                  Text(
                    news.content ?? "",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  context.sizedBoxHelper(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (news.url != null && news.url!.startsWith("http")) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => WebViewScreen(
                                url: news.url!,
                                title: news.title ?? "Article",
                              ),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("No valid article URL found"),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'View Full Article',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

  }
}
