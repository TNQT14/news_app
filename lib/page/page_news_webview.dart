import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../Utility/utils.dart';

class NewsWebViewPage extends StatefulWidget {
  final String url;
  const NewsWebViewPage({super.key, required this.url});

  @override
  State<NewsWebViewPage> createState() => _NewsWebViewPageState();
}

class _NewsWebViewPageState extends State<NewsWebViewPage> {
  double _progress = 0.0;
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(IconlyLight.arrowLeft2),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
            title: Text(widget.url, style: TextStyle(color: color),),
        centerTitle: true,
        elevation: 0,
          actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: (){

            },
          ),
        ],
      ),
      body: Column(
        children: [
          LinearProgressIndicator(
            value: _progress,
            color: _progress == 1 ? Colors.transparent:Colors.blue,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          Expanded(child: WebView(
            initialUrl: widget.url,
            zoomEnabled: true,
            onProgress: (value){
              _progress = value/100;
            },
          )),
        ],
      )
    );
  }
}
