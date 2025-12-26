import 'package:flutter/material.dart';
import '../widgets/crypto_card.dart';


class CryptoSection extends StatelessWidget {
  const CryptoSection({super.key});

  // ===== TOP 20 CRYPTO (PLACEHOLDER DATA) =====
 static final List<Map<String, dynamic>> cryptoList = [
  {'symbol': 'BTC', 'name': 'Bitcoin', 'price': 43200.0, 'change': 2.3, 'logo': 'https://s2.coinmarketcap.com/static/img/coins/64x64/1.png'},
  {'symbol': 'ETH', 'name': 'Ethereum', 'price': 2300.0, 'change': -1.1, 'logo': 'https://s2.coinmarketcap.com/static/img/coins/64x64/1027.png'},
  {'symbol': 'USDT', 'name': 'Tether', 'price': 1.0, 'change': 0.0, 'logo': 'https://s2.coinmarketcap.com/static/img/coins/64x64/825.png'},
  {'symbol': 'BNB', 'name': 'BNB', 'price': 320.0, 'change': 0.8, 'logo': 'https://s2.coinmarketcap.com/static/img/coins/64x64/1839.png'},
  {'symbol': 'SOL', 'name': 'Solana', 'price': 98.0, 'change': 4.2, 'logo': 'https://s2.coinmarketcap.com/static/img/coins/64x64/5426.png'},
  {'symbol': 'XRP', 'name': 'XRP', 'price': 0.62, 'change': -0.4, 'logo': 'https://s2.coinmarketcap.com/static/img/coins/64x64/52.png'},
  {'symbol': 'USDC', 'name': 'USD Coin', 'price': 1.0, 'change': 0.0, 'logo': 'https://s2.coinmarketcap.com/static/img/coins/64x64/3408.png'},
  {'symbol': 'ADA', 'name': 'Cardano', 'price': 0.52, 'change': 1.6, 'logo': 'https://s2.coinmarketcap.com/static/img/coins/64x64/2010.png'},
  {'symbol': 'AVAX', 'name': 'Avalanche', 'price': 36.0, 'change': 3.1, 'logo': 'https://s2.coinmarketcap.com/static/img/coins/64x64/5805.png'},
  {'symbol': 'DOGE', 'name': 'Dogecoin', 'price': 0.081, 'change': -0.9, 'logo': 'https://s2.coinmarketcap.com/static/img/coins/64x64/74.png'},
  {'symbol': 'TRX', 'name': 'TRON', 'price': 0.11, 'change': 0.7, 'logo': 'https://s2.coinmarketcap.com/static/img/coins/64x64/1958.png'},
  {'symbol': 'TON', 'name': 'Toncoin', 'price': 2.3, 'change': 1.2, 'logo': 'https://s2.coinmarketcap.com/static/img/coins/64x64/11419.png'},
  {'symbol': 'DOT', 'name': 'Polkadot', 'price': 7.2, 'change': -0.6, 'logo': 'https://s2.coinmarketcap.com/static/img/coins/64x64/6636.png'},
  {'symbol': 'MATIC', 'name': 'Polygon', 'price': 0.88, 'change': 2.0, 'logo': 'https://s2.coinmarketcap.com/static/img/coins/64x64/3890.png'},
  {'symbol': 'LTC', 'name': 'Litecoin', 'price': 72.0, 'change': -1.3, 'logo': 'https://s2.coinmarketcap.com/static/img/coins/64x64/2.png'},
  {'symbol': 'SHIB', 'name': 'Shiba Inu', 'price': 0.000009, 'change': 5.6, 'logo': 'https://s2.coinmarketcap.com/static/img/coins/64x64/5994.png'},
  {'symbol': 'BCH', 'name': 'Bitcoin Cash', 'price': 250.0, 'change': 1.1, 'logo': 'https://s2.coinmarketcap.com/static/img/coins/64x64/1831.png'},
  {'symbol': 'LINK', 'name': 'Chainlink', 'price': 14.5, 'change': 2.9, 'logo': 'https://s2.coinmarketcap.com/static/img/coins/64x64/1975.png'},
  {'symbol': 'XLM', 'name': 'Stellar', 'price': 0.12, 'change': 0.4, 'logo': 'https://s2.coinmarketcap.com/static/img/coins/64x64/512.png'},
  {'symbol': 'UNI', 'name': 'Uniswap', 'price': 6.4, 'change': -0.8, 'logo': 'https://s2.coinmarketcap.com/static/img/coins/64x64/7083.png'},
];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        const Text(
          'Crypto Market',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: 340,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: cryptoList.length,
            itemBuilder: (context, index) {
              final crypto = cryptoList[index];
              return CryptoCard(
                symbol: crypto['symbol'],
                name: crypto['name'],
                price: crypto['price'],
                change24h: crypto['change'],
                logoUrl: crypto['logo'],
              );
            },
          ),
        ),
      ],
    );
  }
}
