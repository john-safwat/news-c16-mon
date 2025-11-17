import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c16_mon/core/utils/context_extentions.dart';
import 'package:news_c16_mon/core/utils/padding_utils.dart';
import 'package:news_c16_mon/core/utils/white_space_utils.dart';
import 'package:news_c16_mon/data/models/category_dm.dart';
import 'package:news_c16_mon/ui/home/tabs/news_tab/news_contract.dart';
import 'package:news_c16_mon/ui/home/tabs/news_tab/news_tab_view_model.dart';
import 'package:news_c16_mon/ui/home/widgets/article_card.dart';

class NewsTab extends StatefulWidget {
  final CategoryDm categoryDm;

  const NewsTab({required this.categoryDm, super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  NewsTabViewModel viewModel = NewsTabViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.add(GetSources(widget.categoryDm.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: Column(
        children: [
          /// this consumer for sources
          BlocBuilder<NewsTabViewModel, NewsState>(
            builder: (_, state) {
              if (state.sourcesLoading) {
                return LinearProgressIndicator();
              } else if (state.sourcesErrorMessage != null) {
                return Center(
                  child: Text(
                    state.sourcesErrorMessage ?? "",
                    style: context.textTheme.labelMedium,
                  ),
                );
              } else {
                return DefaultTabController(
                  length: state.sources.length,
                  child: TabBar(
                    onTap: (index) {
                      viewModel.add(LoadArticles(state.sources[index]));
                    },
                    dividerHeight: 0,
                    tabAlignment: TabAlignment.start,
                    padding: EdgeInsets.all(0),
                    indicatorPadding: EdgeInsets.all(0),
                    isScrollable: true,
                    tabs:
                        state.sources
                            .map(
                              (sources) => Text(
                                sources.name ?? "asdad",
                              ).withVerticalPadding(8),
                            )
                            .toList(),
                  ),
                );
              }
            },
          ),

          /// this Consumer for Articles
          Expanded(
            child: BlocBuilder<NewsTabViewModel, NewsState>(
              builder: (_, state) {
                if (state.sources.isEmpty) return SizedBox();
                if (state.articlesLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state.articlesErrorMessage != null) {
                  return Center(
                    child: Text(
                      state.articlesErrorMessage ?? "",
                      style: context.textTheme.labelMedium,
                    ),
                  );
                } else if (state.articles.isEmpty) {
                  return Center(
                    child: Text(
                      "No Articles",
                      style: context.textTheme.labelMedium,
                    ),
                  );
                } else {
                  return ListView.separated(
                    padding: EdgeInsets.all(16),
                    itemBuilder:
                        (context, index) =>
                            ArticleCard(article: state.articles[index]),
                    separatorBuilder: (context, index) => 16.spaceVertical,
                    itemCount: state.articles.length,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
