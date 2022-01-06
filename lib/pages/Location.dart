import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  /* void getData() async {
    var name =  await  Future.delayed(Duration(seconds: 3),(){
      return 'Anurag';
    });
    var surname =  await Future.delayed(Duration(seconds: 2),(){
      return ' Kachhala';
    });
    print('$name - $surname');
  }*/

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime _worldTime = locations[index];
    await _worldTime.getTimeData();
    // navigate to home
    Navigator.pop(context, {
      'location': _worldTime.location,
      'time': _worldTime.time,
      'flag': _worldTime.flag,
      'isDaytime': _worldTime.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    print('_LocationState choose Location init state');
    // getData();
    print('_LocationState choose Location init state after get data');
  }

  @override
  Widget build(BuildContext context) {
    print('_LocationState choose Location build');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Choose Location'),
        backgroundColor: Colors.blue[600],
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/tasks.png'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
