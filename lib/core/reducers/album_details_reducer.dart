import 'package:redux/redux.dart';

import '../../data/models/album_details_response.dart';
import '../actions/album_details/albums_details_load_action.dart';

final albumDetailsReducer =
    TypedReducer<AlbumDetailsResponse, AlbumDetailsLoadAction>(
        _setLoadedResult);

AlbumDetailsResponse _setLoadedResult(
    AlbumDetailsResponse albumDetailsResponse, AlbumDetailsLoadAction action) {
  return action.albumDetailsResponse ?? const AlbumDetailsResponse.empty();
}
