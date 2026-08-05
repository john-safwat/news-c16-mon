import 'package:flutter/material.dart';
import 'package:news_c16_mon/core/utils/context_extentions.dart';
import 'package:news_c16_mon/core/utils/white_space_utils.dart';
import 'package:news_c16_mon/data/models/category_dm.dart';
import 'package:news_c16_mon/ui/home/widgets/category_card.dart';

class HomeTab extends StatelessWidget {
  final Function(CategoryDm) onCardPress;
  const HomeTab({required this.onCardPress ,super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text(
          context.locale.homeGreetingMessage,
          style: context.textTheme.titleLarge,
        ),
        16.spaceVertical,
        for (CategoryDm category in categories)
          Column(
            children: [
              CategoryCard(category: category, onPress: onCardPress,),
              16.spaceVertical
            ],
          )
      ],
    );
  }
}
