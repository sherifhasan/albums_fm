import 'dart:ui' as ui;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/models/album_details_response.dart';
import '../../../data/services/navigation/navigation_service.dart';
import '../../../locator_setup.dart';

class AlbumDetailsScreen extends StatelessWidget {
  AlbumDetailsScreen(this.album, {Key? key}) : super(key: key);
  final AlbumDetailsResponse album;
  final navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(fit: StackFit.expand, children: [
          Image.network(
            album.imageList[3].text!,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: CachedNetworkImage(
                                  imageUrl: album.imageList[3].text!,
                                  height: 300,
                                  width: 300,
                                  fit: BoxFit.cover,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          Center(
                                    child: SizedBox(
                                      height: 32,
                                      width: 32,
                                      child: CircularProgressIndicator(
                                          value: downloadProgress.progress),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ))),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 20.0,
                                  offset: Offset(0.0, 10.0))
                            ]),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 0.0),
                        child: Text(
                          album.name,
                          maxLines: 2,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Tracks',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 8),
                      // SizedBox(
                      //     height: 250,
                      //     child: OpeningTimeList(
                      //         album.openingTimes.standardOpeningTimes)),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => navigationService.pop(),
                      icon: const Icon(
                        CupertinoIcons.back,
                        color: Colors.white,
                        size: 32,
                      )),
                  IconButton(
                      onPressed: () => navigationService.pop(),
                      icon: const Icon(
                        Icons.favorite_outline,
                        color: Colors.white,
                        size: 32,
                      )),
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}
