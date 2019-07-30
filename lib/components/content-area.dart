import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../redux/app-state.dart';
import '../redux/actions.dart';
import '../main.dart';

class ContentArea extends StatelessWidget {

    @override
    Widget build(BuildContext context) {

        final controller = new TextEditingController();
        var dispatchedText = false;

        return Container(
            margin: EdgeInsets.all(8),
            child: StoreConnector<AppState, Store>(
                converter: (store) => store,
                builder: (context, store) {

                    if (!dispatchedText)
                        controller.text = store.state.content;
                    else
                        dispatchedText = false;

                    return TextField(
                        onChanged: (text) {
                            dispatchedText = true;
                            store.dispatch(ChangeContentAction(text));
                        },
                        controller: controller,
                        maxLines: null,
                        minLines: null,
                        keyboardType: TextInputType.multiline,
                        textAlignVertical: TextAlignVertical(y: -1),
                        style: TextStyle(
                            fontSize: Constants.textSize,
                        ),
                        decoration: decoration()
                    );
                },
            )
        );
    }
}

InputDecoration decoration() {

    return InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Conteúdo",
        labelStyle: TextStyle(
            fontSize: Constants.textSize
        ),
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.all(12)
    );
}