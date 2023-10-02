import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Utility/utils.dart';
import 'package:news_app/consts/styles.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/page/page_news_webview.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../models/bookmarks_model.dart';
import '../page/news_detail_page.dart';

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({
    Key? key,
    this.isBookmark = false,
    this.isTrending = false,
  }) : super(key: key);

  final bool isBookmark;
  final bool isTrending;


  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    NewsModel news = Provider.of<NewsModel>(context);
    dynamic newsModelProvider = isBookmark ? Provider.of<BookmarksModel>(context) : Provider.of<NewsModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){
          print("On tap");
            Navigator.pushNamed(context, NewDetailPage.routeName, arguments:{
              "isTrending": false,
              "publishedAt": newsModelProvider.publishedAt,
            });
        },
        child: Stack(
          children: [
            Container(
              height: 60,
              width: 60,
              color: Theme.of(context).colorScheme.secondary,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              width: 60,
              child: Container(
                height: 60,
                width: 60,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
              Container(
                color: Theme.of(context).cardColor,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(12),
                    //   child: Image.network(
                    //     news.urlToImage,
                    //     height: size.height*0.12,
                    //     width: size.height*0.12,
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Hero(
                        tag: news.publishedAt,
                        child: FancyShimmerImage(
                          imageUrl: news.urlToImage,
                          boxFit: BoxFit.fill,
                          height: size.height*0.12,
                          width: size.height*0.12,
                          errorWidget: Image.asset("assets/images/empty_image.png"),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(news.title,
                          style: smallTextStyle,
                          textAlign: TextAlign.justify,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 5,),
                          Align(
                            alignment: Alignment.topRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(Icons.lock_clock),
                                Text(news.readingTimeText,
                                  style: smallTextStyle,
                                ),
                              ],
                            ),
                          ),
                          FittedBox(
                            child: Row(
                              children: [
                                IconButton(onPressed: (){
                                  Navigator.push(context, PageTransition(
                                      child: NewsWebViewPage(url: news.url),
                                      type: PageTransitionType.rightToLeft,));
                                },
                                    icon: const Icon(Icons.link,
                                    color: Colors.blue,)
                                ),
                                Text(news.dateToShow,
                                style: smallTextStyle,),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
