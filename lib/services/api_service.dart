import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseUrl = 'https://api.nasa.gov/planetary/apod';
  final String _apiKey = 'UhYHeXGBZYkt70tymnZNsaLvX2myONVIyapTT2mP';

  Future<List<dynamic>> fetchApodList() async {
    final response =
        await http.get(Uri.parse('$_baseUrl?api_key=$_apiKey&count=10'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Falha ao carregar dados');
    }
  }
}
