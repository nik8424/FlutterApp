// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class VideoScreen extends StatefulWidget {
  final String id;

  const VideoScreen({Key? key, required this.id}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        loop: false,
        forceHD: true,
        enableCaption: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: YoutubePlayer(
          width: context.screenWidth,
          controller: _controller,
          aspectRatio: 16 / 9,
          showVideoProgressIndicator: false,
          onReady: () {},
        ),
      ),
    );
  }
}


