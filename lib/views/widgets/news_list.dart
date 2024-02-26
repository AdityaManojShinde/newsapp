import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/controller/provider.dart';
import 'package:newsapp/views/screens/article_view_screen.dart';
import 'package:newsapp/views/widgets/news_list_item.dart';

class NewsListView extends ConsumerStatefulWidget {
  const NewsListView({super.key});

  @override
  ConsumerState<NewsListView> createState() => _NewsListViewState();
}

class _NewsListViewState extends ConsumerState<NewsListView> {
  @override
  Widget build(BuildContext context) {
    final news = ref.watch(newsArticleProvider);
    final isLoading = ref.watch(isNewsLoadingProvider);

    return ListView.builder(
      itemCount: isLoading ? 1 : news.length,
      itemBuilder: (context, index) => isLoading
          ? const ListTile(
              leading: CircularProgressIndicator(
                color: Colors.greenAccent,
              ),
              title: Text('Loading...'),
            )
          : GestureDetector(
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
    );
  }
}
