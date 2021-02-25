import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:clima_flutter/weather_model.dart';
import 'package:intl/intl.dart';
Future<Weather> fetchAlbum(String cityName) async {
  final response = await http.get('http://api.weatherapi.com/v1/forecast.json?key=389cdd8038ae41269cd170517210902&q=$cityName&days=2');

  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
//    await Future.delayed(Duration(seconds: 2));
    return Weather.fromJson(jsonDecode(response.body));
//    Weather weather =  Weather.fromJson(jsonDecode(response.body));
//    Weather weather2 =weather;
//    DateTime curdate = DateTime.now();
//    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
//    final String formatted = formatter.format(curdate);
//    weather2.forecast.forecastday[0].hour = [];
//    print(formatted);
//    print(formatted.substring(11,13));
//    print(formatted.substring(11,13));
//    print(formatted.substring(11,13));
//    weather.forecast.forecastday[0].hour.map((e) {
//      if(formatted.substring(11,13).compareTo(e.time.substring(11,13)) == 1 ){
//        weather2.forecast.forecastday[0].hour.add(e);
//      }
//    }).toList();
//    return weather2;
  } else {
    throw Exception('Failed to load album');
  }
}