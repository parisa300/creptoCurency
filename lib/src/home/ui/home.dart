import 'package:creptoapp/src/home/data/model/coindata.dart';
import 'package:flutter/material.dart';

import '../../widget/coinItem.dart';

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
    List<CoinData>list=_getCoinData();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
          children:
              List.generate(list.length, (index) => CoinItem(list[index]))),
    );
  }

  List<CoinData> _getCoinData(){
    return [
      CoinData("Bitcoin", "BTC", "https://g.foolcdn.com/art/companylogos/square/btc.png", 420000, "3", 1),
      CoinData("Cadano", "ADA", "https://www.meme-arsenal.com/memes/688700b41a939acf4cad09e9c84bcff6.jpg", 420000, "-2", 2),
      CoinData("Solana", "SOL", "https://www.pngall.com/wp-content/uploads/10/Solana-Crypto-Logo-PNG-File.png", 320000, "-1", 2),
      CoinData("Shiba Inu", "SHIB", "https://upload.wikimedia.org/wikipedia/en/5/53/Shiba_Inu_coin_logo.png", 12000, "10", 1),
      CoinData("Litecoin", "LTC", "https://assets.website-files.com/5f8e21b830b6431600cd03ae/60b62164a065abc121cf7cef_1xxs0ttdkg3z.png", 12000, "5", 1),
      CoinData("Shiba Inu", "SHIB", "https://upload.wikimedia.org/wikipedia/en/5/53/Shiba_Inu_coin_logo.png", 12000, "-2", 1),
      CoinData("Shiba Inu", "SHIB", "https://upload.wikimedia.org/wikipedia/en/5/53/Shiba_Inu_coin_logo.png", 12000, "-2", 1),
    ];
  }
}
