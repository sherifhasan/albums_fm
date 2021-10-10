import 'core/reducers/album_details_reducer.dart' as album_details_reducer;
import 'core/reducers/search_reducer.dart' as search_reducer;
import 'core/reducers/top_albums_reducer.dart' as top_albums_reducer;

void main() {
  album_details_reducer.main();
  search_reducer.main();
  top_albums_reducer.main();
}
