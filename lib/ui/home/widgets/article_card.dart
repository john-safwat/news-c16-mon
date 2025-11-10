import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_c16_mon/core/utils/context_extentions.dart';
import 'package:news_c16_mon/core/utils/white_space_utils.dart';
import 'package:news_c16_mon/models/articles_response.dart';

class ArticleCard extends StatelessWidget {
  final Articles article;

  const ArticleCard({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: context.colors.primary),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: CachedNetworkImage(
              imageUrl: article.urlToImage ?? "",
              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
              imageBuilder: (context, imageProvider) => Image(
                image: imageProvider,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          16.spaceVertical,
          Text(article.title ??"" , style: context.textTheme.labelMedium,),
          16.spaceVertical,
          Row(
            children: [
              Expanded(child: Text(article.author?? "" , style: context.textTheme.bodySmall,)),

              Text(article.publishedAt ??"" , style: context.textTheme.bodySmall,),
            ],
          )
        ],
      ),
    );
  }
}
