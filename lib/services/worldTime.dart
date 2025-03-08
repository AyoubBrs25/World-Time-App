import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class world_time {
 late String location;
 late String time ;
 late String flag;
 late String url;
 late bool isDaytime;


 world_time({required this.location , required this.flag , required this.url});

 Future<void> getTime() async {
  try{
   Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
   Map data = jsonDecode(response.body);

   //get properties from data
   String dateTime = data['datetime'];
   String offset = data['utc_offset'].substring(1, 3);

   DateTime now = DateTime.parse(dateTime);
   now = now.add(Duration(hours: int.parse(offset)));
   isDaytime = now.hour > 6 && now.hour <19 ? true : false;
   time = DateFormat.jm().format(now);
  }
  catch(e){
   time = 'Your Location is wrong';
  }

 }




}