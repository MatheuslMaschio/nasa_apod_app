import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/apod_model.dart';
import 'apod_detail_screen.dart';

class ApodListScreen extends StatefulWidget {
  const ApodListScreen({super.key});

  @override
  _ApodListScreenState createState() => _ApodListScreenState();
}

class _ApodListScreenState extends State<ApodListScreen> {
  final ApiService _apiService = ApiService();
  List<Apod> _apodList = [];
  List<Apod> _filteredApodList = [];

  @override
  void initState() {
    super.initState();
    _loadApodList();
  }

  // Método para carregar a lista de APODs
  Future<void> _loadApodList() async {
    try {
      final list = await _apiService.fetchApodList();
      setState(() {
        _apodList = list;
        _filteredApodList = list;
      });
    } catch (e) {
      // Mostrar mensagem de erro
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Erro'),
          content: const Text(
              'Não foi possível carregar os dados. Verifique sua conexão com a internet.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  // Método para filtrar a lista de APODs
  void _filterApodList(String query) {
    setState(() {
      _filteredApodList = _apodList
          .where((apod) =>
              apod.title.toLowerCase().contains(query.toLowerCase()) ||
              apod.date.contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Astronomy Pictures of the Day'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterApodList,
              decoration: const InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _loadApodList, // Atualiza a lista ao puxar para baixo
              child: ListView.builder(
                itemCount: _filteredApodList.length,
                itemBuilder: (context, index) {
                  final apod = _filteredApodList[index];
                  return ListTile(
                    title: Text(apod.title),
                    subtitle: Text(apod.date),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ApodDetailScreen(apod: apod),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
