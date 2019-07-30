import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../redux/app-state.dart';
import '../../redux/actions.dart';
import '../../main.dart';

class SalvarButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return SizedBox(
        width: double.infinity,
        child: StoreConnector<AppState, Store>(
            converter: (store) => store,
            builder: (context, store) {

                return RaisedButton(
                    child: Text(
                        "Salvar",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Constants.textSize
                        )
                    ),
                    color: Colors.lightBlue,
                    onPressed: () {

                        store.dispatch(SaveContentAction());
                    },
                );
            }
        )
    );
  }
}