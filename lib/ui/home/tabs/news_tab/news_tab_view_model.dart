import 'package:flutter/material.dart';
import 'package:news_c16_mon/api/api_client.dart';
import 'package:news_c16_mon/api/provide_dio.dart';
import 'package:news_c16_mon/core/base/base_view_model.dart';
import 'package:news_c16_mon/models/articles_response.dart';
import 'package:news_c16_mon/models/sources_response.dart';

class NewsTabViewModel extends BaseViewModel {
  final ApiClient _apiClient = ApiClient(provideDio());

  // todo load Sources Data
  List<Sources> sources = [];
  String? sourcesErrorMessage;
  bool sourcesLoading = false;

  Future<void> loadSources(String categoryId) async {
    sourcesLoading = true;
    notifyListeners();
    try {
      var response = await _apiClient.getSources(categoryId);
      if (response.status == "ok") {
        sources = response.sources ?? [];
        if (sources.isNotEmpty) {
          loadArticles(sources.first);
        }
      } else {
        sourcesErrorMessage = response.message;
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

  Future<void> loadArticles(Sources source) async {
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
