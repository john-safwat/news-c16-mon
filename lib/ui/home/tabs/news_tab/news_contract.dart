import 'package:news_c16_mon/data/models/articles_response.dart';
import 'package:news_c16_mon/domain/entity/source_entity.dart';

class NewsState {
  List<SourceEntity> sources;
  String? sourcesErrorMessage;
  bool sourcesLoading;
  List<Articles> articles;
  String? articlesErrorMessage;
  bool articlesLoading;

  NewsState({
    this.sources = const [],
    this.sourcesErrorMessage,
    this.sourcesLoading = false,
    this.articles = const [],
    this.articlesErrorMessage,
    this.articlesLoading = false,
  });

  NewsState copyWith({
    List<SourceEntity>? sources,
    String? sourcesErrorMessage,
    bool? sourcesLoading,
    List<Articles>? articles,
    String? articlesErrorMessage,
    bool? articlesLoading,
  }) {
    return NewsState(
      sources: sources ?? this.sources,
      sourcesErrorMessage: sourcesErrorMessage ?? this.sourcesErrorMessage,
      sourcesLoading: sourcesLoading ?? this.sourcesLoading,
      articles: articles ?? this.articles,
      articlesErrorMessage: articlesErrorMessage ?? this.articlesErrorMessage,
      articlesLoading: articlesLoading ?? this.articlesLoading,
    );
  }
}

sealed class NewsEvents {}

class GetSources extends NewsEvents{
  String categoryId;

  GetSources(this.categoryId);
}


class LoadArticles extends NewsEvents{
  SourceEntity source;

  LoadArticles(this.source);
}