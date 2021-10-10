import 'package:redux/redux.dart';

import '../../data/models/artist_search_response.dart';
import '../actions/search/search_load_action.dart';

final searchReducer =
    TypedReducer<ArtistSearchResponse, SearchLoadAction>(_setLoadedResult);

ArtistSearchResponse _setLoadedResult(
    ArtistSearchResponse searchResponse, SearchLoadAction action) {
  return action.artistSearchResponse ?? const ArtistSearchResponse.empty();
}
