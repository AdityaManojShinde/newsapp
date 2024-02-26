import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/models/category.dart';
import 'package:newsapp/models/data.dart';
import 'package:newsapp/models/news_article.dart';

final newsCategoryProvider =
    StateProvider<List<NewsCategory>>((ref) => newsCategoryData);

final carouselDataProvider = StateProvider((ref) => carouselSliderData);

final sliderIndexProvider = StateProvider<int>((ref) => 0);

final isNewsLoadingProvider = StateProvider<bool>((ref) => true);
final isCategoryArticleLoading = StateProvider<bool>((ref) => true);
final themeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.system);

final newsArticleProvider = StateProvider<List<NewsArticle>>((ref) => []);
final topHeadLinesProvider = StateProvider<List<NewsArticle>>((ref) => []);
final newsCategoryArticleProvider =
    StateProvider<List<NewsArticle>>((ref) => []);
