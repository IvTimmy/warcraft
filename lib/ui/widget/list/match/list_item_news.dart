import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:warcraft/models/news_model.dart';
import 'package:warcraft/ui/widget/list/list_item_builder.dart';

class NewsItem extends ListItemBuilder {
  NewsInfo news;

  NewsItem({required this.news});

  @override
  Widget buildItem(BuildContext context, int index) {
    return Container(
      padding: const EdgeInsets.only(
        left: 4,
        top: 8,
        bottom: 8,
      ),
      child: Column(
        children: [
          Text(news.title),
          Text(news.time),
          Html(data: news.subTitle),
          Image(image: NetworkImage(news.imageUrl)),
        ],
      ),
    );
  }
}
