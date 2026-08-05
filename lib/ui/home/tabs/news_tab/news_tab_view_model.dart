import 'package:bloc/bloc.dart';
import 'package:news_c16_mon/data/api/api_client.dart';
import 'package:news_c16_mon/data/api/provide_dio.dart';
import 'package:news_c16_mon/data/datasource/api_datasource/api_remote_data_source_impl.dart';
import 'package:news_c16_mon/data/datasource/firebase_remote_datasource/firebase_remote_data_source_impl.dart';
import 'package:news_c16_mon/data/mappers/sources_mapper.dart';
import 'package:news_c16_mon/data/repository/sources_repository_impl.dart';
import 'package:news_c16_mon/domain/use_cases/get_sources_use_case.dart';
import 'package:news_c16_mon/ui/home/tabs/news_tab/news_contract.dart';

class NewsTabViewModel extends Bloc<NewsEvents, NewsState> {
  NewsTabViewModel() : super(NewsState()) {
    on<GetSources>(_loadSources);
    on<LoadArticles>(_loadArticles);
  }

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

  Future<void> _loadSources(GetSources action, Emitter emitter) async {
    emitter(state.copyWith(sourcesLoading: true));
    try {
      var response = await useCase.getSources(action.categoryId);
      emitter(state.copyWith(sources: response));
      if (state.sources.isNotEmpty) {
        add(LoadArticles(state.sources.first));
      }
    } catch (e) {
      emitter(state.copyWith(sourcesErrorMessage: e.toString()));
    } finally {
      emitter(state.copyWith(sourcesLoading: false));
    }
  }

  // todo load Articles Data

  Future<void> _loadArticles(LoadArticles action, Emitter emitter) async {
    emitter(state.copyWith(articlesLoading: true));
    try {
      var response = await _apiClient.getArticlesBySource(
        action.source.id ?? '',
      );
      if (response.status == "ok") {
        emitter(state.copyWith(articles: response.articles ?? []));
      } else {
        emitter(state.copyWith(articlesErrorMessage: response.message));
      }
    } catch (e) {
      emitter(state.copyWith(articlesErrorMessage: e.toString()));
    } finally {
      emitter(state.copyWith(articlesLoading: false));
    }
  }
}
