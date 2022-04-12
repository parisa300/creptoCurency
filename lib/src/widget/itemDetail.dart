import 'package:creptoapp/src/theme/colors.dart';
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
                  _buildRowItem(
                      "https://upload.wikimedia.org/wikipedia/en/5/53/Shiba_Inu_coin_logo.png",
                      "Take Profit",
                      "+0.0400ETH"),
                  const SizedBox(height: 16),
                  Divider(
                      color: BaseColors.divider,
                     ),
                  _buildRowItem(
                      "https://g.foolcdn.com/art/companylogos/square/btc.png",
                      "Stop less",
                      "+0.0400ETH"),

                  Divider(
                    color: BaseColors.divider,
                  ),
                  _buildRowItem2(
                      "https://assets.website-files.com/5f8e21b830b6431600cd03ae/60b62164a065abc121cf7cef_1xxs0ttdkg3z.png",
                      "Stop less",
                      ),

                ],
              )),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildName(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      // maxLines: 1,
      // overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildPrice(String price) {
    return Text(
      price,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      // maxLines: 1,
      // overflow: TextOverflow.ellipsis,
    );
  }

  Widget _circleAvatar(String imgUrl) {
    return CircleAvatar(
      backgroundImage: NetworkImage(imgUrl),
      radius: 25.0,
      backgroundColor: Colors.transparent,
    );
  }


  Widget _buildRowItem(String imgUrl, String name, String price) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _circleAvatar(imgUrl),
            const SizedBox(width: 8),
            _buildName(name),
          ],
        ),
        _buildPrice(price),
      ],
    );
  }
  bool isSwitched = true;
  Widget _buildRowItem2(String imgUrl, String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _circleAvatar(imgUrl),
            const SizedBox(width: 8),
            _buildName(name),
          ],
        ),

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
    );
  }
}
