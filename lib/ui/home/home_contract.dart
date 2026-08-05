import 'package:news_c16_mon/data/models/category_dm.dart';

sealed class HomeActions {
  const HomeActions();
}

class ChangeTabAction extends HomeActions {
  final CategoryDm category;

  const ChangeTabAction(this.category);
}

class SetupHomeScreenAction extends HomeActions {}

class GoToHomeTab extends HomeActions {}

class HomeState {
  final CategoryDm? category;
  final String appBarTitle;

  HomeState({this.category, this.appBarTitle = ""});

  HomeState copyWith({CategoryDm? category, String? appBarTitle}) {
    return HomeState(
      category: category ?? this.category,
      appBarTitle: appBarTitle ?? this.appBarTitle,
    );
  }
}

sealed class HomeScreenNavigation {}

class CloseDrawer extends HomeScreenNavigation{}
