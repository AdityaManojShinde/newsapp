import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/controller/api_service.dart';
import 'package:newsapp/controller/provider.dart';
import 'package:newsapp/models/news_article.dart';

class News {
  News();

  Future<void> fetchCategoryNews(WidgetRef ref, String category) async {
    final ApiService api = ApiService();
    try {
      // ignore: unused_local_variable
      var response = await api.getCategoryNews(category);
      if (response != int) {
        final List articles = response['articles'];
        for (var element in articles) {
          final title = element['title'];
          final des = element['description'];
          final imageUrl = element['urlToImage'];
          final content = element['content'];
          final author = element['author'];
          final url = element['url'];
          final NewsArticle article = NewsArticle(
            title: title,
            description: des,
            url: url,
            urlToImage: imageUrl,
            content: content,
            author: author,
          );
          ref
              .read(newsCategoryArticleProvider.notifier)
              .update((state) => state = [...state, article]);
          ref.read(isCategoryArticleLoading.notifier).update((state) => false);
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> fetchNews(WidgetRef ref) async {
    final ApiService api = ApiService();
    try {
      // ignore: unused_local_variable
      var response = await api.getNews();
      if (response != int) {
        final List articles = response['articles'];
        for (var element in articles) {
          final title = element['title'];
          final des = element['description'];
          final imageUrl = element['urlToImage'];
          final content = element['content'];
          final author = element['author'];
          final url = element['url'];
          final NewsArticle article = NewsArticle(
            title: title,
            description: des,
            url: url,
            urlToImage: imageUrl,
            content: content,
            author: author,
          );
          ref
              .read(newsArticleProvider.notifier)
              .update((state) => state = [...state, article]);
          ref.read(isNewsLoadingProvider.notifier).update((state) => false);
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> fetchTopHeadLines(WidgetRef ref) async {
    final ApiService api = ApiService();
    try {
      // ignore: unused_local_variable
      var response = await api.getTopHeadLines();
      if (response != int) {
        final List articles = response['articles'];
        for (var element in articles) {
          final title = element['title'];
          final des = element['description'];
          final imageUrl = element['urlToImage'];
          final content = element['content'];
          final author = element['author'];
          final url = element['url'];
          final NewsArticle article = NewsArticle(
            title: title,
            description: des,
            url: url,
            urlToImage: imageUrl,
            content: content,
            author: author,
          );
          ref
              .read(topHeadLinesProvider.notifier)
              .update((state) => state = [...state, article]);
        }
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
