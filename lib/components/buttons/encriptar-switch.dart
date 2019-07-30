import 'package:flutter/material.dart';
import '../../main.dart';

class EncriptarSwitch extends StatefulWidget {

  @override
  createState() => _EncriptarSwitchState();
}

class _EncriptarSwitchState extends State<EncriptarSwitch> {

  var value = false;
  var label = "Não Encriptar";

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
                  label = (value ? "" : "Não ") + "Encriptar";
                });
              }
          )
        ]
    );
  }
}