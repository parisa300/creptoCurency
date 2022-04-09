import 'package:creptoapp/src/detail/ui/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../home/ui/home.dart';
class NavigationButton extends StatefulWidget {
  const NavigationButton({Key? key}) : super(key: key);

  @override
  State<NavigationButton> createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  int currentPage = 0;
  var _pages = [
    HomePage(),
    DetailPage(),
    DetailPage(),
    DetailPage(),
    DetailPage(),

  ];

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: .0,
          backgroundColor: Color(0xFF1e1e1e).withOpacity(.98),
          currentIndex: currentPage,
          onTap: (i) {
            setState(() {
              currentPage = i;
            });
          },
          type: BottomNavigationBarType.fixed,
          iconSize: _size.width / 15.0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Color(0xFF3928EA),
          unselectedItemColor: Colors.grey.shade400,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Feather.home), label: "Dashboard"),
            BottomNavigationBarItem(
                icon: Icon(Feather.bar_chart_2), label: "Activity"),
            BottomNavigationBarItem(
                icon: Icon(Feather.trending_down), label: "Trend"),
            BottomNavigationBarItem(
                icon: Icon(Feather.trending_up), label: "Trend"),
            BottomNavigationBarItem(
                icon: Icon(Feather.activity), label: "Coins"),
          ],
        ),
        body: _pages[currentPage],
      ),
    );
  }
}
