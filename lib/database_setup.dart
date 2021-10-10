import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/models/album_details_response.dart';

Box<AlbumDetailsResponse> favouriteBox =
    Hive.box<AlbumDetailsResponse>("favourites");

Future<void> setupDatabase() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AlbumDetailsResponseAdapter());
  await Hive.openBox<AlbumDetailsResponse>("favourites");
}
