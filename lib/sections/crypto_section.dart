import 'package:flutter/material.dart';
import '../widgets/crypto_card.dart';


class CryptoSection extends StatelessWidget {
  const CryptoSection({super.key});

  // ===== TOP 20 CRYPTO (PLACEHOLDER DATA) =====
  static final List<Map<String, dynamic>> cryptoList = [
    {
      'symbol': 'BTC',
      'name': 'Bitcoin',
      'price': 43200.0,
      'change': 2.3,
      'logo':
          'https://assets.coingecko.com/coins/images/1/large/bitcoin.png',
    },
    {
      'symbol': 'ETH',
      'name': 'Ethereum',
      'price': 2300.0,
      'change': -1.1,
      'logo':
          'https://assets.coingecko.com/coins/images/279/large/ethereum.png',
    },
    {
      'symbol': 'USDT',
      'name': 'Tether',
      'price': 1.0,
      'change': 0.0,
      'logo':
          'https://assets.coingecko.com/coins/images/325/large/Tether.png',
    },
    {
      'symbol': 'BNB',
      'name': 'BNB',
      'price': 320.0,
      'change': 0.8,
      'logo':
          'https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png',
    },
    {
      'symbol': 'SOL',
      'name': 'Solana',
      'price': 98.0,
      'change': 4.2,
      'logo':
          'https://assets.coingecko.com/coins/images/4128/large/solana.png',
    },
    {
      'symbol': 'XRP',
      'name': 'XRP',
      'price': 0.62,
      'change': -0.4,
      'logo':
          'https://assets.coingecko.com/coins/images/44/large/xrp-symbol-white-128.png',
    },
    {
      'symbol': 'USDC',
      'name': 'USD Coin',
      'price': 1.0,
      'change': 0.0,
      'logo':
          'https://assets.coingecko.com/coins/images/6319/large/USD_Coin_icon.png',
    },
    {
      'symbol': 'ADA',
      'name': 'Cardano',
      'price': 0.52,
      'change': 1.6,
      'logo':
          'https://assets.coingecko.com/coins/images/975/large/cardano.png',
    },
    {
      'symbol': 'AVAX',
      'name': 'Avalanche',
      'price': 36.0,
      'change': 3.1,
      'logo':
          'https://assets.coingecko.com/coins/images/12559/large/coin-round-red.png',
    },
    {
      'symbol': 'DOGE',
      'name': 'Dogecoin',
      'price': 0.081,
      'change': -0.9,
      'logo':
          'https://assets.coingecko.com/coins/images/5/large/dogecoin.png',
    },
    {
      'symbol': 'TRX',
      'name': 'TRON',
      'price': 0.11,
      'change': 0.7,
      'logo':
          'https://assets.coingecko.com/coins/images/1094/large/tron-logo.png',
    },
    {
      'symbol': 'TON',
      'name': 'Toncoin',
      'price': 2.3,
      'change': 1.2,
      'logo':
          'https://assets.coingecko.com/coins/images/17980/large/ton_symbol.png',
    },
    {
      'symbol': 'DOT',
      'name': 'Polkadot',
      'price': 7.2,
      'change': -0.6,
      'logo':
          'https://assets.coingecko.com/coins/images/12171/large/polkadot.png',
    },
    {
      'symbol': 'MATIC',
      'name': 'Polygon',
      'price': 0.88,
      'change': 2.0,
      'logo':
          'https://assets.coingecko.com/coins/images/4713/large/matic-token-icon.png',
    },
    {
      'symbol': 'LTC',
      'name': 'Litecoin',
      'price': 72.0,
      'change': -1.3,
      'logo':
          'https://assets.coingecko.com/coins/images/2/large/litecoin.png',
    },
    {
      'symbol': 'SHIB',
      'name': 'Shiba Inu',
      'price': 0.000009,
      'change': 5.6,
      'logo':
          'https://assets.coingecko.com/coins/images/11939/large/shiba.png',
    },
    {
      'symbol': 'BCH',
      'name': 'Bitcoin Cash',
      'price': 250.0,
      'change': 1.1,
      'logo':
          'https://assets.coingecko.com/coins/images/780/large/bitcoin-cash-circle.png',
    },
    {
      'symbol': 'LINK',
      'name': 'Chainlink',
      'price': 14.5,
      'change': 2.9,
      'logo':
          'https://assets.coingecko.com/coins/images/877/large/chainlink-new-logo.png',
    },
    {
      'symbol': 'XLM',
      'name': 'Stellar',
      'price': 0.12,
      'change': 0.4,
      'logo':
          'https://assets.coingecko.com/coins/images/100/large/Stellar_symbol_black_RGB.png',
    },
    {
      'symbol': 'UNI',
      'name': 'Uniswap',
      'price': 6.4,
      'change': -0.8,
      'logo':
          'https://assets.coingecko.com/coins/images/12504/large/uniswap-uni.png',
    },
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
