import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/controller/provider.dart';
import 'package:newsapp/models/category.dart';
import 'package:newsapp/views/screens/news_category_screen.dart';
import 'package:newsapp/views/widgets/news_category_item.dart';

class NewsCategoryRow extends ConsumerWidget {
  const NewsCategoryRow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    final List<NewsCategory> newsCategory = ref.read(newsCategoryProvider);
    // ignore: unused_local_variable
    final newsCategoryArticle = ref.watch(newsCategoryArticleProvider);
    // ignore: unused_local_variable
    final bool isLoading = ref.watch(isCategoryArticleLoading);
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: newsCategory.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          ref.read(newsCategoryArticleProvider.notifier).update((state) => []);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NewsCategoryScreen(
                  title: newsCategory[index].title,
                  category: newsCategory[index].id),
            ),
          );
        },
        child: CategoryItem(
          title: newsCategory[index].title,
        ),
      ),
    );
  }
}
