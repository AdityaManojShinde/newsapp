import 'package:flutter/material.dart';
import 'package:newsapp/models/news_article.dart';
import 'package:newsapp/views/screens/article_view_screen.dart';
import 'package:newsapp/views/widgets/news_list_item.dart';

class HeadLinesScreen extends StatelessWidget {
  const HeadLinesScreen({super.key, required this.news, required this.title});
  final List<NewsArticle> news;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            if (news.isNotEmpty) {
              final article = news[index];
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ArticleViewScreen(article: article)));
            }
          },
          child: NewsListItem(
            article: news[index],
          ),
        ),
      ),
    );
  }
}
