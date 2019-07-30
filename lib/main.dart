import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import './components/dontpad-title.dart';
import './components/path-input.dart';
import './components/content-area.dart';
import './components/buttons.dart';

import './redux/app-state.dart';
import './redux/reducers.dart';
import './redux/middleware.dart';

void main() {

    final store = new Store<AppState>(
        appReducer,
        initialState: AppState(),
        middleware: [
            HttpMiddleware()
        ]
    );
    runApp(DontpadApp(store: store));
}

class DontpadApp extends StatelessWidget {

    final Store store;

    DontpadApp({Key key, this.store}): super(key: key);

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Dontpad',
            home: Scaffold(
                body: StoreProvider<AppState>(
                    store: store,
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                            DontpadTitle(),
                            PathInput(),
                            Expanded(
                                child: SingleChildScrollView(
                                    child: ContentArea()
                                )
                            ),
                            Buttons()
                        ]
                    )
                )
            ),
        );
    }
}

class Constants {

  static double textSize = 16;
}