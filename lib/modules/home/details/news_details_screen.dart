import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../models/NewsResponse.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String routeName='news_details';

  @override
  Widget build(BuildContext context) {
    var articles = ModalRoute.of(context)!.settings.arguments as Articles;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF39A552),
        toolbarHeight: 90,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
        ),
        iconTheme: Theme.of(context).iconTheme,
        centerTitle: true,
        title: Text('News Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(articles.urlToImage  ?? "",height: 180,fit: BoxFit.cover,),
              SizedBox(height: 10,),
              Text(articles.author??"",style: Theme.of(context).textTheme.subtitle1,),
              SizedBox(height: 5,),
              Text(articles.title??"",style: Theme.of(context).textTheme.headline1,),
              SizedBox(height: 5,),
              Text(articles.publishedAt??"",textAlign: TextAlign.right,style: Theme.of(context).textTheme.headline2,),
              SizedBox(height: 20),
              SizedBox(height: 20,),
              Text(articles.content?? ""),
              SizedBox(height: 20,),
              TextButton(onPressed: (){
                openUrl(articles.url);
              },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                children: [
                Text('View Full Article',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,size: 16,)],))
            ],

          ),
        ),
      ),
    );
  }
  openUrl(String? url)async{
    if(url == null){
      return;
    }
    var uri = Uri.parse(url);
    if(await canLaunchUrl(uri)){
     await launchUrl(uri);
    }
  }
}
