import 'package:news_app/core.dart';
import 'package:flutter/material.dart';
import 'package:news_app/page/home_page.dart';
import 'package:news_app/page/news_detail_page.dart';
import 'package:news_app/provider/news_provider.dart';
import 'package:news_app/provider/theme_povider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeChangeProvider = ThemeProvider();

    //Fetch the current theme
    void getCurrentAppTheme() async {
      themeChangeProvider.setDarkTheme =
      await themeChangeProvider.darkThemePreferences.getTheme();
    }

    @override
    void didChangeDependencies() {
      getCurrentAppTheme();
      super.didChangeDependencies();
    }
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          //Notify about theme changes
          return themeChangeProvider;
        }),
        ChangeNotifierProvider(
          create: (_) => NewsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
navigatorKey: Get.navigatorKey,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
        routes: {
          NewDetailPage.routeName: (context) => const NewDetailPage(),
        },
      ),
    );
  }
}
