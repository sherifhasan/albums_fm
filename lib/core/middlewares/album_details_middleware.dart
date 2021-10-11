import 'dart:async';

import 'package:async/async.dart';
import 'package:redux/redux.dart';

import '../../data/models/album_details_response.dart';
import '../../data/repositories/app_repository.dart';
import '../../data/services/navigation/navigation_service.dart';
import '../../locator_setup.dart';
import '../../shared/routes.dart';
import '../actions/album_details/albums_details_fetch_action.dart';
import '../actions/album_details/albums_details_load_action.dart';
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
  NavigationService _navigationService = locator<NavigationService>();
  return (store, action, next) {
    next(action);

    _timer?.cancel();
    _operation?.cancel();
    store.state.setLoading();
    _timer = Timer(const Duration(milliseconds: 250), () {
      _operation = CancelableOperation.fromFuture(repository
          .getAlbumDetails(action.artist, action.albumName)
          .then((result) => store..dispatch(AlbumDetailsLoadAction(result))));
      if (store.state.albumDetailsResponse !=
          const AlbumDetailsResponse.empty()) {
        _navigationService.pushNamed(
          RoutePaths.details,
          arguments: store.state.albumDetailsResponse,
        );
      }
    });
  };
}
