import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  AdaptativeButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(label),
            onPressed: onPressed,
          )
        : RaisedButton(
            color: Theme.of(context).primaryColor,
            textColor: Theme.of(context).textTheme.button!.color,
            child: Text(label),
            onPressed: onPressed,
          );
  }
}
