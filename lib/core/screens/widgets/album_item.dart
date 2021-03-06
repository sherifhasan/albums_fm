import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../shared/constants.dart';

class AlbumItem extends StatelessWidget {
  const AlbumItem(this.albumName,
      {Key? key, this.networkImageUrl, this.openDetails})
      : super(key: key);

  final VoidCallback? openDetails;

  final String albumName;
  final String? networkImageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 16),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: openDetails,
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(16.0)),
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: networkImageUrl != null
                            ? CachedNetworkImage(
                                imageUrl: networkImageUrl!,
                                fit: BoxFit.fitWidth,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                  child: SizedBox(
                                    height: 32,
                                    width: 32,
                                    child: CircularProgressIndicator(
                                        value: downloadProgress.progress),
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                  AppImages.assetsNotAvailableImage,
                                  height: 100,
                                ),
                              )
                            : Image.asset(
                                AppImages.assetsNotAvailableImage,
                                height: 100,
                              ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16, top: 8, bottom: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  albumName,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
