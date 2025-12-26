// Video player package
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';


// Widget for reusable video background
class VideoBackground extends StatefulWidget {
  const VideoBackground({super.key});

  @override
  State<VideoBackground> createState() => _VideoBackgroundState();
}

class _VideoBackgroundState extends State<VideoBackground> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize video from assets
    _controller = VideoPlayerController.asset(
      'assets/videos/bg.mp4',
    )
      ..initialize().then((_) {
        setState(() {});
      })
      ..setLooping(true) // Loop video
      ..setVolume(0)     // Mute sound
      ..play();          // Auto play
  }

  @override
  void dispose() {
    // Dispose controller to free memory
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Show video only when ready
    if (!_controller.value.isInitialized) {
      return const SizedBox.shrink();
    }

    return SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: _controller.value.size.width,
          height: _controller.value.size.height,
          child: VideoPlayer(_controller),
        ),
      ),
    );
  }
}
