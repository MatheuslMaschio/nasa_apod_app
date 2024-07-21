import 'package:flutter/material.dart';

class ApodDetailScreen extends StatelessWidget {
  final dynamic apod;

  const ApodDetailScreen({super.key, required this.apod});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(apod['title'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(apod['url']),
            const SizedBox(height: 16),
            Text(
              apod['date'],
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(apod['explanation']),
          ],
        ),
      ),
    );
  }
}
