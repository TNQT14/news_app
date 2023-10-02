import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Utility/utils.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/page/page_news_webview.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../page/news_detail_page.dart';

class TopTrendingWidget extends StatefulWidget {
  const TopTrendingWidget({super.key});

  @override
  State<TopTrendingWidget> createState() => _TopTrendingWidgetState();
}

class _TopTrendingWidgetState extends State<TopTrendingWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).getColor;
    final newsModelProvide = Provider.of<NewsModel>(context);
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: Theme.of(context).cardColor,
      child: InkWell(
        onTap:  (){
          // Navigator.pushNamed(context, NewDetailPage.routeName);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Hero(
                tag: "2",
                child: FancyShimmerImage(
                  imageUrl: newsModelProvide.urlToImage,
                  boxFit: BoxFit.fill,
                  height: size.height*0.3,
                  width: double.infinity,
                  errorWidget: Image.asset("assets/images/empty_image.png"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(newsModelProvide.title,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold),),
            ),
            Row(
              children: [
                IconButton(onPressed: (){
                  Navigator.push(context, PageTransition(
                      child: NewsWebViewPage(url: newsModelProvide.url),
                      inheritTheme: true,
                      ctx: context,
                      type: PageTransitionType.rightToLeft));
                },
                    icon: Icon(Icons.link)),
                const Spacer(),
                Expanded(
                  child: SelectableText(
                    newsModelProvide.publishedAt,
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
