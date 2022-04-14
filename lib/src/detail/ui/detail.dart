import 'package:creptoapp/src/comment/data/modelComment.dart';
import 'package:creptoapp/src/comment/ui/commentScreen.dart';
import 'package:creptoapp/src/theme/colors.dart';
import 'package:creptoapp/src/widget/itemDetail.dart';
import 'package:creptoapp/src/widget/switchToggle.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/chart/chart.dart';
import '../../widget/chart/chart_sort_widget.dart';

class DetailPage extends StatefulWidget {
  late final List<FlSpot> spots;
  late final double profitPercent;
  late final double minY;
  late final double maxY;

  DetailPage(
      {required this.spots,
      required this.minY,
      required this.profitPercent,
      required this.maxY});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    for (var i = 0; i < widget.spots.length; i++) {
      totalSpotsValue += widget.spots[i].y;
    }
    super.initState();
  }

  double totalSpotsValue = 0.0;
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
      appBar: AppBar(
        backgroundColor: BaseColors.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: BaseColors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title:
        _buildText("BTC ETH", themeData.primaryColor, FontWeight.w600),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
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
                      color: BaseColors.boxcolor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Center(
                        child: SizedBox(
                          width: 300,
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sortStrings.length,
                  itemBuilder: (BuildContext context, int i) {
                    return i == selectedSort
                        ? GestureDetector(
                            onTap: () => selectedSort = i,
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
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
              child: Column(
                children: [
                  ItemDetail(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
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
                        color: BaseColors.boxcolor.withOpacity(0.05),
                        border: Border.all(
                          color: BaseColors.boxcolor,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: 150,
                      height: 56,
                      child: Center(
                        child:
                        _buildText("CLOSEOUT", themeData.primaryColor.withOpacity(0.7), FontWeight.bold),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(CommentScreen());
                    }, //TODO: add buy action
                    splashColor: themeData.primaryColor,
                    highlightColor: themeData.primaryColor,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          BaseColors.purpleGradient,
                          BaseColors.blueGradient
                        ]),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: 150,
                      height: 56,
                      child: Center(
                        child:
                        _buildText("INCREACE", Colors.white.withOpacity(0.7), FontWeight.bold),
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

  Widget _buildToggle() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 75,
        child: Center(child: SwitchToggle()),
      ),
    );
  }

  Widget _buildText(String text,Color color,FontWeight fontWeight){
    return Text(
      text,
        style: GoogleFonts.lato(
        color: color,
    fontWeight:fontWeight,
    fontSize: 15,
    letterSpacing: 1,
    ),
    );
  }
}
