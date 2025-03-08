import 'package:flutter/material.dart';
import 'package:world_time_app/services/worldTime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {


  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void setupWorldtime() async{
    world_time instance = world_time(location: 'Algiers', flag: 'Algeria.jpg', url: 'Africa/Algiers');
    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime
    });


  }

  @override

  void initState(){
    super.initState();
    setupWorldtime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitDancingSquare(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
