import 'package:flutter/material.dart';
import 'package:audio_manager/audio_manager.dart';

class MusicController extends StatelessWidget {
  final AudioManager audioManagerInstance;

  MusicController(this.audioManagerInstance);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              radius: 30,
              child: Center(
                child: IconButton(
                  onPressed: () async {
                    await audioManagerInstance.playOrPause();
                  },
                  icon: Icon(
                    audioManagerInstance.isPlaying ? Icons.pause : Icons.play_arrow,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
