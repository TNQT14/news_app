import 'package:flutter/cupertino.dart';
import 'package:news_app/services/news_api.dart';

import '../models/news_model.dart';

class NewsProvider with ChangeNotifier{
  List<NewsModel> _newsList = [];
  List<NewsModel> _trendingList = [];
  List<NewsModel> get getNewsList{
    return _newsList;
  }


  Future<List<NewsModel>> fetchAllNews({required String sortBy}) async {
    _newsList =
    await NewsAPIService.getAllNews(sortBy: sortBy);
    return _newsList;
  }

  Future<List<NewsModel>> fetchTopHeadLine()  async {
    _trendingList = await NewsAPIService.getTopHeadLine();
    return _trendingList;
  }

}