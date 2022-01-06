import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isDayTime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTimeData() async {
    try {
      var response = await http
          .get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;

        // get time from data
        var utcOffset = jsonResponse['utc_offset'].toString().substring(1, 3);
        var utcDatetime = jsonResponse['utc_datetime'];

        // create date time object
        DateTime now = DateTime.parse(utcDatetime);
        now = now.add(Duration(hours: int.parse(utcOffset)));

        // set the time
        // time = now.toString();
        isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
        time = DateFormat.jm().format(now);
        print('Request success with status: $utcOffset - $utcDatetime - $now.');
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Request failed with status: $e.');
      time = 'Time is not loading';
    }
  }
}
