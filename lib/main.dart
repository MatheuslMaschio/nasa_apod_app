import 'package:flutter/material.dart';
import 'screens/apod_list_screen.dart'; // Atualize o caminho conforme necessário

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NASA APOD',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ApodListScreen(), // Tela inicial
    );
  }
}
