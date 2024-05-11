import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoMedical extends StatelessWidget {
  const VideoMedical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Medical'),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.video_call,
                  color: Colors.lightBlueAccent,
                ),
                SizedBox(width: 5),
                Text(
                  "Video phòng tránh",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: Center(
                child: VideoPlayerWidget(
                  videoPath: 'assets/videos/video.mp4',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Thuốc lá là nguyên nhân gây ra nhiều bệnh nguy hiểm đặc biệt là có gây ra tử vong.",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  const VideoPlayerWidget({Key? key, required this.videoPath})
      : super(key: key);

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath);
    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
