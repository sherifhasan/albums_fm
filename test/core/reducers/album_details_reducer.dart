import 'dart:convert';

import 'package:appsfactory_task/core/actions/album_details/albums_details_load_action.dart';
import 'package:appsfactory_task/core/models/app_state.dart';
import 'package:appsfactory_task/core/reducers/app_reducer.dart';
import 'package:appsfactory_task/data/models/album_details_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

import '../../data/models/album_details/dummy_data.dart';

void main() {
  test('Load album details into store', () {
    final result =
        AlbumDetailsResponse.fromJson(jsonDecode(albumDetailsJsonString));

    final store = Store<AppState>(
      appReducer,
      initialState: AppState.idle(),
    );

    expect(
        store.state.albumDetailsResponse, const AlbumDetailsResponse.empty());

    store.dispatch(AlbumDetailsLoadAction(result));

    expect(store.state.albumDetailsResponse, result);
  });
}
