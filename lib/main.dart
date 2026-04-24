import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/article_provider.dart';
import 'presentation/views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ArticleProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: HomePage(),
      ),
    );
  }
}
