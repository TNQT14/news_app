import 'dart:convert';

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
}