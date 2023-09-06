import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/articles_widget.dart';

class HomeTabPage extends StatefulWidget {
  const HomeTabPage({super.key});

  @override
  State<HomeTabPage> createState() => _HomeTabPageState();
}

class _HomeTabPageState extends State<HomeTabPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "News",
          style: GoogleFonts.lobster(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              letterSpacing: 0.6,
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: (){},
              icon: Icon(
                IconlyLight.search,
              ))
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text("All News",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                ),
                ),
              ),
              IconButton(onPressed: (){},
                  icon: Icon(IconlyLight.filter),
              ),
            ],
          ),
          ArticlesWidget(),
        ],
      ),
    );
  }
}
