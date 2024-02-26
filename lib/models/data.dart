import 'package:flutter/material.dart';
import 'package:newsapp/models/assets.dart';
import 'package:newsapp/models/category.dart';
import 'package:newsapp/models/slide.dart';

final List<NewsCategory> newsCategoryData = [
  NewsCategory(
    title: "Entertainment",
    id: 'entertainment',
  ),
  NewsCategory(
    title: "Science",
    id: 'science',
  ),
  NewsCategory(
    title: "Health",
    id: 'health',
  ),
  NewsCategory(
    title: "Technology",
    id: 'technology',
  ),
  NewsCategory(
    title: "World",
    id: 'global',
  ),
  NewsCategory(
    title: "Business",
    id: 'business',
  ),
  NewsCategory(
    title: "Sports",
    id: 'sports',
  ),
  NewsCategory(
    title: "Politics",
    id: 'business',
  ),
];

final List<Slide> carouselSliderData = [
  Slide(
    title: "Entertainment",
    image: Image.asset(
      Assets.imagePath['entertainment']!,
      fit: BoxFit.cover,
    ),
  ),
  Slide(
    title: "Science",
    image: Image.asset(
      Assets.imagePath['science']!,
      fit: BoxFit.cover,
    ),
  ),
  Slide(
    title: "Health",
    image: Image.asset(
      Assets.imagePath['health']!,
      fit: BoxFit.cover,
    ),
  ),
  Slide(
    title: "Technology",
    image: Image.asset(
      Assets.imagePath['tech']!,
      fit: BoxFit.cover,
    ),
  ),
  Slide(
    title: "World",
    image: Image.asset(
      Assets.imagePath['world']!,
      fit: BoxFit.cover,
    ),
  ),
  Slide(
    title: "Business",
    image: Image.asset(
      Assets.imagePath['business']!,
      fit: BoxFit.cover,
    ),
  ),
  Slide(
    title: "Lifestyle",
    image: Image.asset(
      Assets.imagePath['lifestyle']!,
      fit: BoxFit.cover,
    ),
  ),
  Slide(
    title: "Sports",
    image: Image.asset(
      Assets.imagePath['sports']!,
      fit: BoxFit.cover,
    ),
  ),
  Slide(
    title: "Politics",
    image: Image.asset(
      Assets.imagePath['business']!,
      fit: BoxFit.cover,
    ),
  ),
];
