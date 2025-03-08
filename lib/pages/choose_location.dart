import 'package:flutter/material.dart';
import 'package:world_time_app/services/worldTime.dart';

class Choose_location extends StatefulWidget {
  const Choose_location({super.key});

  @override
  State<Choose_location> createState() => _Choose_locationState();
}

class _Choose_locationState extends State<Choose_location> {

  List<world_time> locations = [

    world_time(location : 'Casablanca' , flag : 'Morroco.jpg' , url : 'Africa/Casablanca'),
    world_time(location : 'Algiers' , flag : 'Algeria.jpg' , url : 'Africa/Algiers'),
    world_time(location : 'Cairo' , flag : 'Egybte.jpg' , url : 'Africa/Cairo'),
    world_time(location : 'Nairobi' , flag : 'Kenya.jpg' , url : 'Africa/Nairobi'),
    world_time(location : 'Bogota' , flag : 'Colombia.jpg' , url : 'America/Bogota'),
    world_time(location : 'Caracas' , flag : 'Vénézuela.jpg' , url : 'America/Caracas'),
    world_time(location : 'Havana' , flag : 'Cuba.jpg' , url : 'America/Havana'),
    world_time(location : 'New York' , flag : 'USA.jpg' , url : 'America/New_York'),
    world_time(location : 'Sao Paulo' , flag : 'Brésil.jpg' , url : 'America/Sao_Paulo'),
    world_time(location : 'Toronto' , flag : 'Canada.jpg' , url : 'America/Toronto'),
    world_time(location : 'Amman' , flag : 'Jordanie.jpg' , url : 'Asia/Amman'),
    world_time(location : 'Baghdad' , flag : 'Irak.jpg' , url : 'Asia/Baghdad'),
    world_time(location : 'Colombo' , flag : 'Sri_Lanka.jpg' , url : 'Asia/Colombo'),
    world_time(location : 'Dubai' , flag : 'UAE.jpg' , url : 'Asia/Dubai'),
    world_time(location : 'Hong Kong' , flag : 'Hong_Kong.jpg' , url : 'Asia/Hong_Kong'),
    world_time(location : 'Seoul' , flag : 'Corée_du_Sud.jpg' , url : 'Asia/Seoul'),
    world_time(location : 'Berlin' , flag : 'Germany.jpg' , url : 'Europe/Berlin'),
    world_time(location : 'Brussels' , flag : 'Belgique.jpg' , url : 'Europe/Brussels'),
    world_time(location : 'Istanbul' , flag : 'Turquie.jpg' , url : 'Europe/Istanbul'),
    world_time(location : 'London' , flag : 'UK.jpg' , url : 'Europe/London'),
    world_time(location : 'Madrid' , flag : 'Espagne.jpg' , url : 'Europe/Madrid'),
    world_time(location : 'Paris' , flag : 'France.jpg' , url : 'Europe/Paris'),
    world_time(location : 'Rome' , flag : 'Italie.jpg' , url : 'Europe/Rome'),
    world_time(location : 'Moscow' , flag : 'Russie.jpg' , url : 'Europe/Moscow'),
  ];

  void updateTime(index) async {
    world_time instance = locations[index];
    await instance.getTime();

    Navigator.pushNamed(context , '/home' , arguments : {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(4, 5, 4, 8),
        child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index){
              return Card(
                elevation: 2.5,
                margin: EdgeInsets.fromLTRB(0, 4, 0,4),
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(
                      locations[index].location,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('images/${locations[index].flag}'),
                  ),
                ),
              );
            }
        ),
      )
    );
  }
}
