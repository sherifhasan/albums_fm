import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/models/album_details_response.dart';
import 'data/models/image_model.dart';
import 'data/models/track.dart';

Box<AlbumDetailsResponse> favouriteBox =
    Hive.box<AlbumDetailsResponse>("favourites");

Future<void> setupDatabase() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AlbumDetailsResponseAdapter());
  Hive.registerAdapter(TrackAdapter());
  Hive.registerAdapter(ImageModelAdapter());

  await Hive.openBox<AlbumDetailsResponse>("favourites");
}
