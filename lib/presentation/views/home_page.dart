import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/article_provider.dart';
import '../widgets/search_bar.dart';
import '../widgets/section_widget.dart';
import '../widgets/error_widget.dart';
import '../widgets/loading_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () =>
          Provider.of<ArticleProvider>(context, listen: false).fetchArticles(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ArticleProvider>(context);

    // loading
    if (provider.isLoading) {
      return Scaffold(body: LoadingWidget());
    }

    // error
    if (provider.error.isNotEmpty) {
      return Scaffold(body: ErrorMessage(message: provider.error));
    }

    return Scaffold(
      appBar: AppBar(title: Text("Reyqi news banget 🎬")),
      body: ListView(
        children: [
          SearchBarWidget(),

          // 🔥 SAFE BANNER (ANTI ERROR)
          provider.filteredArticles.isEmpty
              ? Container(
                  height: 200,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Pencarian tidak ditemukan",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              : Container(
                  height: 200,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                          provider.filteredArticles[0].image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

          if (provider.filteredArticles.isNotEmpty) ...[
            SectionWidget(
              title: "Trending ",
              articles: provider.filteredArticles,
            ),
            SectionWidget(
              title: "Latest 🆕",
              articles: provider.filteredArticles.reversed.toList(),
            ),
          ] else
            Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: Text(
                  "tidak menemukan pencarian 😢",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}