import 'package:flutter/material.dart';
import 'package:nasa_apod_app/models/apod_model.dart';

class ApodDetailScreen extends StatelessWidget {
  final Apod apod;

  const ApodDetailScreen({super.key, required this.apod});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(apod.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              (apod.url),
              errorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/images/nophoto.png');
              },
            ),
            const SizedBox(height: 16),
            Text(
              (apod.date),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text((apod.explanation)),
          ],
        ),
      ),
    );
  }
}
