import 'package:dio/dio.dart';
import 'package:news_c16_mon/models/articles_response.dart';
import 'package:news_c16_mon/models/sources_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://newsapi.org")
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET("/v2/top-headlines/sources")
  Future<SourcesResponse> getSources(
    @Query("category") String categoryId,
  );

  @GET("/v2/everything")
  Future<ArticlesResponse> getArticlesBySource(
    @Query("sources") String sourceId,
  );
}
