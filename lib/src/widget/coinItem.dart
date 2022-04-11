import 'package:creptoapp/src/detail/ui/detail.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:creptoapp/theme/colors.dart';

import 'avatar_image.dart';

List<Color> stateColors = [BaseColors.stayColor, BaseColors.upColor, BaseColors.downColor];

class CoinItem extends StatelessWidget {
  const CoinItem(this.coinData, {Key? key, this.onTap}) : super(key: key);
  final coinData;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        List<FlSpot> list = [
          const FlSpot(0, 0.67),
          const FlSpot(1, 1.24),
          const FlSpot(2, 3.48),
          const FlSpot(3, 0.30),
          const FlSpot(4, 4.15),
          const FlSpot(5, 0.52),
          const FlSpot(6, 0.58),
        ];

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              spots: list,
              maxY: 11,
              minY: 0,
              profitPercent: 6,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: BaseColors.boxcolor,
          borderRadius: BorderRadius.circular(10),
          boxShadow:  [
            BoxShadow(
              color: BaseColors.boxcolor,
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
                  width: 30,
                  height: 30,
                  radius: 50,
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Container(
                                child: Text(coinData['name'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style:  TextStyle(
                                        fontSize: 14,
                                        color: BaseColors.white,
                                        fontWeight: FontWeight.w700)))),
                        SizedBox(width: 5),
                        Container(
                            child: Text(coinData['price'],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style:  TextStyle(
                                  color: BaseColors.white,
                                    fontSize: 12, fontWeight: FontWeight.w600)))
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              child: Text(coinData['name_abb'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey.withOpacity(0.5)
                                  ))),
                        ),

                        //    Container(),
                        Container(
                            width: 45,
                            height: 20,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: stateColors[coinData['state']],
                              ),
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                            ),
                            child: Center(
                              child: Text(coinData['change'],
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: stateColors[coinData['state']])),
                            )),
                      ],
                    ),
                  ],
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
