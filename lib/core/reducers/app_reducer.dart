import '../models/app_state.dart';
import 'album_details_reducer.dart';
import 'loading_reducer.dart';
import 'search_reducer.dart';
import 'top_albums_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
      isLoading: loadingReducer(state.isLoading, action),
      albumDetailsResponse:
          albumDetailsReducer(state.albumDetailsResponse, action),
      artistSearchResponse: searchReducer(state.artistSearchResponse, action),
      artistTopAlbums: topAlbumsReducer(state.artistTopAlbums, action));
}
