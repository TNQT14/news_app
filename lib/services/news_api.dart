import 'dart:convert';
import 'dart:developer';

import 'package:news_app/consts/http_exceptions.dart';
import 'package:news_app/models/news_model.dart';
import 'package:http/http.dart' as http;
import '../consts/api_consts.dart';

class NewsAPIService{
  static Future<List<NewsModel>> getAllNews({required String sortBy}) async{
    try{
      var uri = Uri.https(BASEURL, 'v2/everything', {
        "q":"tesla",
        "domains":"nypost.com",
        "sortBy":sortBy,
      });
      var response = await http.get(uri,headers :{"X-Api-key": API_KEY});
      Map data = jsonDecode(response.body);
      List newTempList = [];
      if(data['code']!= null)
        {
          throw HttpException(data['code']);
        }

      for(var v in data["articles"]){
        newTempList.add(v);
      }
      return NewsModel.newsFromSnapshot(newTempList);
    }catch(e){
      throw e.toString();
    }
  }

  static Future<List<NewsModel>> getTopHeadLine() async{
    try{
      var uri = Uri.https(BASEURL, "v2/top-headlines", {
        'country':'us',
      });
      var response = await http.get(uri,headers :{"X-Api-key": API_KEY});
      List newTempList = [];
      Map data = jsonDecode(response.body);
      if(data['code']!= null)
      {
        throw HttpException(data['code']);
      }
      log('Response status: ${response.statusCode}');
      // log("Response status code: $")

      for(var v in data["articles"]){
        newTempList.add(v);
      }

      return NewsModel.newsFromSnapshot(newTempList);
    }catch(e){
      throw e.toString();
    }
  }

}