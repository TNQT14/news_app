import 'package:flutter/material.dart';
import 'package:news_app/Utility/utils.dart';
import 'package:news_app/consts/styles.dart';

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
    return Stack(
      children: [
        // Positioned(
        //   right: 0,
        //   width: 0,
        //   child: Container(
        //     height: 60,
        //     width: 60,
        //     color: Theme.of(context).colorScheme.secondary,
        //   ),
        // ),
        Container(
          color: Theme.of(context).cardColor,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                    "https://th.bing.com/th/id/R.988eba9b34a86ba4f51d75e8cb2ded14?rik=zCp%2b2LVqvCfWsg&pid=ImgRaw&r=0",
                  height: size.height*0.12,
                  width: size.width*0.12,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Điểm tin thể thao sáng 4-9: Neymar: 'Tôi và Messi sống như địa ngục' ở PSG",
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
                          Icon(Icons.lock_clock),
                          Text("less than one minutes",
                            style: smallTextStyle,
                          ),
                        ],
                      ),
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          IconButton(onPressed: (){},
                              icon: const Icon(Icons.link,
                              color: Colors.blue,)
                          ),
                          Text("23/10/2023 ON 8:15",
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
    );
  }
}
