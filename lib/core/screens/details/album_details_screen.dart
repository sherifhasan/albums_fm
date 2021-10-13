import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../data/models/album_details_response.dart';
import '../../../data/services/navigation/navigation_service.dart';
import '../../../database_setup.dart';
import '../../../locator_setup.dart';
import '../../../shared/constants.dart';
import '../../actions/database/database_action.dart';
import '../../models/app_state.dart';
import 'widgets/tracks_list.dart';

class AlbumDetailsScreen extends StatelessWidget {
  AlbumDetailsScreen(this.album, {Key? key}) : super(key: key);
  final AlbumDetailsResponse album;
  final navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<AppState>(
        builder: (BuildContext context, Store<AppState> store) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(album.name),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () => store.dispatch(DatabaseAction(album)),
                  icon: Icon(
                    favouriteBox.containsKey('${album.artist}${album.name}')
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    color:
                        favouriteBox.containsKey('${album.artist}${album.name}')
                            ? Colors.red
                            : Colors.white,
                    size: 32,
                  )),
            ],
          ),
          body: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(16),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: album.imageList != null
                        ? CachedNetworkImage(
                            imageUrl: album.imageList![3].text!,
                            height: 150,
                            fit: BoxFit.cover,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) => Center(
                              child: SizedBox(
                                height: 32,
                                width: 32,
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress),
                              ),
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              AppImages.assetsNotAvailableImage,
                              height: 100,
                            ),
                          )
                        : Image.asset(
                            AppImages.assetsNotAvailableImage,
                            height: 100,
                          )),
              ),
              const Text(
                'Tracks',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              album.tracks != null
                  ? Expanded(flex: 1, child: TracksList(album.tracks!))
                  : const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'No tracks found',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                    ),
            ],
          ),
        ),
      );
    });
  }
}
