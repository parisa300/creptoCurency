import 'package:flutter/material.dart';

import '../../widget/coinItem.dart';
import '../data/json.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Text("BTC/USDT"),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 15),
        getNewCoins(),
      ]),
    );
  }

  getNewCoins() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
          children:
              List.generate(coins.length, (index) => CoinItem(coins[index]))),
    );
  }
}
