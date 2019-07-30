import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './app-state.dart';
import './actions.dart';

class HttpMiddleware extends MiddlewareClass<AppState> {

    @override
    void call(Store<AppState> store, action, NextDispatcher next) {

        if (action is ChangePathAction)
            getContent(action, next);
        else if (action is SaveContentAction)
            saveContent(store.state, action, next);

        next(action);
    }

    void getContent(ChangePathAction action, NextDispatcher next) {

        final url = 'http://dontpad.com/${action.path}.body.json?lastUpdate=0';
        print('Request url for get $url');
        http
            .get(url)
            .then((response) {

                final responseBody = json.decode(response.body);
                print('Response body from get to $url: $responseBody');
                next(new ChangeContentAction(responseBody['body'] ?? ''));
            })
            .catchError((err) {

                print('Error occurred on content get to $url: $err');
            });

    }

    void saveContent(AppState state, SaveContentAction action, NextDispatcher next) {

        print('Path: ${state.path}');
        print('Content: ${state.content}');
        if (state.path != null && state.content != null) {

            final url = 'http://dontpad.com/${state.path}';
            final body = 'text=${state.content}';
            final headers = {
                'Content-Type': 'application/x-www-form-urlencoded'
            };
            print('Request url for post $url');
            http
                .post(url, body: body, headers: headers)
                .then((response) {

                    print('Response body from get to $url: ${response.body}');
                    next(action);
                })
                .catchError((err) {

                    print('Error occured on content post to $url: $err');
                    next(action);
                });
        }
    }
}