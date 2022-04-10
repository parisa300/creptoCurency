import 'package:creptoapp/src/detail/ui/detail.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:creptoapp/theme/colors.dart';

import 'avatar_image.dart';

List<Color> stateColors = [stayColor, upColor, downColor];

class CoinItem extends StatelessWidget {
  const CoinItem(this.coinData, { Key? key, this.onTap}) : super(key: key);
  final coinData;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        List<FlSpot> list=[
           // FlSpot(0, 500.40),
           // FlSpot(1, 102.34),
           // FlSpot(2, 98.23),
           // FlSpot(3, 100.23),
           // FlSpot(4, 102.10),
           // FlSpot(5, 103.85),
           // FlSpot(6, 103.20),
         ];

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(spots: list , maxY:11 ,minY: 0,profitPercent: 6,)),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: glassColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AvatarImage(
                  coinData['image'],
                  isSVG: false,
                  width: 30, height: 30,
                  radius: 50,
                ),
                SizedBox(width: 10),
                Expanded(
                    child:
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Container(
                                    child: Text(coinData['name'], maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 16,
                                            fontWeight: FontWeight.w700))
                                )
                            ),
                            SizedBox(width: 5),
                            Container(
                                child: Text(coinData['price'], maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 15,
                                        fontWeight: FontWeight.w600))
                            )
                          ],
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                  child: Text(coinData['name_abb'], maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 13,))
                              ),
                            ),

                              //    Container(),
                              Container(width: 45,
                                  height: 20,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: stateColors[coinData['state']],
                                    ),
                                    borderRadius: const BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                                  ),
                                  child: Center(
                                    child: Text(coinData['change'], maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 12, color: stateColors[coinData['state']])),
                                  )),


                          ],
                        ),
                      ],
                    )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
