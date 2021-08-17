import 'package:flutter/material.dart';

import '../Utils/constants.dart';

class UiWidjit extends StatelessWidget {
  IconData iconData;
  String name;

  UiWidjit(this.iconData, this.name);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 90.0,
        ),
        Text(
          name,
          style: kTextStyle,
        )
      ],
    );
  }
}
