import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

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

  void setupWorldTime() async {
    WorldTime _worldTime = WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png');
    await _worldTime.getTimeData();
    print('_LoadingState ${_worldTime.time}');
    /* setState(() {
      time = _worldTime.time;
    });*/
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': _worldTime.location,
      'time': _worldTime.time,
      'flag': _worldTime.flag,
      'isDaytime' : _worldTime.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    // getImageData();
    setupWorldTime();

    print('_LoadingState choose Location init state');
  }

  @override
  Widget build(BuildContext context) {
    print('_LoadingState choose Location build');
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
