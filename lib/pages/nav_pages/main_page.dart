import 'package:flutter/material.dart';
import 'package:flutter_cubit/pages/nav_pages/bar_item_page.dart';
import 'package:flutter_cubit/pages/home_page.dart';
import 'package:flutter_cubit/pages/nav_pages/my_page.dart';
import 'package:flutter_cubit/pages/nav_pages/search_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];

  int currentindex = 0;

  void OnTap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentindex,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        onTap: OnTap,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(.8),
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.apps,
              ),
              label: "home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_sharp), label: "bar item"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "me"),
        ],
      ),
    );
  }
}
