import 'dart:convert';
import 'package:http/http.dart'as http;

class CurrencyService {
  final String apiKey = 'YOUR_API_KEY'; // Replace with your API key
  final String baseUrl = 'https://open.er-api.com/v6/latest';

  Future<Map<String, dynamic>> fetchRates(String baseCurrency) async {
    final url = Uri.parse('$baseUrl/$baseCurrency');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load exchange rates');
    }
  }
}
