// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerApp extends StatefulWidget {
  const VideoPlayerApp({Key? key}) : super(key: key);

  @override
  State<VideoPlayerApp> createState() => _VideoPlayerAppState();
}

class _VideoPlayerAppState extends State<VideoPlayerApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Player',
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
    );
    // Initielize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const Drawer(),
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Player'),
        backgroundColor: MyTheme.darkBluishColor,
      ),
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: Center(
        child: Stack(
          children: <Widget>[
            Center(
                child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the video.
                  return AspectRatio(
                    aspectRatio: 16 / 9,

                    // Use the VideoPlayer widget to display the video.
                    child: VideoPlayer(_controller),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )),
            Container(
              alignment: const Alignment(-0.5, 0.6),
              child: ButtonTheme(
                splashColor: Colors.white70,
                buttonColor: MyTheme.darkBluishColor,
                height: 40.0,
                minWidth: 20.0,
                padding: const EdgeInsets.all(5.0),
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      // If the video is playing, pause it.
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        // If the video is paused, play it.
                        _controller.play();
                      }
                    });
                  },
                  child: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              alignment: const Alignment(-0.1, 0.6),
              child: ButtonTheme(
                splashColor: Colors.white70,
                buttonColor: MyTheme.darkBluishColor,
                height: 40.0,
                minWidth: 20.0,
                padding: const EdgeInsets.all(5.0),
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      // If the video is playing, pause it.
                      if (_controller.value.isPlaying) {
                        _controller.seekTo(const Duration(seconds: 5) +
                            _controller.value.position);
                      } else {
                        // If the video is paused, play it.
                        _controller.pause();
                      }
                    });
                  },
                  child: Icon(
                    _controller.value.isPlaying
                        ? Icons.arrow_forward_ios_rounded
                        : Icons.arrow_forward_ios_rounded,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              alignment: const Alignment(-0.9, 0.6),
              child: ButtonTheme(
                splashColor: Colors.white70,
                buttonColor: MyTheme.darkBluishColor,
                height: 40.0,
                minWidth: 20.0,
                padding: const EdgeInsets.all(5.0),
                child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      if (_controller.value.isPlaying) {
                        _controller.seekTo(const Duration(seconds: -3) +
                            _controller.value.position);
                      } else {
                        // If the video is paused, play it.
                        _controller.pause();
                      }
                    });
                  },
                  child: Icon(
                    _controller.value.isPlaying
                        ? Icons.arrow_back_ios_rounded
                        : Icons.arrow_back_ios_rounded,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              alignment: const Alignment(1, 0.45),
              child: ProgressBar(
                timeLabelLocation: TimeLabelLocation.sides,
                progressBarColor: Colors.black,
                thumbColor: Colors.black,
                baseBarColor: Colors.black,
                progress:
                    Duration(seconds: _controller.value.position.inSeconds),
                buffered: const Duration(seconds: 1),
                total: Duration(seconds: _controller.value.duration.inSeconds),
              ).p20(),
            ),
            Container(
              // ignore: prefer_const_constructors
              alignment: Alignment(1, 0.33),
              padding: const EdgeInsets.only(right: 10.0, left: 10.0),
              child: VideoProgressIndicator(
                _controller,
                allowScrubbing: true,
                colors: const VideoProgressColors(
                  playedColor: Colors.red,
                  bufferedColor: Colors.white12,
                  backgroundColor: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
