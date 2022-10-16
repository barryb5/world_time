import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {

  String? location;
  String? time;
  String? flag;
  String? url;

  WorldTime( { this.location, this.flag, this.url }) {}

  Future<void> getTime() async {

    try {
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      // print(datetime);
      // print(offset);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // Set time to DateTime
      time = now.toString();

      // print(now);
    }
    catch (e) {
      print('Caught error: $e');
      time = 'Big problem tell barry';
    }

  }

}