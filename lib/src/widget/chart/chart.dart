import 'package:creptoapp/theme/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


LineChartData chart(
  bool isDetailPage,
  List<FlSpot> spots,
  double minY,
  double maxY,
  bool profit,
) {
  List<Color> greenColors = [
    Colors.blue.shade500,
    Colors.blue.shade500,
  ];
  List<Color> redColors = [
    Colors.red.shade900,
    Colors.red.shade700,
  ];

  return LineChartData(
     backgroundColor: BaseColors.boxcolor,
    gridData: FlGridData(
      show: !isDetailPage,
      drawVerticalLine: !isDetailPage,
      drawHorizontalLine: true,
      verticalInterval: 1,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color:BaseColors.chart1,
          strokeWidth: 1,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color:BaseColors.chart1,
          strokeWidth: 1,
        );
      },
    ),
    titlesData: isDetailPage
        ? FlTitlesData(show: false)
        : FlTitlesData(
            show: true,
            rightTitles: SideTitles(showTitles: false),
            topTitles: SideTitles(showTitles: false),
            bottomTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              interval: 1,
              textAlign: TextAlign.start,
              getTextStyles: (context, value) =>  TextStyle(
                color:BaseColors.chart,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              getTitles: (value) {
                switch (value.toInt()) {
                  case 0:
                    return '1';
                  case 1:
                    return '2';
                  case 2:
                    return '3';
                  case 3:
                    return '4';
                  case 4:
                    return '5';
                  case 5:
                    return '6';
                  case 6:
                    return '7';
                  default:
                    return '';
                }
              },
              margin: 8,
            ),
            leftTitles: SideTitles(
              showTitles: true,
              reservedSize: 35,
              margin: 10,
              getTextStyles: (context, value) =>  TextStyle(
                color: BaseColors.chart,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
    lineTouchData: LineTouchData(
      touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.black,
          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
            return touchedBarSpots.map((barSpot) {
              final flSpot = barSpot;
              return LineTooltipItem(
                flSpot.y
                    .toStringAsFixed(2)
                    .replaceFirst('.', ',')
                    .replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.'),
                GoogleFonts.poppins(
                  color: BaseColors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  letterSpacing: 0.5,
                ),
              );
            }).toList();
          }),
    ),
    minX: 0,
    maxX: 6,
    minY: minY,
    maxY: maxY,
    lineBarsData: [
      LineChartBarData(
        spots: spots,
        isCurved: true,
        colors: profit ? greenColors : redColors,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors: profit
              ? greenColors.map((color) => color.withOpacity(0.3)).toList()
              : redColors.map((color) => color.withOpacity(0.3)).toList(),
        ),
      ),
    ],
  );
}
