import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/controller/news.dart';
import 'package:newsapp/controller/provider.dart';
import 'package:newsapp/views/screens/settings.dart';
import 'package:newsapp/views/screens/topheadlines_screen.dart';
import 'package:newsapp/views/widgets/carosel_slider.dart';
import 'package:newsapp/views/widgets/news_category.dart';
import 'package:newsapp/views/widgets/news_list.dart';
import 'package:newsapp/views/widgets/title.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
    final news = News();
    news.fetchNews(ref);
    news.fetchTopHeadLines(ref);
  }

  @override
  Widget build(BuildContext context) {
    final news = ref.watch(newsArticleProvider);
    final headLines = ref.watch(topHeadLinesProvider);

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: AppTitle()),
            ListTile(
              onTap: () {
                if (headLines.isNotEmpty) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HeadLinesScreen(
                          title: 'Top HeadLines', news: headLines)));
                }
              },
              title: const Text('Top HeadLines'),
            ),
            Container(
              height: 1,
              color: Colors.grey.withOpacity(0.5),
            ),
            ListTile(
              onTap: () {
                if (news.isNotEmpty) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          HeadLinesScreen(title: 'Trending News', news: news)));
                }
              },
              title: const Text('Trending News'),
            ),
            Container(
              height: 1,
              color: Colors.grey.withOpacity(0.5),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ));
              },
              title: const Text('Settings'),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const AppTitle(),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {
                ref.read(newsArticleProvider.notifier).update((state) => []);
                ref.read(topHeadLinesProvider.notifier).update((state) => []);
                final news = News();
                news.fetchNews(ref);
                news.fetchTopHeadLines(ref);
              },
              icon: const Icon(Icons.replay_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
                //margin: const EdgeInsets.all(5),
                height: 40,
                child: const NewsCategoryRow()),
            const SizedBox(
              height: 20,
            ),
            const Carousel(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Trending News',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Spacer(),
                GestureDetector(
                    onTap: () {
                      if (news.isNotEmpty) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HeadLinesScreen(
                                title: 'Trending News', news: news)));
                      }
                    },
                    child: Text(
                      'view all',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.blue,
                          ),
                    ))
              ],
            ),
            const SizedBox(
              height: 600,
              width: double.infinity,
              child: NewsListView(),
            ),
          ],
        ),
      ),
    );
  }
}
