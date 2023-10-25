import 'package:flutter/material.dart';
import 'data_table_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kejaksaan Tinggi Negeri Flores',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: DataTableScreen(),
    );
  }
}