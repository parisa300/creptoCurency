import 'package:creptoapp/src/detail/ui/detail.dart';
import 'package:creptoapp/src/home/data/model/coindata.dart';
import 'package:creptoapp/src/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'avatar_image.dart';

List<Color> stateColors = [
  BaseColors.stayColor,
  BaseColors.upColor,
  BaseColors.downColor
];

class CoinItem extends StatelessWidget {
  const CoinItem(this.coinData, {Key? key, this.onTap}) : super(key: key);
  final CoinData coinData;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        List<FlSpot> list = _generateChartInfo();
        _navigateToDetailsScreen(list, context);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: BaseColors.boxcolor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: BaseColors.boxcolor,
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: _buildRowItem(),

      ),
    );
  }

  List<FlSpot> _generateChartInfo() {
    return [
      const FlSpot(0, 0.67),
      const FlSpot(1, 1.24),
      const FlSpot(2, 3.48),
      const FlSpot(3, 0.30),
      const FlSpot(4, 4.15),
      const FlSpot(5, 0.52),
      const FlSpot(6, 0.58),
    ];
  }

  void _navigateToDetailsScreen(List<FlSpot> list, BuildContext context) {
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
  }

  Widget _buildText(String text, FontWeight fontWeight, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildRowItem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          _buildIcon(),
          const SizedBox(width: 8),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Column(
                  children: [
                    _buildName(),
                    _buildSymbol(),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              _buildPrice(),
              const SizedBox(height: 8),
              _buildPercentage(),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildName() {
    return Text(
      coinData.name,
      style: TextStyle(fontWeight: FontWeight.w700, color: BaseColors.white),
    );
  }

  Widget _buildSymbol() {
    return Text(
      coinData.symbol,
      style: TextStyle(
          fontWeight: FontWeight.w600, color: Colors.grey.withOpacity(0.5)),
    );
  }

  Widget _buildPrice() {
    return Text(
      coinData.price.toString(),
      style: TextStyle(fontWeight: FontWeight.w600, color: BaseColors.white),
    );
  }

  Widget _buildPercentage() {

    // state = 0
    Color color = BaseColors.stayColor;

    switch (coinData.state) {
      case 1:
        color = BaseColors.upColor;
        break;

      case 2:
        color = BaseColors.downColor;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(4),
      margin: EdgeInsets.only(left: 15,right: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color)),
      child: Text(
        coinData.change.toString(),
        style: TextStyle(fontWeight: FontWeight.w600, color: color),
      ),
    );
  }

  Widget _buildIcon() {
    return AvatarImage(
      coinData.image,
      isSVG: false,
      width: 30,
      height: 30,
      radius: 50,
    );
  }
}
