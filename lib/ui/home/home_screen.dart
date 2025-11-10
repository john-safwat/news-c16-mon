import 'package:flutter/material.dart';
import 'package:news_c16_mon/core/utils/context_extentions.dart';
import 'package:news_c16_mon/models/category_dm.dart';
import 'package:news_c16_mon/ui/home/tabs/home_tab.dart';
import 'package:news_c16_mon/ui/home/tabs/news_tab.dart';
import 'package:news_c16_mon/ui/home/widgets/news_drawer_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryDm? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NewsDrawerWidget(goToHome: goToHomeTab),
      appBar: AppBar(
        title: Text(
          selectedCategory == null
              ? context.locale.home
              : context.appConfigProvider.isEn
              ? selectedCategory!.nameEn
              : selectedCategory!.nameAr,
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
      body: selectedCategory == null
          ? HomeTab(onCardPress: onCategoryCardPress)
          : NewsTab(categoryDm: selectedCategory!),
    );
  }

  goToHomeTab() {
    setState(() {
      selectedCategory = null;
    });
    Navigator.pop(context);
  }

  onCategoryCardPress(category) {
    setState(() {
      selectedCategory = category;
    });
  }
}
