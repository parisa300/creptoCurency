import 'package:creptoapp/src/widget/switchToggle.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/chart/chart.dart';
import '../../widget/chart/chart_sort_widget.dart';

class DetailPage extends StatefulWidget {

  late final List<FlSpot> spots;
  late final double profitPercent;
  late final double minY;
  late final double maxY;
  DetailPage({
    required this.spots,
    required this.minY,
    required this.profitPercent,
    required this.maxY
  });
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedSort = 2;
  List sortStrings = [
    '1H',
    '1D',
    '1W',
    '1M',
    '1Y',
  ];

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
          backgroundColor: Color(0xFF212244),
          leading: Padding(
            padding: EdgeInsets.only(left: 5),
            child: SizedBox(
              height: 3.5,
              width: 10,
              child: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                    color: themeData.primaryColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 28,
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
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: SizedBox(
                height: 3.5,
                width: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: themeData.primaryColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFF212244),
        body: SafeArea(
        child: Column(
        children: [
          _buildToggle(),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 3),
              child: Center(
                child: Container(
                  width: 350,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: SizedBox(
                        width: 200,
                        height: 400,
                        child: LineChart(
                          chart(
                            false,
                            widget.spots,
                            widget.minY,
                            widget.maxY,
                            widget.profitPercent >= 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sortStrings.length,
                itemBuilder: (BuildContext context, int i) {

                  return i == selectedSort
                      ? GestureDetector(
                      onTap: () => selectedSort=i,
                      child: chartSortWidget(
                          sortStrings[i], true, themeData))
                      : GestureDetector(
                      onTap: () => selectedSort = i,
                      child: chartSortWidget(
                          sortStrings[i], false, themeData));
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 5, right: 5),
            child: Row(


              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {}, //TODO: add sell action
                  splashColor:
                  themeData.secondaryHeaderColor.withOpacity(0.5),
                  highlightColor:
                  themeData.secondaryHeaderColor.withOpacity(0.8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF363762).withOpacity(0.05),
                      border: Border.all(
                        color: Color(0xFF363762),
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 150,
                    height: 56,
                    child: Center(
                      child: Text(
                        'CLOSEOUT',
                        style: GoogleFonts.lato(
                          color: themeData.primaryColor.withOpacity(0.7),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {}, //TODO: add buy action
                  splashColor: themeData.primaryColor,
                  highlightColor: themeData.primaryColor,
                  child: Container(
                    decoration: BoxDecoration(
                      color:Color(0xFF5b46f8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 150,
                    height: 56,
                    child: Center(
                      child: Text(
                        'INCREACE',
                        style: GoogleFonts.lato(
                          color: Colors.white.withOpacity(0.8),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
        ),
        ),
    );
  }

  Widget _buildToggle(){
    return
      const Padding(padding: EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: 75,
          child: Center(child: SwitchToggle()),
        ),
      );

  }
}
