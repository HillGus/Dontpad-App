import 'package:flutter/material.dart';
import './buttons/encriptar-switch.dart';
import './buttons/algoritmo-switch.dart';
import './buttons/salvar-button.dart';

class Buttons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Container(
        margin: EdgeInsets.all(8),
        child: Column(
            children: [
              Row(
                  children: [
                    Expanded(
                        child: EncriptarSwitch()
                    ),
                    Expanded(
                        child: AlgoritmoSwitch()
                    )
                  ]
              ),
              SalvarButton()
            ]
        )
    );
  }
}