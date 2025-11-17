import 'package:flutter/material.dart';
import 'package:news_c16_mon/core/theme/app_colors.dart';
import 'package:news_c16_mon/core/utils/context_extentions.dart';
import 'package:news_c16_mon/core/utils/padding_utils.dart';
import 'package:news_c16_mon/data/models/category_dm.dart';

class CategoryCard extends StatelessWidget {
  final CategoryDm category;
  final Function(CategoryDm) onPress;

  const CategoryCard({
    required this.category,
    required this.onPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress(category);
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: Image.asset(
              context.appConfigProvider.isDarkMode
                  ? category.imageLightPath
                  : category.imageDarkPath,
            ),
          ),
          Positioned.fill(
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Column(
                crossAxisAlignment: category.isRTL
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.appConfigProvider.isEn
                        ? category.nameEn
                        : category.nameAr,
                    style: context.textTheme.headlineMedium!.copyWith(
                      color: context.colors.surface,
                      fontWeight: FontWeight.bold,
                    ),
                  ).withVerticalPadding(16),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.gray,
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    child: Directionality(
                      textDirection: category.isRTL
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(context.locale.viewAll).withHorizontalPadding(16),
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: context.colors.surface,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ).withPadding(16),
            ),
          ),
        ],
      ),
    );
  }
}
