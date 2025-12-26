import 'package:flutter/material.dart';
import 'crypto_card.dart';

class CryptoSection extends StatelessWidget {
  const CryptoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 700;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Crypto Market',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          GridView.count(
            crossAxisCount: isWide ? 4 : 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            children: const [
              CryptoCard(
                name: 'Bitcoin',
                symbol: 'BTC',
                price: '\$43,200',
                change: '+2.3%',
                positive: true,
              ),
              CryptoCard(
                name: 'Ethereum',
                symbol: 'ETH',
                price: '\$2,300',
                change: '-1.1%',
                positive: false,
              ),
              CryptoCard(
                name: 'BNB',
                symbol: 'BNB',
                price: '\$320',
                change: '+0.8%',
                positive: true,
              ),
              CryptoCard(
                name: 'Solana',
                symbol: 'SOL',
                price: '\$98',
                change: '+4.2%',
                positive: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
