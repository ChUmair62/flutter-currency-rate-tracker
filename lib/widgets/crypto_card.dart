import 'dart:ui';
import 'package:flutter/material.dart';

class CryptoCard extends StatefulWidget {
  final String name;
  final String symbol;
  final String price;
  final String change;
  final bool positive;

  const CryptoCard({
    super.key,
    required this.name,
    required this.symbol,
    required this.price,
    required this.change,
    required this.positive,
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
        duration: const Duration(milliseconds: 150),
        transform: hovered
            ? (Matrix4.identity()..translate(0, -6))
            : Matrix4.identity(),
        child: AnimatedScale(
          scale: hovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 150),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.white24),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.symbol,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.name,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.price,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: widget.positive
                            ? Colors.green.withOpacity(0.2)
                            : Colors.red.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        widget.change,
                        style: TextStyle(
                          color: widget.positive
                              ? Colors.greenAccent
                              : Colors.redAccent,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
