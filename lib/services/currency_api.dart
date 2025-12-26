import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyApi {
  static Future<Map<String, dynamic>> fetchRates() async {
    final url = Uri.parse('https://open.er-api.com/v6/latest/PKR');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['rates'];
    } else {
      throw Exception('Failed to load currency rates');
    }
  }
}
