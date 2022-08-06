import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isItDay;

  WorldTime({this.url, this.flag, this.location});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
//    print(data);
      String dateTime = data['datetime'];
      String dateOffset = data['utc_offset'].substring(1, 3);
      print(dateTime);
      print(dateOffset);
      DateTime now = DateTime.parse(dateTime);
      DateTime now2 = now.add(Duration(hours: int.parse(dateOffset)));
      print('888888888888888888888');
      print(now.add(Duration(hours: int.parse(dateOffset))));
      print(now2);
      isItDay = now2.hour > 6 && now2.hour < 20;
      time = DateFormat.jm().format(now2);
    } catch (e) {
      print(e);
      time = 'eror has happen';
    }
  }
}
