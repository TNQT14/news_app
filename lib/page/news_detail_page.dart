import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/consts/styles.dart';

import '../Utility/utils.dart';

class NewDetailPage extends StatefulWidget {
  static const routeName = "/NewDetailScreen";
  const NewDetailPage({super.key});

  @override
  State<NewDetailPage> createState() => _NewDetailPageState();
}

class _NewDetailPageState extends State<NewDetailPage> {
  @override
  void didChangeDependencies(){
    try{

    }catch (e){

    }
  }
  @override
  Widget build(BuildContext context) {
    final color = Utils(context).getColor;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(IconlyLight.arrowLeft2),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        iconTheme: IconThemeData(color: color),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text("by TNQT",
          textAlign: TextAlign.center,
          style: TextStyle(color: color),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("asaaaaaaa",
                  textAlign: TextAlign.justify,
                  style: titleTextStyle,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25, bottom: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text("23/10/2024",
                          style: smallTextStyle,
                        ),
                      ),
                      Expanded(
                        child: Text("less than a minutes",
                          style: smallTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Image.network("https://static-images.vnncdn.net/files/publish/2023/9/11/w-tuyen-an-thien-soi-1-1261.jpg",
                    fit: BoxFit.cover),
              ),
              Positioned(
                bottom: 0,
                right: 10,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 10,
                        shape: const CircleBorder(),
                        child: Icon(
                          IconlyLight.send,
                          size: 28,
                          color: color,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 10,
                        shape: const CircleBorder(),
                        child: Icon(
                          IconlyLight.bookmark,
                          size: 28,
                          color: color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: SelectableText("Description",
                  style: GoogleFonts.roboto(fontSize: 12,
                      fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SelectableText("Description",
                style: GoogleFonts.roboto(fontSize: 12,
                    fontWeight: FontWeight.normal
                ),
                textAlign: TextAlign.justify,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: SelectableText("Content",
                  style: GoogleFonts.roboto(fontSize: 18,
                      fontWeight: FontWeight.normal
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              SelectableText("Description",
                style: GoogleFonts.roboto(fontSize: 12,
                    fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
