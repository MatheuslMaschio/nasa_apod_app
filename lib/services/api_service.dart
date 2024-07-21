import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import '../models/apod_model.dart';

class ApiService {
  final String _baseUrl = 'https://api.nasa.gov/planetary/apod';
  final String _apiKey = 'UhYHeXGBZYkt70tymnZNsaLvX2myONVIyapTT2mP';

  Future<List<Apod>> fetchApodList() async {
    try {
      final response =
          await http.get(Uri.parse('$_baseUrl?api_key=$_apiKey&count=20'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);
        final apodList = jsonList.map((json) => Apod.fromJson(json)).toList();
        await _cacheApodList(apodList);
        return apodList;
      } else {
        return await _getCachedApodList();
      }
    } catch (e) {
      return await _getCachedApodList();
    }
  }

  Future<void> _cacheApodList(List<Apod> apodList) async {
    final box = await Hive.openBox('apodBox');
    final List<Map<String, dynamic>> jsonList =
        apodList.map((apod) => apod.toJson()).toList();
    await box.put('apodList', jsonEncode(jsonList));
  }

  Future<List<Apod>> _getCachedApodList() async {
    final box = await Hive.openBox('apodBox');
    final cachedData = box.get('apodList');
    if (cachedData != null) {
      final List<dynamic> jsonList = jsonDecode(cachedData);
      return jsonList.map((json) => Apod.fromJson(json)).toList();
    } else {
      throw Exception('Nenhum dado em cache encontrado');
    }
  }
}
