import 'package:flutter/material.dart';
import 'package:talkcoffee/screens/profilescreen.dart';
import 'package:talkcoffee/screens/videoconferencescreen.dart';
import 'package:talkcoffee/variables.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;
  List pageoptions = [
    VideoConferenceScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.brown,
        selectedLabelStyle: mystyle(17, Colors.brown),
        unselectedItemColor: Colors.black26,
        unselectedLabelStyle: mystyle(17, Colors.black26), 
        currentIndex: page,
        onTap: (index){
          setState(() {
            page = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Text("Cafézinho"),
            icon: Icon(Icons.video_call,size: 32,) 
          ),
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Text("Perfil"),
            icon: Icon(Icons.person,size: 32,)
          ),
        ],
      ),
      body: pageoptions[page],
    );
  }
}