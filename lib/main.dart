import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'widgets/crypto_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late VideoPlayerController _videoController;
  bool videoReady = false;
  bool cardHovered = false;

  @override
  void initState() {
    super.initState();
    _videoController =
        VideoPlayerController.asset('assets/videos/bg.mp4')
          ..initialize().then((_) {
            setState(() => videoReady = true);
            _videoController
              ..setLooping(true)
              ..setVolume(0)
              ..play();
          });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Currency → PKR'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // ===== VIDEO BACKGROUND =====
          if (videoReady)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _videoController.value.size.width,
                  height: _videoController.value.size.height,
                  child: VideoPlayer(_videoController),
                ),
              ),
            ),

          // ===== DARK OVERLAY =====
          Container(color: Colors.black.withOpacity(0.5)),

          // ===== CONTENT =====
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                // ===== MAIN CURRENCY CARD =====
                Center(
                  child: MouseRegion(
                    onEnter: (_) => setState(() => cardHovered = true),
                    onExit: (_) => setState(() => cardHovered = false),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      transform: cardHovered
                          ? (Matrix4.identity()..translate(0, -12))
                          : Matrix4.identity(),
                      child: AnimatedScale(
                        scale: cardHovered ? 1.03 : 1.0,
                        duration: const Duration(milliseconds: 200),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                            child: Container(
                              width: 420,
                              padding: const EdgeInsets.all(24),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.08),
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(color: Colors.white24),
                              ),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.stretch,
                                children: const [
                                  Text(
                                    'Live Currency Rates',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 24),
                                  Text(
                                    'Currency → PKR logic here',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 50),

                // ===== CRYPTO SECTION =====
                const CryptoSection(),

                const SizedBox(height: 60),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
