import 'dart:io';

import 'package:appsfactory_task/data/models/album_details_response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:redux/redux.dart';

import '../../database_setup.dart';
import '../actions/database/database_action.dart';
import '../models/app_state.dart';

Middleware<AppState> createStoreDatabaseMiddleware() {
  return TypedMiddleware<AppState, DatabaseAction>(
    _handleDatabaseAction(),
  );
}

void Function(
  Store<AppState> store,
  DatabaseAction action,
  NextDispatcher next,
) _handleDatabaseAction() {
  return (store, action, next) async {
    next(action);

    store.state.setLoading();
    if (favouriteBox.keys.contains(action.albumDetailsResponse.mbid)) {
      if (action.albumDetailsResponse.imagePath != null) {
        await deleteImage(action.albumDetailsResponse.imagePath!);
      }
      favouriteBox.delete(action.albumDetailsResponse.mbid);
    } else {
      final jsonData = action.albumDetailsResponse.toJson();
      if (action.albumDetailsResponse.imageList != null &&
          (action.albumDetailsResponse.imageList![3].text != null &&
              action.albumDetailsResponse.imageList![3].text!.isNotEmpty)) {
        jsonData["imagePath"] =
            await saveImage(action.albumDetailsResponse.imageList![3].text!);
      }

      favouriteBox.put(action.albumDetailsResponse.mbid,
          AlbumDetailsResponse.fromJson(jsonData));
    }
  };
}

Future<String> saveImage(String imageUrl) async {
  final response = await http.get(Uri.parse(imageUrl));

  final imageName = path.basename(imageUrl);
  final appDir = await path_provider.getApplicationDocumentsDirectory();

  final localPath = path.join(appDir.path, imageName);

  debugPrint('Image path: $localPath');
  final imageFile = File(localPath);
  await imageFile.writeAsBytes(response.bodyBytes);
  return localPath;
}

Future<void> deleteImage(String imageUrl) async {
  final imageFile = File(imageUrl);
  await imageFile.delete();
}
