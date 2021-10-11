import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../data/models/track.dart';

class TrackItem extends StatelessWidget {
  const TrackItem(this.track, {Key? key}) : super(key: key);
  final Track track;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  track.name,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              const SizedBox(width: 15),
              Text(
                (track.duration / 60).toStringAsFixed(2),
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
          GestureDetector(
            onTap: () async {
              if (await canLaunch(track.url)) {
                launch(track.url);
              } else {
                Fluttertoast.showToast(
                    msg: 'Could not open the track.',
                    fontSize: 14,
                    toastLength: Toast.LENGTH_LONG,
                    timeInSecForIosWeb: 2,
                    textColor: Colors.white,
                    backgroundColor: Colors.redAccent);
              }
            },
          )
        ],
      ),
    );
  }
}
