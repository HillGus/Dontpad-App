import 'package:flutter/material.dart';

class DontpadTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
        margin: EdgeInsets.all(8),
        child: Center(
            child: Text(
                "Dontpad",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 48
                )
            )
        )
    );
  }
}