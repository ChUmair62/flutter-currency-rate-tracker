import 'dart:ui';
import 'package:flutter/material.dart';

class CryptoSection extends StatelessWidget {
  const CryptoSection({super.key});

  // ===== TOP 20 CRYPTO DATA =====
  static final List<Map<String, String>> cryptoList = [
    {'symbol': 'BTC', 'name': 'Bitcoin'},
    {'symbol': 'ETH', 'name': 'Ethereum'},
    {'symbol': 'USDT', 'name': 'Tether'},
    {'symbol': 'BNB', 'name': 'BNB'},
    {'symbol': 'SOL', 'name': 'Solana'},
    {'symbol': 'XRP', 'name': 'XRP'},
    {'symbol': 'USDC', 'name': 'USD Coin'},
    {'symbol': 'ADA', 'name': 'Cardano'},
    {'symbol': 'AVAX', 'name': 'Avalanche'},
    {'symbol': 'DOGE', 'name': 'Dogecoin'},
    {'symbol': 'TRX', 'name': 'TRON'},
    {'symbol': 'TON', 'name': 'Toncoin'},
    {'symbol': 'DOT', 'name': 'Polkadot'},
    {'symbol': 'MATIC', 'name': 'Polygon'},
    {'symbol': 'LTC', 'name': 'Litecoin'},
    {'symbol': 'SHIB', 'name': 'Shiba Inu'},
    {'symbol': 'BCH', 'name': 'Bitcoin Cash'},
    {'symbol': 'LINK', 'name': 'Chainlink'},
    {'symbol': 'XLM', 'name': 'Stellar'},
    {'symbol': 'UNI', 'name': 'Uniswap'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),

        // ===== SECTION TITLE =====
        const Text(
          'Crypto Market',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 30),

        // ===== HORIZONTAL CRYPTO CARDS =====
        SizedBox(
          height: 340, // same as currency cards
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: cryptoList.length,
            itemBuilder: (context, index) {
              final crypto = cryptoList[index];
              return CryptoCard(
                symbol: crypto['symbol']!,
                name: crypto['name']!,
              );
            },
          ),
        ),
      ],
    );
  }
}

// ===== CRYPTO CARD (SAME SIZE AS CURRENCY) =====
class CryptoCard extends StatefulWidget {
  final String symbol;
  final String name;

  const CryptoCard({
    super.key,
    required this.symbol,
    required this.name,
  });

  @override
  State<CryptoCard> createState() => _CryptoCardState();
}

class _CryptoCardState extends State<CryptoCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
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
                aspectRatio: 1, // PERFECT SQUARE
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white24),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.currency_bitcoin,
                        color: Colors.white,
                        size: 48,
                      ),
                      const SizedBox(height: 14),
                      Text(
                        widget.symbol,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        widget.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
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
    );
  }
}
