import 'package:appsfactory_task/core/screens/details/widgets/track_item.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/track.dart';

class TracksList extends StatelessWidget {
  const TracksList(this.tracksList, {Key? key}) : super(key: key);
  final List<Track> tracksList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tracksList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) =>
            TrackItem(tracksList[index]));
  }
}
