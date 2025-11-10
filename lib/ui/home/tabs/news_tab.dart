import 'package:flutter/material.dart';
import 'package:news_c16_mon/api/api_manager.dart';
import 'package:news_c16_mon/core/utils/context_extentions.dart';
import 'package:news_c16_mon/core/utils/padding_utils.dart';
import 'package:news_c16_mon/core/utils/white_space_utils.dart';
import 'package:news_c16_mon/models/articles_response.dart';
import 'package:news_c16_mon/models/category_dm.dart';
import 'package:news_c16_mon/models/sources_response.dart';
import 'package:news_c16_mon/ui/home/widgets/article_card.dart';

class NewsTab extends StatelessWidget {
  final CategoryDm categoryDm;

  NewsTab({required this.categoryDm, super.key});

  final ApiManager apiManager = ApiManager();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<SourcesResponse>(
          future: apiManager.getSource(categoryDm.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return LinearProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                  style: context.textTheme.labelMedium,
                ),
              );
            } else if (snapshot.hasData) {
              if (snapshot.data?.status == "error") {
                return Center(
                  child: Text(
                    snapshot.data?.message ?? "",
                    style: context.textTheme.labelMedium,
                  ),
                );
              }
              var sources = snapshot.data?.sources ?? [];
              var selectedSource = sources.first;
              return Expanded(
                child: Column(
                  children: [
                    DefaultTabController(
                      length: sources.length,
                      child: TabBar(
                        onTap: (index){
                          selectedSource = sources[index];
                        },
                        dividerHeight: 0,
                        tabAlignment: TabAlignment.start,
                        padding: EdgeInsets.all(0),
                        indicatorPadding: EdgeInsets.all(0),
                        isScrollable: true,
                        tabs: sources
                            .map(
                              (sources) => Text(
                                sources.name ?? "",
                              ).withVerticalPadding(8),
                            )
                            .toList(),
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder<ArticlesResponse>(
                        future: apiManager.getArticlesBySource(
                          selectedSource.id ?? "",
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                snapshot.error.toString(),
                                style: context.textTheme.labelMedium,
                              ),
                            );
                          } else if (snapshot.hasData) {
                            var articles = snapshot.data?.articles ?? [];
                            return ListView.separated(
                              padding: EdgeInsets.all(16),
                              itemBuilder: (context, index) =>
                                  ArticleCard(article: articles[index]),
                              separatorBuilder: (context, index) =>
                                  16.spaceVertical,
                              itemCount: articles.length,
                            );
                          }
                          {
                            return SizedBox();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ],
    );
  }
}
