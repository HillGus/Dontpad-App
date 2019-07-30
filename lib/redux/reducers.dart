import './app-state.dart';
import './actions.dart';

AppState appReducer(AppState state, action) {

    if (action is ChangePathAction) {
        return changePath(state, action);
    } else if (action is ChangeContentAction) {
        return changeContent(state, action);
    }
    return state;
}

AppState changePath(AppState state, ChangePathAction changePathAction) {

    return cloneState(
        state: state,
        path: changePathAction.path
    );
}

AppState changeContent(AppState state, ChangeContentAction changeContentAction) {

    return cloneState(
        state: state,
        content: changeContentAction.content
    );
}

AppState cloneState({AppState state, String path, String content, bool encrypt, String algorithm}) {

    return new AppState(
        path: path ?? state.path,
        content: content ?? state.content,
        encrypt: encrypt ?? state.encrypt,
        algorithm: algorithm ?? state.algorithm
    );
}