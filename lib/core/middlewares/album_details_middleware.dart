import 'dart:async';

import 'package:appsfactory_task/core/actions/album_details/albums_details_fetch_action.dart';
import 'package:appsfactory_task/core/actions/album_details/albums_details_load_action.dart';
import 'package:appsfactory_task/data/repositories/app_repository.dart';
import 'package:async/async.dart';
import 'package:redux/redux.dart';

import '../models/app_state.dart';

Middleware<AppState> createStoreAlbumDetailsMiddleware(
  AppRepository repository,
) {
  return TypedMiddleware<AppState, AlbumDetailsFetchAction>(
    _fetchAlbumDetails(repository),
  );
}

void Function(
  Store<AppState> store,
  AlbumDetailsFetchAction action,
  NextDispatcher next,
) _fetchAlbumDetails(
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
          .getAlbumDetails(action.mbid)
          .then((result) => store..dispatch(AlbumDetailsLoadAction(result))));
    });
  };
}
