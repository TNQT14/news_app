import 'package:flutter/material.dart';
import 'package:news_app/Utility/utils.dart';
import 'package:news_app/consts/styles.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/page/page_news_webview.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    NewsModel news = Provider.of<NewsModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: (){},
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        news.urlToImage,
                        height: size.height*0.12,
                        width: size.height*0.12,
                        fit: BoxFit.cover,
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
