import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    print('-----------------------');
    print(data);
    data = data.isEmpty ? ModalRoute.of(context).settings.arguments : data;

    String bgImage = data['isItDay'] ? 'day.png' : 'night.png';
    Color bgColor = data['isItDay'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/$bgImage'), fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: Column(
              children: [
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isItDay': result['isItDay'],
                          'flag': result['flag'],
                        };
                      });
                    },
                    icon: Icon(Icons.edit_location, color: Colors.grey[300]),
                    label: Text(
                      'Edit location',
                      style: TextStyle(color: Colors.grey[300]),
                    )),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.airplanemode_active,
                      size: 60,
                      color: Colors.white,
                    ),
                    Text(
                      data['time'],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )));
  }
}
