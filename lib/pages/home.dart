import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Map data  = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map? ?? {};

    String pgimage = data['isDaytime'] ? 'images/20474745.jpg' : 'images/nynight.jpg';

    Color items_color =  data['isDaytime'] ? Colors.black : Colors.white;

    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('$pgimage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 180, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                    onPressed: () async{
                      dynamic res = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'loacation' : res['location'],
                          'time' : res['time'],
                          'flag' : res['flag'],
                          'isDaytime' : res['isDaytime']
                        };
                      });
                    },
                    icon: Icon(
                        Icons.edit_location,
                        color: items_color,
                        size: 30,
                    ),
                    label: Text(
                      'EDIT',
                      style: TextStyle(
                        color: items_color,
                        letterSpacing: 2.0,
                        fontSize: 17,
                        fontFamily: 'LibreBaskerville',
                        fontWeight: FontWeight.w700
                      ),
                    ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('images/${data['flag']}'),
                      radius: 30,
                    ),
                    SizedBox(width: 8),
                    Text(
                      data['location'],
                      style: TextStyle(
                        color: items_color,
                        fontSize: 32,
                        fontFamily: 'LibreBaskerville',
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 67,
                    color: items_color,
                    fontFamily: 'LibreBaskerville',
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
