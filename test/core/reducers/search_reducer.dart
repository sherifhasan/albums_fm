import 'dart:convert';

import 'package:appsfactory_task/core/actions/search/search_load_action.dart';
import 'package:appsfactory_task/core/models/app_state.dart';
import 'package:appsfactory_task/core/reducers/app_reducer.dart';
import 'package:appsfactory_task/data/models/artist_search_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redux/redux.dart';

import '../../data/models/artist_search/dummy_data.dart';

void main() {
  test('Load artist search into store', () {
    final result =
        ArtistSearchResponse.fromJson(jsonDecode(artistSearchJsonString));

    final store = Store<AppState>(
      appReducer,
      initialState: AppState.idle(),
    );

    expect(
        store.state.artistSearchResponse, const ArtistSearchResponse.empty());

    store.dispatch(SearchLoadAction(result));

    expect(store.state.artistSearchResponse, result);
  });
}
