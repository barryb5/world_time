// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:world_time/services/homescreen_arguments.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late HomeScreenArguments data;

  @override
  Widget build(BuildContext context) {

    data = data!.isEmpty ? ModalRoute.of(context)!.settings.arguments as HomeScreenArguments : data;
    print(data.toString());
    String bgImage = data!.isDaytime! ? 'day.png' : 'night.png';
    Color? bgColor = data!.isDaytime! ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          )
        ),
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: [
                  TextButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed((context), '/location');

                      setState(() {
                        data = HomeScreenArguments(result.time, result.flag, result.location, result.isDaytime);
                        print('new info ${data.toString()}');
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text(
                      'Edit location',
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 28,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${data!.location}',
                        style: TextStyle(
                          fontSize: 28,
                          letterSpacing: 2,
                          color: data!.isDaytime! ? Colors.black : Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                    '${data!.time}',
                    style: TextStyle(
                      fontSize: 66,
                      color: data!.isDaytime! ? Colors.black : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
        ),
      ),
    );
  }
}
