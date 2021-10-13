import 'package:flutter/material.dart';

import '../../../../data/models/track.dart';
import 'track_item.dart';

class TracksList extends StatelessWidget {
  const TracksList(this.tracksList, {Key? key}) : super(key: key);
  final List<Track> tracksList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tracksList.length,
        itemBuilder: (BuildContext context, int index) =>
            TrackItem(tracksList[index]));
  }
}
