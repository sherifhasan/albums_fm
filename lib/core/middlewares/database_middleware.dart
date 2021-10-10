import 'package:appsfactory_task/core/actions/database/database_action.dart';
import 'package:redux/redux.dart';

import '../../database_setup.dart';
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

    store.state.setLoading();
    if (favouriteBox.keys.contains(action.albumDetailsResponse.mbid)) {
      favouriteBox.delete(action.albumDetailsResponse.mbid);
    } else {
      favouriteBox.put(
          action.albumDetailsResponse.mbid, action.albumDetailsResponse);
    }
  };
}
