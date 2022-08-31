import 'package:flutter/material.dart';
import 'package:news/models/NewsResponse.dart';
import 'package:news/models/SourcesResponse.dart';
import 'package:news/modules/news/news_item.dart';
import 'package:news/shared/network/remote/api_manager.dart';

class NewsData extends StatelessWidget {
  Sources newsSource;

  NewsData(this.newsSource);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(sourceId :newsSource.id?? ""),
        builder: (_, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapShot.hasError) {
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(onPressed: () {}, child: Text('Try Again')),
              ],
            );
          }
          if ("ok" != snapShot.data?.status) {
            // error
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(onPressed: () {}, child: Text('Try Again')),
              ],
            );
          }

          var newsList = snapShot.data?.articles ?? [];
          return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (c, index) {
                return NewsItem(newsList[index]);
                // return Text(newsList[index].title ?? "");
              });
        });
  }
}
