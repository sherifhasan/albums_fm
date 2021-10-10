import 'package:redux/redux.dart';

import '../../data/models/artist_top_albums_response.dart';
import '../actions/top_albums/top_albums_load_action.dart';

final topAlbumsReducer =
    TypedReducer<ArtistTopAlbums, TopAlbumsLoadAction>(_setLoadedResult);

ArtistTopAlbums _setLoadedResult(
    ArtistTopAlbums artistTopAlbums, TopAlbumsLoadAction action) {
  return action.artistTopAlbums ?? const ArtistTopAlbums.empty();
}
