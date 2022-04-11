import 'package:creptoapp/src/theme/colors.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';

import '../../home/ui/home.dart';

List<Color> gradientColors = [
  BaseColors.purpleGradient,
  BaseColors.blueGradient
];

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
            activeIcon: _buildActiveIcon(Feather.home, 0.8),
            icon: _buildIcon(Feather.home),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: _buildActiveIcon(Feather.bar_chart_2, 0.8),
            icon: _buildIcon(Feather.bar_chart_2),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: _buildActiveIcon(Feather.trending_down, 1),
            icon: _buildIcon(Feather.trending_down),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: _buildActiveIcon(Feather.trending_up, 1),
            icon: _buildIcon(Feather.trending_up),
            label: "",
          ),
          BottomNavigationBarItem(
            activeIcon: _buildActiveIcon(Feather.activity, 1),
            icon: _buildIcon(Feather.activity),
            label: "",
          ),
        ],
      ),
      body: _pages[currentIndex],
    );
  }

  ShaderMask _buildActiveIcon(IconData icon, double radius) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return RadialGradient(
          center: Alignment.topLeft,
          radius: radius,
          colors: <Color>[BaseColors.purpleGradient, BaseColors.blueGradient],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: Icon(icon),
    );
  }

  Widget _buildIcon(IconData icon) {
    return Icon(icon, color: Colors.grey);
  }
}
