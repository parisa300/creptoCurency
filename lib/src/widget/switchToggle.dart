import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';


class SwitchToggle extends StatefulWidget {
  const SwitchToggle({Key? key}) : super(key: key);

  @override
  State<SwitchToggle> createState() => _TabDetailWidgetState();
}

class _TabDetailWidgetState extends State<SwitchToggle> {
  @override
  Widget build(BuildContext context) {

    List<Color> colors  = [const Color(0xff8a35f4), const Color(0xff0777fe)];

    return Container(
      margin: EdgeInsets.only(top: 30.0),
      child: ToggleSwitch(
        minWidth: 90,
        minHeight: 200,
        initialLabelIndex: 0,
        activeFgColor: Colors.white,
        inactiveFgColor: Colors.white,
        totalSwitches: 3,
        borderColor: [Color(0xFF292976)],
        dividerColor: Colors.grey.withOpacity(0.5),
        activeBgColors: [colors  , colors , colors],
        cornerRadius: 16,
        radiusStyle: true,
        borderWidth: 0,
        labels: ['Chart', 'Info', 'History'],
        onToggle: (index) {
          print('switched to: $index');
        },
      ),);
  }

  }


