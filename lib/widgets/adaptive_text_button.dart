import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveTextButton extends StatelessWidget {
  Function _presentDatePicker;

  AdaptiveTextButton(this._presentDatePicker);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(
              "Choose Date",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              _presentDatePicker();
            },
          )
        : TextButton(
            onPressed: () {
              _presentDatePicker();
            },
            child: Text(
              "Choose Date",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
  }
}
