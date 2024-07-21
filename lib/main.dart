import 'package:flutter/material.dart';
import 'screens/apod_list_screen.dart'; // Atualize o caminho conforme necessário

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NASA APOD',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ApodListScreen(), // Tela inicial
    );
  }
}
