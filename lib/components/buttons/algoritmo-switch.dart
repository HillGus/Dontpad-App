import 'package:flutter/material.dart';
import '../../main.dart';

class AlgoritmoSwitch extends StatefulWidget {

  @override
  createState() => _AlgoritmoSwitchState();
}

class _AlgoritmoSwitchState extends State<AlgoritmoSwitch> {

  var value = false;
  var label = "Algoritmo Simples";

  @override
  Widget build(BuildContext context) {

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              label,
              style: TextStyle(
                  fontSize: Constants.textSize
              )
          ),
          Switch(
              value: value,
              onChanged: (newValue) {
                setState(() {
                  value = newValue;
                  label = "Algoritmo " + (value ? "Complexo" : "Simples");
                });
              }
          )
        ]
    );
  }
}