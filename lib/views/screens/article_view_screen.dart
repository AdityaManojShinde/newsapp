import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/news_article.dart';

class ArticleViewScreen extends StatelessWidget {
  const ArticleViewScreen({super.key, required this.article});
  final NewsArticle article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      key: UniqueKey(),
                      height: 300,
                      fit: BoxFit.cover,
                      imageUrl: article.urlToImage ??
                          'https://th.bing.com/th/id/OIP.hMlLJSmMJky9Rd1JwB86VgHaFl?rs=1&pid=ImgDetMain',
                      placeholder: (context, url) =>
                          const Center(child: Text('Loading...')),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                    Container(
                      height: 250,
                      padding: const EdgeInsets.only(left: 10),
                      margin: const EdgeInsets.only(top: 150),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            // change this to dynamic api text
                            article.title ?? 'something went wrong',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
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
              const SizedBox(
                height: 20,
              ),
              Text(
                article.description ?? 'desciption not found.',
                softWrap: true,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                article.content ?? 'No content found.',
                softWrap: true,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'author : ${article.author ?? "unknown"}',
                softWrap: true,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ],
          )),
    );
  }
}
