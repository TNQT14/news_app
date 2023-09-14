import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:news_app/page/home_tab_page.dart';

import 'explore_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final bottonBarIcon = [
    IconlyLight.home,
    IconlyLight.discovery,
    Icons.sunny_snowing,
    IconlyLight.setting,
  ];

  List<String> bottomBarTitle = ["Home","Trending","Weather","Settings"];
  List<Widget>  tabsScreen =[];
  @override
  void didChangeDependencies() {
    tabsScreen.addAll([
    const HomeTabPage(),
      const ExplorePage(),
    Container(),
    Container(),
    ]);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: tabsScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index != currentIndex) {
            setState(() {
              currentIndex = index;
            });
          }
        },
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.blue,
        selectedLabelStyle: Theme.of(context).textTheme.caption?.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.lightBlue,
        ),
        unselectedLabelStyle: Theme.of(context).textTheme.caption?.copyWith(
          fontWeight: FontWeight.w500,
        ),
        items: List.generate(tabsScreen.length,
                (index) =>BottomNavigationBarItem(
                    icon: Icon(bottonBarIcon[index]),
                    label: bottomBarTitle[index],
                  activeIcon: Icon(
                    bottonBarIcon[index],
                    color: Colors.lightBlue,
                  ),
                )),
      ),
    );
  }
}
