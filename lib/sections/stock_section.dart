import 'package:flutter/material.dart';
import '../widgets/stock_card.dart';

class StockSection extends StatelessWidget {
  const StockSection({super.key});

  // ===== TOP 20 STOCKS (PLACEHOLDER DATA) =====
  static final List<Map<String, dynamic>> stocks = [
  {'symbol': 'AAPL', 'name': 'Apple', 'price': 190.4, 'change': 1.2, 'logo': 'https://financialmodelingprep.com/image-stock/AAPL.png'},
  {'symbol': 'MSFT', 'name': 'Microsoft', 'price': 375.6, 'change': -0.6, 'logo': 'https://financialmodelingprep.com/image-stock/MSFT.png'},
  {'symbol': 'GOOGL', 'name': 'Alphabet', 'price': 138.2, 'change': 0.9, 'logo': 'https://financialmodelingprep.com/image-stock/GOOGL.png'},
  {'symbol': 'AMZN', 'name': 'Amazon', 'price': 152.8, 'change': 1.7, 'logo': 'https://financialmodelingprep.com/image-stock/AMZN.png'},
  {'symbol': 'META', 'name': 'Meta', 'price': 485.1, 'change': -1.1, 'logo': 'https://financialmodelingprep.com/image-stock/META.png'},
  {'symbol': 'TSLA', 'name': 'Tesla', 'price': 248.3, 'change': 2.5, 'logo': 'https://financialmodelingprep.com/image-stock/TSLA.png'},
  {'symbol': 'NVDA', 'name': 'NVIDIA', 'price': 890.7, 'change': 3.1, 'logo': 'https://financialmodelingprep.com/image-stock/NVDA.png'},
  {'symbol': 'JPM', 'name': 'JPMorgan', 'price': 172.9, 'change': -0.4, 'logo': 'https://financialmodelingprep.com/image-stock/JPM.png'},
  {'symbol': 'V', 'name': 'Visa', 'price': 275.4, 'change': 0.3, 'logo': 'https://financialmodelingprep.com/image-stock/V.png'},
  {'symbol': 'MA', 'name': 'Mastercard', 'price': 455.2, 'change': 0.6, 'logo': 'https://financialmodelingprep.com/image-stock/MA.png'},
  {'symbol': 'NFLX', 'name': 'Netflix', 'price': 610.5, 'change': -1.8, 'logo': 'https://financialmodelingprep.com/image-stock/NFLX.png'},
  {'symbol': 'ADBE', 'name': 'Adobe', 'price': 525.6, 'change': 1.1, 'logo': 'https://financialmodelingprep.com/image-stock/ADBE.png'},
  {'symbol': 'ORCL', 'name': 'Oracle', 'price': 118.3, 'change': 0.4, 'logo': 'https://financialmodelingprep.com/image-stock/ORCL.png'},
  {'symbol': 'INTC', 'name': 'Intel', 'price': 43.7, 'change': -0.7, 'logo': 'https://financialmodelingprep.com/image-stock/INTC.png'},
  {'symbol': 'IBM', 'name': 'IBM', 'price': 183.4, 'change': 0.2, 'logo': 'https://financialmodelingprep.com/image-stock/IBM.png'},
  {'symbol': 'PEP', 'name': 'PepsiCo', 'price': 170.8, 'change': -0.3, 'logo': 'https://financialmodelingprep.com/image-stock/PEP.png'},
  {'symbol': 'KO', 'name': 'Coca-Cola', 'price': 61.4, 'change': 0.5, 'logo': 'https://financialmodelingprep.com/image-stock/KO.png'},
  {'symbol': 'DIS', 'name': 'Disney', 'price': 104.2, 'change': 1.4, 'logo': 'https://financialmodelingprep.com/image-stock/DIS.png'},
  {'symbol': 'CSCO', 'name': 'Cisco', 'price': 49.6, 'change': -0.2, 'logo': 'https://financialmodelingprep.com/image-stock/CSCO.png'},
  {'symbol': 'PFE', 'name': 'Pfizer', 'price': 27.9, 'change': -0.8, 'logo': 'https://financialmodelingprep.com/image-stock/PFE.png'},
];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        const Text(
          'Stock Market',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: 380,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            itemCount: stocks.length,
            itemBuilder: (context, index) {
              final s = stocks[index];
              return StockCard(
                symbol: s['symbol'],
                name: s['name'],
                price: s['price'],
                change24h: s['change'],
                logoUrl: s['logo'],
              );
            },
          ),
        ),
      ],
    );
  }
}
