
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/NewsResponse.dart';
import 'package:news/models/SourcesResponse.dart';

import '../../components/constant.dart';

class ApiManager{


  static Future<SourcesResponse> getSources(String categoriID) async{
    // call api
    var uri =Uri.https(BASEURL, '/v2/top-headlines/sources',{"apikey":APIKEY ,
      'category':categoriID});
    var response =  await http.get(uri);
    try{
      var bodyString=   response.body;
      var json = jsonDecode(bodyString);
      var sourcesResponse=SourcesResponse.fromJson(json);
      return sourcesResponse;
    }catch(e){
      throw e;
    }
  }


  static Future<NewsResponse> getNews({String ?sourceId, String ?searchKeyword})async{
    var uri =Uri.https(BASEURL, '/v2/everything',{"apikey":APIKEY,"sources":sourceId , 'q':searchKeyword});
    var response =  await http.get(uri);
    try{
      var bodyString=   response.body;
      var json = jsonDecode(bodyString);
      var newsResponse=NewsResponse.fromJson(json);
      return newsResponse;
    }catch(e){
      throw e;
    }
  }

}