import 'package:flutter/material.dart';
import 'crypto_card.dart';

class CryptoSection extends StatelessWidget {
  const CryptoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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

        const SizedBox(height: 16),

        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            CryptoCard(
              name: 'Bitcoin',
              symbol: 'BTC',
              iconUrl:
                  'https://assets.coingecko.com/coins/images/1/large/bitcoin.png',
              price: '\$43,200',
              change: '+2.3%',
              isPositive: true,
            ),
            CryptoCard(
              name: 'Ethereum',
              symbol: 'ETH',
              iconUrl:
                  'https://assets.coingecko.com/coins/images/279/large/ethereum.png',
              price: '\$2,300',
              change: '-1.1%',
              isPositive: false,
            ),
            CryptoCard(
              name: 'BNB',
              symbol: 'BNB',
              iconUrl:
                  'https://assets.coingecko.com/coins/images/825/large/binance-coin-logo.png',
              price: '\$320',
              change: '+0.8%',
              isPositive: true,
            ),
            CryptoCard(
              name: 'Solana',
              symbol: 'SOL',
              iconUrl:
                  'https://assets.coingecko.com/coins/images/4128/large/solana.png',
              price: '\$98',
              change: '+4.2%',
              isPositive: true,
            ),
          ],
        ),
      ],
    );
  }
}
