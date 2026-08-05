import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c16_mon/core/utils/context_extentions.dart';
import 'package:news_c16_mon/ui/home/home_contract.dart';
import 'package:news_c16_mon/ui/home/home_view_model.dart';
import 'package:news_c16_mon/ui/home/tabs/home_tab.dart';
import 'package:news_c16_mon/ui/home/tabs/news_tab/news_tab.dart';
import 'package:news_c16_mon/ui/home/widgets/news_drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.add(SetupHomeScreenAction());
    viewModel.navigation.listen((navigation) {
      switch (navigation) {
        case CloseDrawer():
          {
            Navigator.pop(context);
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<HomeViewModel, HomeState>(
        builder: (context, state) {
          return Scaffold(
            drawer: NewsDrawerWidget(
              goToHome: () {
                viewModel.add(GoToHomeTab());
              },
            ),
            appBar: AppBar(
              title: Text(
                state.category == null
                    ? context.locale.home
                    : context.appConfigProvider.isEn
                    ? state.category?.nameEn ?? ""
                    : state.category?.nameAr ?? "",
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
            body:
                state.category == null
                    ? HomeTab(
                      onCardPress: (categoryDm) {
                        viewModel.add(ChangeTabAction(categoryDm));
                      },
                    )
                    : NewsTab(categoryDm: state.category!),
          );
        },
      ),
    );

    // return StreamBuilder(
    //   stream: viewModel.data,
    //   builder:
    //       (context, snapshot) => Scaffold(
    //         drawer: NewsDrawerWidget(goToHome:(){
    //           viewModel.doAction(GoToHomeTab());
    //         }),
    //         appBar: AppBar(
    //           title: Text(
    //             snapshot.data?.category == null
    //                 ? context.locale.home
    //                 : context.appConfigProvider.isEn
    //                 ? snapshot.data?.category?.nameEn ?? ""
    //                 : snapshot.data?.category?.nameAr ?? "",
    //           ),
    //           actions: [
    //             IconButton(
    //               onPressed: () {
    //                 // todo navigate to search screen
    //               },
    //               icon: Icon(Icons.search),
    //             ),
    //           ],
    //         ),
    //         body:
    //             snapshot.data?.category == null
    //                 ? HomeTab(
    //                   onCardPress: (categoryDm) {
    //                     viewModel.doAction(ChangeTabAction(categoryDm));
    //                   },
    //                 )
    //                 : NewsTab(categoryDm: snapshot.data!.category!),
    //       ),
    // );
  }

  @override
  void pop() {
    Navigator.pop(context);
  }

  @override
  HomeViewModel getViewModel() => HomeViewModel();
}
