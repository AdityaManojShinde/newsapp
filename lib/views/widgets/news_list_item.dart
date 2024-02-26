import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/models/news_article.dart';

/*
1. image should be rendered using the internet
2. news title and sub title should be fetched from api

*/

class NewsListItem extends StatelessWidget {
  const NewsListItem({super.key, required this.article});
  final NewsArticle article;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                  imageUrl: article.urlToImage ??
                      'https://th.bing.com/th/id/OIP.hMlLJSmMJky9Rd1JwB86VgHaFl?rs=1&pid=ImgDetMain',
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const Center(child: Text('Loading...')),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ListTile(
              title: article.title != null
                  ? Text(
                      article.title!,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                      softWrap: true,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    )
                  : const Icon(Icons.error),
              subtitle: article.description != null
                  ? Text(
                      article.description!,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
                  : const Icon(Icons.error),
            ),
          ),
        ],
      ),
    );
  }
}
