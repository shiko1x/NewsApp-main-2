import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/api/end_point.dart';
import 'package:news/core/consts/api_constants.dart';
import 'package:news/data/model/news_response.dart';
import 'package:news/data/model/sourcesResponse.dart';

class NewsWebService {

static Future<SourcesResponse> getSources(String categoryId) async {
  Uri url = Uri.https(ApiConstants.baseUrl, EndPoint.sourceApi, {
    "apiKey": ApiConstants.apiKey,
    "category": categoryId,
  });

  try {
    var response = await http.get(url);
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    return SourcesResponse.fromJson(json);
  } catch (e) {
    rethrow;
  }
}


  static Future<NewsResponse> getNews(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoint.newsApi, {
      "apiKey": ApiConstants.apiKey,
      "sources": sourceId,
    });

    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
