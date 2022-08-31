import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../models/NewsResponse.dart';
import '../../shared/network/remote/api_manager.dart';
import '../news/news_item.dart';

class NewsSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {

          showResults(context);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon:  Icon(Icons.clear,color: Colors.black,),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
            fit: BoxFit.cover,
          )),
      child: FutureBuilder<NewsResponse>(
          future: ApiManager.getNews(searchKeyword: query),
          builder: (_, snapShot) {
            if (snapShot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapShot.hasError) {
              return Container(
                  decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage('assets/images/pattern.png'),
                fit: BoxFit.cover,
                )),
                child: Column(
                  children: [
                    Center(child: Text('Something went wrong')),
                    ElevatedButton(onPressed: () {
                      Navigator.pop(context);
                      showSearch(context: context, delegate: NewsSearch());
                    }, child: Text('Try Again')),
                  ],
                ),
              );
            }
            if ("ok" != snapShot.data?.status) {
              // error
              return Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/pattern.png'),
                      fit: BoxFit.cover,
                    )),
                child: Column(
                  children: [
                    Center(child: Text('Something went wrong')),
                    ElevatedButton(onPressed: () {
                      Navigator.pop(context);
                      showSearch(context: context, delegate: NewsSearch());
                    }, child: Text('Try Again')),
                  ],
                ),
              );
            }

            var newsList = snapShot.data?.articles ?? [];
            return ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (c, index) {
                  return NewsItem(newsList[index]);
                  // return Text(newsList[index].title ?? "");
                });
          }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
              image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover,
              )));

  }

}
