import 'package:creptoapp/src/widget/avatar_image.dart';
import 'package:creptoapp/theme/colors.dart';
import 'package:flutter/material.dart';

class ItemDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DetailsState();
  }
}

class _DetailsState extends State<ItemDetail> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = true;
    return Container(
      margin: const EdgeInsets.only(bottom: 8, left: 8, right: 8, top: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: BaseColors.boxcolor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: BaseColors.shadowColor.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          const CircleAvatar(
                            radius: 25.0,
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(
                                'https://upload.wikimedia.org/wikipedia/en/5/53/Shiba_Inu_coin_logo.png'),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                              child: Container(
                                  child: const Text('Take Profit',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700)))),
                          const SizedBox(width: 5),
                          Container(
                              child: const Text('+0.0400ETH',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)))
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: Color(0xFF98989c),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          const CircleAvatar(
                            radius: 25.0,
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(
                                'https://g.foolcdn.com/art/companylogos/square/btc.png'),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                              child: Container(
                                  child: const Text('Stop less',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700)))),
                          const SizedBox(width: 5),
                          Container(
                              child: const Text('-0.100ETS',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Divider(
                    color: Color(0xFF98989c),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          const CircleAvatar(
                            radius: 25.0,
                            backgroundColor: Colors.transparent,
                            backgroundImage: NetworkImage(
                                'https://assets.website-files.com/5f8e21b830b6431600cd03ae/60b62164a065abc121cf7cef_1xxs0ttdkg3z.png'),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                              child: Container(
                                  child: const Text('AutoIncrese',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700)))),
                          const SizedBox(width: 5),
                          Container(
                            child: Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                  print(isSwitched);
                                });
                              },
                              activeTrackColor: Colors.deepPurpleAccent,
                              activeColor: Colors.deepPurple,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
            ],
          )
        ],
      ),
    );
  }
}
