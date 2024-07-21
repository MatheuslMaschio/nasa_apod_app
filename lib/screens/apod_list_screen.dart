import 'package:flutter/material.dart';
import 'package:nasa_apod_app/services/api_service.dart';
import 'apod_detail_screen.dart';

class ApodListScreen extends StatefulWidget {
  const ApodListScreen({super.key});

  @override
  _ApodListScreenState createState() => _ApodListScreenState();
}

class _ApodListScreenState extends State<ApodListScreen> {
  final ApiService _apiService = ApiService();
  List<dynamic> _apodList = [];
  List<dynamic> _filteredApodList = [];

  @override
  void initState() {
    super.initState();
    _loadApodList();
  }

  Future<void> _loadApodList() async {
    try {
      final list = await _apiService.fetchApodList();
      setState(() {
        _apodList = list;
        _filteredApodList = list;
      });
    } catch (e) {}
  }

  void _filterApodList(String query) {
    setState(() {
      _filteredApodList = _apodList
          .where((apod) =>
              apod['title'].toLowerCase().contains(query.toLowerCase()) ||
              apod['date'].contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Astronomy Pictures of the day'),
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
                    title: Text(apod['title']),
                    subtitle: Text(apod['date']),
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
