import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Row(
        children: const <Widget>[
          Icon(Icons.map_sharp),
          Text(
            'Choose Location',
            style: TextStyle(fontSize: 20.0, color: Colors.deepOrangeAccent),
          )
        ],
      ),
    );
  }


}
