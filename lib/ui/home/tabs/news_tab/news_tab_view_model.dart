import 'package:news_c16_mon/core/base/base_view_model.dart';
import 'package:news_c16_mon/data/api/api_client.dart';
import 'package:news_c16_mon/data/api/provide_dio.dart';
import 'package:news_c16_mon/data/datasource/api_datasource/api_remote_data_source_impl.dart';
import 'package:news_c16_mon/data/datasource/firebase_remote_datasource/firebase_remote_data_source_impl.dart';
import 'package:news_c16_mon/data/mappers/sources_mapper.dart';
import 'package:news_c16_mon/data/models/articles_response.dart';
import 'package:news_c16_mon/data/repository/sources_repository_impl.dart';
import 'package:news_c16_mon/domain/entity/source_entity.dart';
import 'package:news_c16_mon/domain/use_cases/get_sources_use_case.dart';

class NewsTabViewModel extends BaseViewModel {
  final ApiClient _apiClient = ApiClient(provideDio());
  final GetSourcesUseCase useCase = GetSourcesUseCase(
    SourcesRepositoryImpl(
      ApiRemoteDataSourceImpl(),
      FirebaseRemoteDataSourceImpl(),
      SourcesMapper(),
    ),
  );

  // todo lo
  //  ad Sources Data
  List<SourceEntity> sources = [];
  String? sourcesErrorMessage;
  bool sourcesLoading = false;

  Future<void> loadSources(String categoryId) async {
    sourcesLoading = true;
    notifyListeners();
    try {
      var response = await useCase.getSources(categoryId);
      sources = response;
      if (sources.isNotEmpty) {
        loadArticles(sources.first);
      }
    } catch (e) {
      sourcesErrorMessage = e.toString();
    } finally {
      sourcesLoading = false;
      notifyListeners();
    }
  }

  // todo load Articles Data
  List<Articles> articles = [];
  String? articlesErrorMessage;
  bool articlesLoading = false;

  Future<void> loadArticles(SourceEntity source) async {
    articlesLoading = true;
    notifyListeners();
    try {
      var response = await _apiClient.getArticlesBySource(source.id ?? '');
      if (response.status == "ok") {
        articles = response.articles ?? [];
      } else {
        articlesErrorMessage = response.message;
      }
    } catch (e) {
      articlesErrorMessage = e.toString();
    } finally {
      articlesLoading = false;
      notifyListeners();
    }
  }
}
