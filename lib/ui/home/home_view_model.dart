import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:news_c16_mon/ui/home/home_contract.dart';

class HomeViewModel extends Bloc<HomeActions, HomeState> {
  HomeViewModel() : super(HomeState()) {
    on<SetupHomeScreenAction>(_setup);
    on<ChangeTabAction>(_changeTab);
    on<GoToHomeTab>(_goToHomeTab);
  }

  final StreamController<HomeScreenNavigation> navigationStream =
      StreamController.broadcast();
  late final Stream<HomeScreenNavigation> navigation = navigationStream.stream;

  void _setup(SetupHomeScreenAction action, Emitter emitter) {
    emitter(state.copyWith(category: null, appBarTitle: ""));
  }

  Future<void> _changeTab(ChangeTabAction action, Emitter emitter) async {
    emitter(
      state.copyWith(
        category: action.category,
        appBarTitle: action.category.nameEn,
      ),
    );
  }

  void _goToHomeTab(GoToHomeTab action, Emitter emitter) {
    emitter(HomeState());
    navigationStream.add(CloseDrawer());
  }
}
