import 'package:flutter/material.dart';
import 'package:moor_example/data/cars.dart';
import 'package:provider/provider.dart';

import 'data/cars.dart';
import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final db = CarDatabase();
    return MultiProvider(
      providers: [
        Provider(builder: (_) => db.carDao)
      ],
      child: MaterialApp(
        title: 'Material App',
        home: HomePage(),
      ),
    );
  }
}