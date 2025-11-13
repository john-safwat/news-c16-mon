import 'package:flutter/material.dart';
import 'package:news_c16_mon/core/utils/context_extentions.dart';
import 'package:news_c16_mon/ui/home/home_navigator.dart';
import 'package:news_c16_mon/ui/home/home_view_model.dart';
import 'package:news_c16_mon/ui/home/tabs/home_tab.dart';
import 'package:news_c16_mon/ui/home/tabs/news_tab/news_tab.dart';
import 'package:news_c16_mon/ui/home/widgets/news_drawer_widget.dart';
import 'package:provider/provider.dart';

import '../../core/base/base_view.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseView<HomeScreen, HomeViewModel>
    implements HomeNavigator {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<HomeViewModel>(
        builder: (context, _, _) => Scaffold(
          drawer: NewsDrawerWidget(goToHome: viewModel.goToHomeTab),
          appBar: AppBar(
            title: Text(
              viewModel.selectedCategory == null
                  ? context.locale.home
                  : context.appConfigProvider.isEn
                  ? viewModel.selectedCategory!.nameEn
                  : viewModel.selectedCategory!.nameAr,
            ),
            actions: [
              IconButton(
                onPressed: () {
                  // todo navigate to search screen
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
          body: viewModel.selectedCategory == null
              ? HomeTab(onCardPress: viewModel.onCategoryCardPress)
              : NewsTab(categoryDm: viewModel.selectedCategory!),
        ),
      ),
    );
  }

  @override
  void pop() {
    Navigator.pop(context);
  }

  @override
  HomeViewModel getViewModel() => HomeViewModel();
}
