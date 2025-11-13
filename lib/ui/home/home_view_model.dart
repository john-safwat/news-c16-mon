import 'package:flutter/material.dart';
import 'package:news_c16_mon/core/base/base_view_model.dart';
import 'package:news_c16_mon/models/category_dm.dart';
import 'package:news_c16_mon/ui/home/home_navigator.dart';

class HomeViewModel extends BaseViewModel<HomeNavigator> {
  CategoryDm? selectedCategory;

  onCategoryCardPress(category) {
    selectedCategory = category;
    notifyListeners();
  }

  goToHomeTab() {
    selectedCategory = null;
    navigator?.pop();
    notifyListeners();
  }
}
