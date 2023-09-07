import 'package:flutter/material.dart';
import 'package:news_app/Utility/utils.dart';
import 'package:news_app/consts/styles.dart';

class ArticlesWidget extends StatelessWidget {
  const ArticlesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize;
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
                          "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/AA1gbICa.img?w=730&h=487&m=6&x=314&y=93&s=66&d=66",
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
                                const Icon(Icons.lock_clock),
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
        ),
      ),
    );
  }
}
