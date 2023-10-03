import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/widget/empty_screen.dart';
import 'package:news_app/widget/top_trending_widget.dart';
import 'package:provider/provider.dart';

import '../Utility/utils.dart';
import '../consts/vars.dart';
import '../provider/news_provider.dart';
import '../widget/loading_widget.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    var newsType = NewsType.topTrending;
    Size size = Utils(context).getScreenSize;
    final Color color = Utils(context).getColor;
    final newProvider = Provider.of<NewsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: color),
        title: Text("Trending",
        style: GoogleFonts.lobster(
          color: color,
          fontSize: 20,
          letterSpacing: 0.6
        ),),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<List<NewsModel>>(future: newProvider.fetchTopHeadLine(),
            builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return LoadingWidget();
            }
            else
              if(snapshot.hasError)
                {
                  return Expanded(
                    child: EmptyNewsWidget(text: 'an error occured ${snapshot.hasError}',
                        imagePath: "assets/images/empty_image.png"),
                  );
                }
              else
                if(snapshot.data == null){
                  return Expanded(
                    child: EmptyNewsWidget(text: 'No new found',
                        imagePath: "assets/images/empty_image.png"),
                  );
                }
            return Center(
              child: SizedBox(
                height: size.height*0.7,
                child: Swiper(
                  layout: SwiperLayout.STACK,
                  itemWidth: size.width*0.9,
                  viewportFraction: 0.9,
                  autoplay: true,
                  autoplayDelay: 2000,
                  itemCount: snapshot.data?.length ??0,
                  itemBuilder: (context,index){
                    return ChangeNotifierProvider.value(
                        value: snapshot.data?[index],
                        child: TopTrendingWidget());
                  },
                ),
              ),
            );
            },
          ),

        ],
      ),
    );
  }
}
