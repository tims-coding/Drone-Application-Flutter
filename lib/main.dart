import 'package:flutter/material.dart';
import 'package:ui_project/home_page.dart';
import 'package:provider/provider.dart';
import 'package:ui_project/search_model.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchModel(),
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        title: 'Buy Tickets',
        home: HomePage(),
      ),
    );
  }
}
