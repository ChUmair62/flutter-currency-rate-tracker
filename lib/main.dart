import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'services/currency_api.dart';
import 'utils/top_currencies.dart';

void main() {
  runApp(const CurrencyApp());
}

class CurrencyApp extends StatelessWidget {
  const CurrencyApp({super.key});

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
  late Future<Map<String, dynamic>> ratesFuture;
  late VideoPlayerController videoController;

  bool videoReady = false;
  bool cardHovered = false;

  String selectedCurrency = 'USD';

  final TextEditingController amountController =
      TextEditingController(text: '1');

  double amount = 1.0;

  @override
  void initState() {
    super.initState();

    ratesFuture = CurrencyApi.fetchRates();

    videoController =
        VideoPlayerController.asset('assets/videos/bg.mp4')
          ..initialize().then((_) {
            setState(() {
              videoReady = true;
            });
            videoController
              ..setLooping(true)
              ..setVolume(0)
              ..play();
          });
  }

  @override
  void dispose() {
    amountController.dispose();
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Currency → PKR'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          // ===== VIDEO BACKGROUND =====
          if (videoReady)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: videoController.value.size.width,
                  height: videoController.value.size.height,
                  child: VideoPlayer(videoController),
                ),
              ),
            )
          else
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0F2027),
                    Color(0xFF203A43),
                    Color(0xFF2C5364),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),

          // ===== DARK OVERLAY =====
          Container(color: Colors.black.withOpacity(0.45)),

          // ===== GLASS CARD WITH HOVER =====
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
                  scale: cardHovered ? 1.04 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: BackdropFilter(
                      filter:
                          ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                      child: Container(
                        width: 420,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.08),
                          borderRadius:
                              BorderRadius.circular(18),
                          border:
                              Border.all(color: Colors.white24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.6),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: FutureBuilder<
                            Map<String, dynamic>>(
                          future: ratesFuture,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child:
                                    CircularProgressIndicator(),
                              );
                            }

                            if (!snapshot.hasData ||
                                snapshot.hasError) {
                              return const Text(
                                'Failed to load rates',
                                style: TextStyle(
                                    color: Colors.white),
                              );
                            }

                            final rates = snapshot.data!;

                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment:
                                  CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  'Live Currency Rates',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight:
                                        FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),

                                const SizedBox(height: 24),

                                // ===== GLASS DROPDOWN =====
                                DropdownButtonHideUnderline(
                                  child:
                                      DropdownButton2<String>(
                                    value: selectedCurrency,
                                    isExpanded: true,
                                    buttonStyleData:
                                        ButtonStyleData(
                                      height: 50,
                                      padding:
                                          const EdgeInsets
                                              .symmetric(
                                              horizontal: 12),
                                      decoration:
                                          BoxDecoration(
                                        color: Colors.white
                                            .withOpacity(0.10),
                                        borderRadius:
                                            BorderRadius
                                                .circular(10),
                                        border: Border.all(
                                            color:
                                                Colors.white24),
                                      ),
                                    ),
                                    dropdownStyleData:
                                        DropdownStyleData(
                                      maxHeight: 300,
                                      decoration:
                                          BoxDecoration(
                                        color: Colors.black
                                            .withOpacity(0.40),
                                        borderRadius:
                                            BorderRadius
                                                .circular(14),
                                      ),
                                    ),
                                    items: topCurrencies.entries
                                        .map((entry) {
                                      final currency =
                                          entry.key;
                                      final code =
                                          entry.value;

                                      return DropdownMenuItem<
                                          String>(
                                        value: currency,
                                        child:
                                            _HoverListItem(
                                          child: Row(
                                            children: [
                                              Image.network(
                                                'https://flagcdn.com/w40/$code.png',
                                                width: 26,
                                                height: 18,
                                                fit:
                                                    BoxFit.cover,
                                                errorBuilder:
                                                    (_, __,
                                                            ___) =>
                                                        const Icon(
                                                  Icons.flag,
                                                  size: 18,
                                                  color: Colors
                                                      .white70,
                                                ),
                                              ),
                                              const SizedBox(
                                                  width: 10),
                                              Text(
                                                currency,
                                                style:
                                                    const TextStyle(
                                                        color: Colors
                                                            .white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedCurrency =
                                            value!;
                                      });
                                    },
                                  ),
                                ),

                                const SizedBox(height: 20),

                                // ===== AMOUNT INPUT =====
                                TextField(
                                  controller:
                                      amountController,
                                  keyboardType:
                                      const TextInputType
                                          .numberWithOptions(
                                          decimal: true),
                                  style: const TextStyle(
                                      color: Colors.white),
                                  decoration:
                                      InputDecoration(
                                    hintText:
                                        'Enter amount',
                                    hintStyle:
                                        const TextStyle(
                                            color:
                                                Colors.white54),
                                    filled: true,
                                    fillColor:
                                        Colors.black38,
                                    border:
                                        OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius
                                              .circular(8),
                                      borderSide:
                                          BorderSide.none,
                                    ),
                                  ),
                                  onChanged: (v) {
                                    setState(() {
                                      amount =
                                          double.tryParse(v) ??
                                              1.0;
                                    });
                                  },
                                ),

                                const SizedBox(height: 24),

                                Text(
                                  '$amount $selectedCurrency = '
                                  '${(amount * (1 / rates[selectedCurrency])).toStringAsFixed(2)} PKR',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight:
                                        FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ===== HOVER EFFECT FOR DROPDOWN ITEMS =====
class _HoverListItem extends StatefulWidget {
  final Widget child;
  const _HoverListItem({required this.child});

  @override
  State<_HoverListItem> createState() => _HoverListItemState();
}

class _HoverListItemState extends State<_HoverListItem> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        transform: hovered
            ? (Matrix4.identity()..translate(0, -6))
            : Matrix4.identity(),
        child: AnimatedScale(
          scale: hovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 150),
          child: widget.child,
        ),
      ),
    );
  }
}
