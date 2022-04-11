import 'package:creptoapp/src/widget/navigation/navigation.dart';
import 'package:flutter/material.dart';

import 'theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: BaseColors.primary,
      ),
      home: NavigationButton(),
    );
  }
}
