import 'package:flutter/material.dart';
import 'package:world_time_app/pages/Home.dart';
import 'package:world_time_app/pages/Loading.dart';
import 'package:world_time_app/pages/Location.dart';

void main() => runApp(MaterialApp(initialRoute: '/', routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const Location(),
    }));
