import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:talkcoffee/variables.dart';
import 'package:uuid/uuid.dart';

class CreateMeeting extends StatefulWidget {
  @override
  _CreateMeetingState createState() => _CreateMeetingState();
}

class _CreateMeetingState extends State<CreateMeeting> {
  String code = '', prefix = '', sufix = '';

  createcode(){
    setState(() {
      prefix = 'cf';
      sufix = Uuid().v1().substring(1,5);
      code = '$prefix$sufix';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text('Crie o código do seu café e convide pessoas para tomar aquele cafézinho com você', style: mystyle(20),textAlign: TextAlign.center,),
          ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Code: ", style: mystyle(30),),
              Text(code, style: mystyle(30, Colors.orange[200], FontWeight.w700),)
            ],
          ),
          SizedBox(height: 25,),
          InkWell(
            onTap: ()=>createcode(),
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: GradientColors.lightBrown)
              ),
              child: Center(
                child: Text("Criar cod do café", style: mystyle(15, Colors.white),),
              ),
            ),
          )
        ],
      ),
    );
  }
}