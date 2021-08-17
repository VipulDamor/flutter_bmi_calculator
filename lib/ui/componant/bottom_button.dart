import 'package:flutter/material.dart';

import '../Utils/constants.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonTitle;

  BottomButton(this.onTap, this.buttonTitle);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColour,
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
