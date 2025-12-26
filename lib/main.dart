import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'sections/crypto_section.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CurrencyPage(),
    );
  }
}

class CurrencyPage extends StatefulWidget {
  const CurrencyPage({super.key});

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  double amount = 1.0;

  late VideoPlayerController _videoController;

  final List<Map<String, String>> currencies = [
    {'code': 'USD', 'flag': 'us'},
    {'code': 'EUR', 'flag': 'eu'},
    {'code': 'GBP', 'flag': 'gb'},
    {'code': 'JPY', 'flag': 'jp'},
    {'code': 'AUD', 'flag': 'au'},
    {'code': 'CAD', 'flag': 'ca'},
    {'code': 'CHF', 'flag': 'ch'},
    {'code': 'CNY', 'flag': 'cn'},
    {'code': 'INR', 'flag': 'in'},
    {'code': 'SAR', 'flag': 'sa'},
    {'code': 'AED', 'flag': 'ae'},
    {'code': 'KWD', 'flag': 'kw'},
    {'code': 'QAR', 'flag': 'qa'},
    {'code': 'SGD', 'flag': 'sg'},
    {'code': 'MYR', 'flag': 'my'},
    {'code': 'THB', 'flag': 'th'},
    {'code': 'KRW', 'flag': 'kr'},
    {'code': 'SEK', 'flag': 'se'},
    {'code': 'NOK', 'flag': 'no'},
    {'code': 'NZD', 'flag': 'nz'},
  ];

  String selectedCurrency = 'USD';
  double rateToPKR = 280.0; // placeholder
  final TextEditingController amountController =
      TextEditingController(text: '1');

  @override
  void initState() {
    super.initState();
    _videoController =
        VideoPlayerController.asset('assets/videos/bg.mp4')
          ..initialize().then((_) {
            _videoController
              ..setLooping(true)
              ..setVolume(0)
              ..play();
            setState(() {});
          });
  }

  @override
  void dispose() {
    _videoController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // ===== VIDEO BACKGROUND =====
          if (_videoController.value.isInitialized)
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
          Container(color: Colors.black.withOpacity(0.6)),

          // ===== CONTENT =====
          SingleChildScrollView(
  child: Center(
    child: ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
      ),
      child: IntrinsicHeight(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 🔥 vertical centering
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // ===== SECTION TITLE =====
            const Text(
              'Currencies',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            // ===== HORIZONTAL CURRENCY CARDS =====
            SizedBox(
              height: 340, // MUST be >= card size
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: currencies.length,
                itemBuilder: (context, index) {
                  final currency = currencies[index];
                  final isSelected =
                      currency['code'] == selectedCurrency;

                  return CurrencyCard(
                    code: currency['code']!,
                    flagCode: currency['flag']!,
                    selected: isSelected,
                    onTap: () {
                      setState(() {
                        selectedCurrency = currency['code']!;
                        rateToPKR = 280.0 + index; // placeholder
                      });
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 40),

            // ===== CALCULATION BOX (RECTANGULAR) =====
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                  child: Container(
                    width: 360,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // 🔒 no overflow
                      children: [
                        Text(
                          '$selectedCurrency → PKR',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 12),

                        TextField(
                          controller: amountController,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              amount =
                                  double.tryParse(value) ?? 1.0;
                            });
                          },
                          style:
                              const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Enter amount',
                            hintStyle: const TextStyle(
                                color: Colors.white54),
                            filled: true,
                            fillColor:
                                Colors.black.withOpacity(0.35),
                            contentPadding:
                                const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),

                        const SizedBox(height: 14),

                        Text(
                          '$amount $selectedCurrency = ${(amount * rateToPKR).toStringAsFixed(2)} PKR',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
            // ===== CRYPTO SECTION =====
const CryptoSection(),

          ],
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

// ===== CURRENCY CARD =====
// ===== CURRENCY CARD (FIXED & STABLE) =====
class CurrencyCard extends StatefulWidget {
  final String code;
  final String flagCode;
  final bool selected;
  final VoidCallback onTap;

  const CurrencyCard({
    super.key,
    required this.code,
    required this.flagCode,
    required this.selected,
    required this.onTap,
  });

  @override
  State<CurrencyCard> createState() => _CurrencyCardState();
}

class _CurrencyCardState extends State<CurrencyCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(right: 20),
          transform: hovered
              ? (Matrix4.identity()..translate(0, -10))
              : Matrix4.identity(),
          child: AnimatedScale(
            scale: hovered ? 1.05 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: AspectRatio(
                  aspectRatio: 1, // 🔒 PERFECT SQUARE
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: widget.selected
                          ? Colors.white.withOpacity(0.18)
                          : Colors.white.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: widget.selected
                            ? Colors.greenAccent
                            : Colors.white24,
                        width: 1.5,
                      ),
                    ),
                    child:Column(
  mainAxisAlignment: MainAxisAlignment.center,
  mainAxisSize: MainAxisSize.min,
  children: [
    Flexible(
      child: Image.network(
        'https://flagcdn.com/w80/${widget.flagCode}.png',
        width: 100,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) =>
            const Icon(Icons.flag, color: Colors.white, size: 40),
      ),
    ),
    const SizedBox(height: 12),
    Text(
      widget.code,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
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
    );
  }
}
