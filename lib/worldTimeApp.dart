import 'package:flutter/material.dart';
import 'package:world_time_app/pages/Home.dart';
import 'package:world_time_app/pages/Loading.dart';
import 'package:world_time_app/pages/Location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => Location()
    },
  ));
}
