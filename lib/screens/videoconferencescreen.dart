import 'package:flutter/material.dart';
import 'package:talkcoffee/variables.dart';
import 'package:talkcoffee/videoconference/createmeeting.dart';
import 'package:talkcoffee/videoconference/joinmeeting.dart';

class VideoConferenceScreen extends StatefulWidget {
  @override
  _VideoConferenceScreenState createState() => _VideoConferenceScreenState();
}

class _VideoConferenceScreenState extends State<VideoConferenceScreen> with SingleTickerProviderStateMixin {
  TabController tabController;
  buildtab(String name){
    return Container(
      width: 150,
      height: 50,
      child: Card(
        child: Center(
          child: Text(name,style: mystyle(15, Colors.black, FontWeight.w700))
        )
      )
    );
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown,
        title: Text("Fala Café", style: mystyle(20, Colors.white, FontWeight.w700),),
        bottom: TabBar(
          controller: tabController,
          tabs: [
            buildtab("Tomar Café"),
            buildtab("Fazer Café")
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          JoinMeeting(),
          CreateMeeting()
        ],
      ),
    );
  }
}