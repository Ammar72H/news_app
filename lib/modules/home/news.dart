import 'package:flutter/material.dart';
import 'package:news/shared/network/remote/api_manager.dart';

import '../../models/NewsResponse.dart';
import '../../models/SourcesResponse.dart';

class NewsData extends StatelessWidget {

  Sources newsSource;
  NewsData(this.newsSource);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNews(newsSource),
        builder: (c,snapShot){
          if (snapShot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snapShot.hasError){
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(onPressed: (){}, child:Text('try again ')),
              ],
            );
          }
          if("ok"!= snapShot.data?.status){
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(onPressed: (){}, child:Text('try again ')),
              ],
            );
          }


          var newsList=snapShot.data?.articles??[];
          return ListView.builder(
              itemCount: newsList.length,
              itemBuilder: (c,index){
                return Text (newsList[index].title??"");
          });
        });
  }
}
