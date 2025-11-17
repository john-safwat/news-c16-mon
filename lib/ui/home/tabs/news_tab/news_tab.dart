import 'package:flutter/material.dart';
import 'package:news_c16_mon/core/base/base_view.dart';
import 'package:news_c16_mon/core/utils/context_extentions.dart';
import 'package:news_c16_mon/core/utils/padding_utils.dart';
import 'package:news_c16_mon/core/utils/white_space_utils.dart';
import 'package:news_c16_mon/data/models/category_dm.dart';
import 'package:news_c16_mon/ui/home/tabs/news_tab/news_tab_view_model.dart';
import 'package:news_c16_mon/ui/home/widgets/article_card.dart';
import 'package:provider/provider.dart';

class NewsTab extends StatefulWidget {
  final CategoryDm categoryDm;

  const NewsTab({required this.categoryDm, super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends BaseView<NewsTab , NewsTabViewModel> {
  @override
  void initState() {
    super.initState();
    viewModel.loadSources(widget.categoryDm.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Column(
        children: [
          /// this consumer for sources
          Consumer<NewsTabViewModel>(
            builder: (_, _, _) {
              if (viewModel.sourcesLoading) {
                return LinearProgressIndicator();
              } else if (viewModel.sourcesErrorMessage != null) {
                return Center(
                  child: Text(
                    viewModel.sourcesErrorMessage ?? "",
                    style: context.textTheme.labelMedium,
                  ),
                );
              } else {
                return DefaultTabController(
                  length: viewModel.sources.length,
                  child: TabBar(
                    onTap: (index) {
                      viewModel.loadArticles(viewModel.sources[index]);
                    },
                    dividerHeight: 0,
                    tabAlignment: TabAlignment.start,
                    padding: EdgeInsets.all(0),
                    indicatorPadding: EdgeInsets.all(0),
                    isScrollable: true,
                    tabs: viewModel.sources
                        .map(
                          (sources) =>
                              Text(sources.name ?? "").withVerticalPadding(8),
                        )
                        .toList(),
                  ),
                );
              }
            },
          ),

          /// this Consumer for Articles
          Expanded(
            child: Consumer<NewsTabViewModel>(
              builder: (_, _, _) {
                if (viewModel.sources.isEmpty) return SizedBox();
                if (viewModel.articlesLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (viewModel.articlesErrorMessage != null) {
                  return Center(
                    child: Text(
                      viewModel.articlesErrorMessage ?? "",
                      style: context.textTheme.labelMedium,
                    ),
                  );
                } else if (viewModel.articles.isEmpty) {
                  return Center(
                    child: Text(
                      "No Articles",
                      style: context.textTheme.labelMedium,
                    ),
                  );
                } else {
                  return ListView.separated(
                    padding: EdgeInsets.all(16),
                    itemBuilder: (context, index) =>
                        ArticleCard(article: viewModel.articles[index]),
                    separatorBuilder: (context, index) => 16.spaceVertical,
                    itemCount: viewModel.articles.length,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  NewsTabViewModel getViewModel() => NewsTabViewModel();
}
