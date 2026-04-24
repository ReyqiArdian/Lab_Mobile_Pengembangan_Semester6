import 'package:flutter/material.dart';
import 'article_card.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final List articles;

  const SectionWidget({required this.title, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: articles.length,
            itemBuilder: (_, index) {
              return ArticleCard(article: articles[index]);
            },
          ),
        ),
      ],
    );
  }
}
