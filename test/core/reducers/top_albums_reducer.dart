import 'dart:convert';

import 'package:appsfactory_task/core/actions/top_albums/top_albums_load_action.dart';
import 'package:appsfactory_task/core/models/app_state.dart';
import 'package:appsfactory_task/core/reducers/app_reducer.dart';
import 'package:appsfactory_task/data/models/artist_top_albums_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

import '../../data/models/top_albums/dummy_data.dart';

void main() {
  test('Load artist top albums into store', () {
    final result =
        ArtistTopAlbums.fromJson(jsonDecode(artistTopAlbumsJsonString));

    final store = Store<AppState>(
      appReducer,
      initialState: AppState.idle(),
    );

    expect(store.state.artistTopAlbums, const ArtistTopAlbums.empty());

    store.dispatch(TopAlbumsLoadAction(result));

    expect(store.state.artistTopAlbums, result);
  });
}
