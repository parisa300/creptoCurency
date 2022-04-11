import 'package:creptoapp/theme/colors.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';

import '../../home/ui/home.dart';
List<Color> gradientColors = [BaseColors.purpleGradient, BaseColors.blueGradient];
class NavigationButton extends StatefulWidget {
  const NavigationButton({Key? key}) : super(key: key);

  @override
  State<NavigationButton> createState() => _NavigationButtonState();
}

class _NavigationButtonState extends State<NavigationButton> {
  int currentIndex = 0;
  final _pages = [
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: BaseColors.appBgColor.withOpacity(0.1),
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        iconSize: _size.width / 15.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: BaseColors.white,
        unselectedItemColor: Colors.blueGrey,

        items: [
          BottomNavigationBarItem(
            activeIcon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return  RadialGradient(
                  center: Alignment.topLeft,
                  radius: 0.8,
                  colors: <Color>[BaseColors.purpleGradient,BaseColors.blueGradient],
                  tileMode: TileMode.repeated,
                ).createShader(bounds);
              },
              child: const Icon(Feather.home),
            ),
            icon: const Icon(Feather.home, color: Colors.grey),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return  RadialGradient(
                  center: Alignment.topLeft,
                  radius: 0.8,
                  colors: <Color>[BaseColors.purpleGradient,BaseColors.blueGradient],
                  tileMode: TileMode.repeated,
                ).createShader(bounds);
              },
              child: const Icon(Feather.bar_chart_2),
            ),
            icon: const Icon(Feather.bar_chart_2, color: Colors.grey),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return  RadialGradient(
                  center: Alignment.topLeft,
                  radius: 1.0,
                  colors: <Color>[BaseColors.purpleGradient,BaseColors.blueGradient],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child: const Icon(Feather.trending_down),
            ),
            icon: const Icon(Feather.trending_down, color: Colors.grey),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return  RadialGradient(
                  center: Alignment.topLeft,
                  radius: 1.0,
                  colors: <Color>[BaseColors.purpleGradient,BaseColors.blueGradient],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child: const Icon(Feather.trending_up),
            ),
            icon: const Icon(Feather.trending_up, color: Colors.grey),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return  RadialGradient(
                  center: Alignment.topLeft,
                  radius: 1.0,
                  colors: <Color>[BaseColors.purpleGradient,BaseColors.blueGradient],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child: const Icon(Feather.activity),
            ),
            icon: const Icon(Feather.activity, color: Colors.grey),
            label: "",
          ),
        ],
      ),
      body: _pages[currentIndex],
    );
  }
}
