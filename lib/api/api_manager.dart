import 'package:dio/dio.dart';
import 'package:news_c16_mon/models/articles_response.dart';
import 'package:news_c16_mon/models/sources_response.dart';

class ApiManager {
  String baseUrl = "newsapi.org";
  String apiKey = "2c58c6392813448996cbedf8b2cd9b2e";

  Future<SourcesResponse> getSource(String categoryId) async {
    var dio = Dio();
    var uri = Uri.https(baseUrl, "/v2/top-headlines/sources", {
      "category": categoryId,
    });

    var apiResponse = await dio.getUri(
      uri,
      options: Options(headers: {"X-Api-Key": apiKey}),
    );

    SourcesResponse response = SourcesResponse.fromJson(apiResponse.data);
    return response;
  }

  Future<ArticlesResponse> getArticlesBySource(String sourceId) async {
    var dio = Dio();
    var uri = Uri.https(baseUrl, "/v2/everything", {"sources": sourceId});

    var apiResponse = await dio.getUri(
      uri,
      options: Options(headers: {"X-Api-Key": apiKey}),
    );

    ArticlesResponse response = ArticlesResponse.fromJson(apiResponse.data);
    return response;
  }
}
