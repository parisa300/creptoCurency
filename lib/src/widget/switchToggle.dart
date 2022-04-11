import 'package:creptoapp/src/theme/colors.dart';
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

    List<Color> colors  = [BaseColors.purpleGradient, BaseColors.blueGradient];

    return Container(
      margin: EdgeInsets.only(top: 30.0),
      child: ToggleSwitch(
        minWidth: 90,
        minHeight: 200,
        initialLabelIndex: 0,
        activeFgColor: BaseColors.white,
        inactiveFgColor: BaseColors.white,
        totalSwitches: 3,
        borderColor: [BaseColors.borderColorSwitch],
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


