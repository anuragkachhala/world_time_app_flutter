import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  /* Future<void> getImageData() async {
    var response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      var title = jsonResponse['title'];
      print('Title of Todos: $title.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }*/

  getTimeData() async {
    var response = await http.get(
        Uri.parse('http://worldtimeapi.org/api/timezone/America/Los_Angeles'));
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var utcOffset = jsonResponse['utc_offset'].toString().substring(1, 3);
      var utcDatetime = jsonResponse['utc_datetime'];
      DateTime now = DateTime.parse(utcDatetime);
      now = now.add(Duration(hours: int.parse(utcOffset)));
      print(
          'Request success with status: ${utcOffset} - ${utcDatetime} -${now}.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    super.initState();
    // getImageData();
    getTimeData();
    print('_LoadingState choose Location init state');
  }

  @override
  Widget build(BuildContext context) {
    print('_LoadingState choose Location build');
    return Scaffold(
      body: Text('Loading Screen....'),
    );
  }
}
