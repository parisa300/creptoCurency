import 'package:creptoapp/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0), //appbar size
        child: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          shadowColor: Colors.transparent,
          backgroundColor:BaseColors.primary,
          leading: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: GestureDetector(
              onTap: () => "",
              child: SizedBox(
                height: 3.5,
                width: 10,
                child: InkWell(
                  child: Container(
                    margin:  const EdgeInsets.all(8),
                    decoration: BoxDecoration(

                      color: themeData.primaryColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:  Icon(
                      Icons.arrow_back_ios,
                      color: BaseColors.white,
                      size: 28,
                    ),
                  ),
                ),
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leadingWidth: 15,
          title: Text(
            "BTC ETH",
            style: GoogleFonts.lato(
              color: themeData.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
        IconButton(onPressed: () {  }, icon: const Icon(Icons.more_vert), ),
          ],
        ),
      ),
      body: getbody(),
    );
  }

  getbody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

          const SizedBox(
            height: 15,
          ),
          getNewCoins(),
        ]),
      ),
    );
  }
}

getNewCoins() {
  return Container(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: Column(
        children:
            List.generate(coins.length, (index) => CoinItem(coins[index]))),
  );
}
