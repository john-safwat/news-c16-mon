import 'package:flutter/material.dart';
import 'package:news_c16_mon/core/base/base_navigator.dart';

class BaseViewModel<N extends BaseNavigator> extends ChangeNotifier{
  N? navigator;

}