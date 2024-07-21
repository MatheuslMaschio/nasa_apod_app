import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/apod_model.dart';

class ApiService {
  final String _baseUrl = 'https://api.nasa.gov/planetary/apod';
  final String _apiKey = 'UhYHeXGBZYkt70tymnZNsaLvX2myONVIyapTT2mP';

  Future<List<Apod>> fetchApodList() async {
    final response =
        await http.get(Uri.parse('$_baseUrl?api_key=$_apiKey&count=20'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);

      return jsonList.map((json) => Apod.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar dados');
    }
  }
}
