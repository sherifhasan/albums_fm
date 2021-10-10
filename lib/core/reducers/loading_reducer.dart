import 'package:redux/redux.dart';

import '../actions/album_details/albums_details_load_action.dart';
import '../actions/search/search_load_action.dart';
import '../actions/top_albums/top_albums_load_action.dart';

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, SearchLoadAction>(_setLoaded),
  TypedReducer<bool, AlbumDetailsLoadAction>(_setLoaded),
  TypedReducer<bool, TopAlbumsLoadAction>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
  return false;
}
