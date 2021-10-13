import 'package:appsfactory_task/core/actions/search/search_fetch_action.dart';
import 'package:appsfactory_task/core/actions/search/search_load_action.dart';
import 'package:appsfactory_task/data/repositories/app_repository.dart';
import 'package:async/async.dart';
import 'package:redux/redux.dart';

import '../models/app_state.dart';

Middleware<AppState> createStoreSearchMiddleware(
  AppRepository repository,
) {
  return TypedMiddleware<AppState, SearchFetchAction>(
    _search(repository),
  );
}

void Function(
  Store<AppState> store,
  SearchFetchAction action,
  NextDispatcher next,
) _search(
  AppRepository repository,
) {
  CancelableOperation<Store<AppState>>? _operation;
  return (store, action, next) {
    next(action);

    _operation?.cancel();
    store.state.setLoading(true);
    _operation = CancelableOperation.fromFuture(repository
        .search(action.artist)
        .then((result) => store..dispatch(SearchLoadAction(result)))
        .whenComplete(() => store.state.setLoading(false)));
  };
}
