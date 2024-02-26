import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/controller/provider.dart';
import 'package:newsapp/views/screens/article_view_screen.dart';
import 'package:newsapp/views/screens/topheadlines_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Carousel extends ConsumerWidget {
  const Carousel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final headLines = ref.watch(topHeadLinesProvider);
    // ignore: unused_local_variable
    final sliderIndex = ref.watch(sliderIndexProvider);
    // dummy data
    final data = ref.read(carouselDataProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Headlines',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                width: 50,
              ),
              GestureDetector(
                  onTap: () {
                    if (headLines.isNotEmpty) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HeadLinesScreen(
                              title: 'Top HeadLines', news: headLines)));
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
        ),
        CarouselSlider.builder(
          itemCount: headLines.isEmpty ? data.length : 10,
          // ignore: sized_box_for_whitespace
          itemBuilder: (context, index, nextIndex) => GestureDetector(
            onTap: () {
              if (headLines.isNotEmpty) {
                // ignore: unused_local_variable
                var article = headLines[index];
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ArticleViewScreen(article: article)));
              }
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              width: MediaQuery.of(context).size.width,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    // change this to network image
                    child: headLines.isEmpty
                        ? data[index].image
                        : headLines[index].urlToImage != null
                            ? CachedNetworkImage(
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                                imageUrl: headLines[index].urlToImage!,
                                placeholder: (context, url) =>
                                    const Center(child: Text('Loading...')),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              )
                            : const Icon(Icons.error),
                  ),
                  Container(
                    height: 250,
                    padding: const EdgeInsets.only(left: 10),
                    margin: const EdgeInsets.only(top: 150),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          // change this to dynamic api text
                          headLines.isEmpty
                              ? 'Loading...'
                              : headLines[index].title ??
                                  'something went wrong',
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 3,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              ref.read(sliderIndexProvider.notifier).update((state) => index);
            },
            height: 250,
            enlargeCenterPage: true,
            autoPlay: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: AnimatedSmoothIndicator(
            activeIndex: sliderIndex,
            // change the count here to api call count
            count: headLines.isEmpty ? data.length : 10,
            effect: const WormEffect(activeDotColor: Colors.greenAccent),
          ),
        )
      ],
    );
  }
}
