import 'package:async/async.dart';
import 'package:redux/redux.dart';

import '../../data/repositories/app_repository.dart';
import '../actions/top_albums/top_albums_fetch_action.dart';
import '../actions/top_albums/top_albums_load_action.dart';
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
  CancelableOperation<Store<AppState>>? _operation;
  return (store, action, next) {
    next(action);

    _operation?.cancel();
    store.state.setLoading(true);
    _operation = CancelableOperation.fromFuture(repository
        .getTopAlbums(action.artist)
        .then((result) => store..dispatch(TopAlbumsLoadAction(result)))
        .whenComplete(() => store.state.setLoading(false)));
  };
}
