import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/article_provider.dart';

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextField(
        onChanged: (value) {
          Provider.of<ArticleProvider>(context, listen: false).search(value);
        },
        decoration: InputDecoration(
          hintText: "Search...",
          prefixIcon: Icon(Icons.search),
          filled: true,
          fillColor: Colors.grey[900],
        ),
      ),
    );
  }
}
