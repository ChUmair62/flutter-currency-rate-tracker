import 'dart:ui';
import 'package:flutter/material.dart';

class StockCard extends StatefulWidget {
  final String symbol;
  final String name;
  final String logoUrl;
  final double price;
  final double change24h;

  const StockCard({
    super.key,
    required this.symbol,
    required this.name,
    required this.logoUrl,
    required this.price,
    required this.change24h,
  });

  @override
  State<StockCard> createState() => _StockCardState();
}

class _StockCardState extends State<StockCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final bool positive = widget.change24h >= 0;

    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(right: 20),
        transform:
            hovered ? (Matrix4.identity()..translate(0, -10)) : Matrix4.identity(),
        child: AnimatedScale(
          scale: hovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
              child: SizedBox(
                width: 300,
                height: 340,
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
                      Image.network(
                        widget.logoUrl,
                        width: 48,
                        height: 48,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) =>
                            const Icon(Icons.business,
                                color: Colors.white, size: 40),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.symbol,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '\$${widget.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${positive ? '+' : ''}${widget.change24h.toStringAsFixed(2)}%',
                        style: TextStyle(
                          color: positive
                              ? Colors.greenAccent
                              : Colors.redAccent,
                          fontSize: 13,
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
    );
  }
}
