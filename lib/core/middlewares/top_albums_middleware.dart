import 'dart:async';

import 'package:appsfactory_task/core/actions/top_albums/top_albums_fetch_action.dart';
import 'package:appsfactory_task/core/actions/top_albums/top_albums_load_action.dart';
import 'package:appsfactory_task/data/repositories/app_repository.dart';
import 'package:async/async.dart';
import 'package:redux/redux.dart';

import '../models/app_state.dart';

Middleware<AppState> createStoreTopAlbumsMiddleware(
  AppRepository repository,
) {
  return TypedMiddleware<AppState, TopAlbumsFetchAction>(
    _fetchTopAlbums(repository),
  );
}

void Function(
  Store<AppState> store,
  TopAlbumsFetchAction action,
  NextDispatcher next,
) _fetchTopAlbums(
  AppRepository repository,
) {
  Timer? _timer;
  CancelableOperation<Store<AppState>>? _operation;
  return (store, action, next) {
    next(action);

    _timer?.cancel();
    _operation?.cancel();
    store.state.setLoading();
    _timer = Timer(const Duration(milliseconds: 250), () {
      _operation = CancelableOperation.fromFuture(repository
          .getTopAlbums(action.artist)
          .then((result) => store..dispatch(TopAlbumsLoadAction(result))));
    });
  };
}
