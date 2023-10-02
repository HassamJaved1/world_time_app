import 'dart:convert';

import 'package:http/http.dart';

class Time {
  String location = "", period = "", flag = "", name = "", time = '';
  int? hours, minutes, seconds;

  Time({required this.location, required this.flag, required this.name});

  Future<String> calculateInternationalTime() async {
    String uri = "http://worldtimeapi.org/api/timezone/$location";
    Map dataMap = {};
    Response response = await get(Uri.parse(uri));

    if (response.statusCode == 200) {
      var source = response.body;
      dataMap = jsonDecode(source);
    }

    String temporary = dataMap["datetime"];

    String time = temporary.substring(11, 19);

    List<String> parts = time.split(':');

    hours = int.parse(parts[0]);
    minutes = int.parse(parts[1]);
    seconds = int.parse(parts[2]);

    period = (hours! < 12) ? 'AM' : 'PM';

    if (hours! >= 12) {
      if (hours! % 12 == 0) {
        hours = 12;
      } else {
        hours = (hours! % 12);
      }
    }

    time = '$hours:$minutes:$seconds $period';

    return time;
  }
}
