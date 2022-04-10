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
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      child: ToggleSwitch(
        minWidth: 90,
        minHeight: 200,
        initialLabelIndex: 0,
        activeFgColor: Colors.white,
        inactiveFgColor: Colors.white,
        activeBgColor: [ Colors.blue.shade500,],
        totalSwitches: 3,
        labels: ['Chart', 'Info', 'History'],
        onToggle: (index) {
          print('switched to: $index');
        },
      ),);
  }

  }


