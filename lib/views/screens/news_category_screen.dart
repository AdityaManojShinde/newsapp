// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/controller/news.dart';
import 'package:newsapp/controller/provider.dart';
import 'package:newsapp/views/screens/article_view_screen.dart';
import 'package:newsapp/views/widgets/news_list_item.dart';

class NewsCategoryScreen extends ConsumerStatefulWidget {
  const NewsCategoryScreen(
      {super.key, required this.title, required this.category});
  final String title;
  final String category;

  @override
  ConsumerState<NewsCategoryScreen> createState() => _NewsCategoryState();
}

class _NewsCategoryState extends ConsumerState<NewsCategoryScreen> {
  final news = News();
  @override
  void initState() {
    super.initState();
    news.fetchCategoryNews(ref, widget.category);
  }

  @override
  Widget build(BuildContext context) {
    final news = ref.watch(newsCategoryArticleProvider);
    final isLoading = ref.watch(isCategoryArticleLoading);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () async {
                ref
                    .read(newsCategoryArticleProvider.notifier)
                    .update((state) => []);
                final news = News();
                await news.fetchCategoryNews(ref, widget.category);
              },
              icon: const Icon(Icons.replay))
        ],
      ),
      body: news.isNotEmpty
          ? ListView.builder(
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
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
