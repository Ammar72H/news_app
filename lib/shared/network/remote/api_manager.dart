import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/NewsResponse.dart';
import 'package:news/models/SourcesResponse.dart';

import '../../components/constant.dart';

class ApiManager{

  static Future<SourcesResponse> getSources()async{
  //  call Api

    var uri =Uri.https(BASEURL, '/v2/top-headlines/sources',
    { "apiKey":APIKEY });
    
     var response = await http.get(uri);

     try{
       var bodeString = response.body;
       var json = jsonDecode(bodeString);
       var sourcesResponse = SourcesResponse.fromJson(json);
       return sourcesResponse;

     }catch(e){
       throw e;
     }



  }

  static Future<NewsResponse> getNews(Sources sources)async{
    var uri =Uri.https(BASEURL, 'v2/everything',  { "apiKey":APIKEY ,"sources":sources.id});
    var response = await http.get(uri);
    try{
      var bodeString = response.body;
      var json = jsonDecode(bodeString);
      var newsResponse = NewsResponse.fromJson(json);
      return newsResponse;

    }catch(e){
      throw e;
    }

  }

}