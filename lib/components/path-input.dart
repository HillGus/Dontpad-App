import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../redux/actions.dart';
import '../redux/app-state.dart';
import '../main.dart';

class PathInput extends StatelessWidget {

    @override
    Widget build(BuildContext context) {

        final controller = new TextEditingController();

        return Container(
            margin: EdgeInsets.all(8),
            child: StoreConnector<AppState, Store<AppState>>(
                converter: (store) => store,
                builder: (context, store) {

                    controller.text = store.state.path;

                    return TextField(
                        onSubmitted: (text) {
                            store.dispatch(ChangePathAction(text));
                        },
                        controller: controller,
                        style: TextStyle(
                            fontSize: Constants.textSize
                        ),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Caminho",
                            labelStyle: TextStyle(
                                fontSize: Constants.textSize
                            ),
                            contentPadding: EdgeInsets.all(12)
                        ),
                    );
                }
            )
    );
  }
}