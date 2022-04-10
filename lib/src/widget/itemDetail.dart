import 'package:creptoapp/src/widget/avatar_image.dart';
import 'package:flutter/material.dart';

class ItemDetail extends StatefulWidget {
 // final coinData;

//  ItemDetail(this.coinData) ;

  @override
  State<StatefulWidget> createState() {
    return _DetailsState();
  }
}

class _DetailsState extends State<ItemDetail> {



  @override
  Widget build(BuildContext context) {
    bool isSwitched = true;
    return  Column(
      children: [
        const SizedBox(height: 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 30.0,
              backgroundColor: Colors.transparent,
              backgroundImage:  NetworkImage('https://www.meme-arsenal.com/memes/688700b41a939acf4cad09e9c84bcff6.jpg'),
            ),
            SizedBox(width: 10),
            Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Container(
                                    child: const Text('Take Profit',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,

                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700)))),
                            SizedBox(width: 5),
                            Container(
                                child: const Text('+0.0400ETH',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 15,   color: Colors.white, fontWeight: FontWeight.w600)))
                          ],
                        ),
                      ),
                    ),
                    new Divider(
                      color: Color(0xFF98989c),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Container(
                                    child: const Text('Stop less',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700)))),
                            SizedBox(width: 5),
                            Container(
                                child: const Text('-0.100ETS',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600)))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    new Divider(
                      color: Color(0xFF98989c),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Container(
                                    child: const Text('name',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700)))),
                            SizedBox(width: 5),
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
    );
  }
}
