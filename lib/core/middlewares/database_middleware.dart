import 'package:redux/redux.dart';

import '../../database_setup.dart';
import '../actions/database/database_action.dart';
import '../models/app_state.dart';

Middleware<AppState> createStoreDatabaseMiddleware() {
  return TypedMiddleware<AppState, DatabaseAction>(
    _handleDatabaseAction(),
  );
}

void Function(
  Store<AppState> store,
  DatabaseAction action,
  NextDispatcher next,
) _handleDatabaseAction() {
  return (store, action, next) {
    next(action);
    store.state.setLoading(true);
    if (favouriteBox.keys.contains(
        '${action.albumDetailsResponse.artist}${action.albumDetailsResponse.name}')) {
      favouriteBox.delete(
          '${action.albumDetailsResponse.artist}${action.albumDetailsResponse.name}');
    } else {
      favouriteBox.put(
          '${action.albumDetailsResponse.artist}${action.albumDetailsResponse.name}',
          action.albumDetailsResponse);
    }
    store.state.setLoading(false);
  };
}
