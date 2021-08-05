import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../variables.dart';

class JoinMeeting extends StatefulWidget {
  @override
  _JoinMeetingState createState() => _JoinMeetingState();
}

class _JoinMeetingState extends State<JoinMeeting> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController roomcontroller = TextEditingController();
  bool isVideoMuted = true;
  bool isAudioMuted = true;
  String username = '';

  @override
  void initState() {
    super.initState();
    getuserdata();
  }
 
  getuserdata() async {
    DocumentSnapshot userdoc = await usercollection.doc(FirebaseAuth.instance.currentUser.uid).get();
    setState(() {
      username = userdoc.data()['username'];
    });
  }

  joinmeeting() async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      if(Platform.isAndroid){
        featureFlag.callIntegrationEnabled = false;
      } else if(Platform.isIOS){
        featureFlag.pipEnabled = false;
      }

      var options = JitsiMeetingOptions(room: roomcontroller.text)
        ..userDisplayName = 
            namecontroller.text == '' ? username : namecontroller.text
        ..serverURL = 'https://meet.uhub.team'
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

        
      await JitsiMeet.joinMeeting(options);
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 24,),
              Text('Cod do Café', style: mystyle(20),),
              SizedBox(height: 20,), 
              PinCodeTextField(
                appContext: context,
                controller: roomcontroller,
                length: 6,
                autoDisposeControllers: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline
                ),
                animationDuration: Duration(milliseconds: 300),
                onChanged: (value)=>{},
              ),
              SizedBox(height: 10,),
              TextField(
                controller: namecontroller,
                style: mystyle(20),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nome (Apenas caso não queria usar o padrão )",
                  labelStyle: mystyle(15)
                ),
              ),
              SizedBox(height: 16,),
              CheckboxListTile(
                value: isVideoMuted,
                onChanged: (value){
                  setState(() {
                    isVideoMuted = value;
                  });
                },
                title: Text("Video Mudo", style: mystyle(18,Colors.black),),
              ),
              SizedBox(height: 16,),
              CheckboxListTile(
                value: isAudioMuted,
                onChanged: (value){
                  setState(() {
                    isAudioMuted = value;
                  });
                },
                title: Text("Audio Mudo", style: mystyle(18,Colors.black),),
              ),
              SizedBox(height: 20,),
              Text("Estas configurações são apenas para o momento do acesso, você poderá alterar após acessar a reunião", style: mystyle(15), textAlign: TextAlign.center,),
              Divider(
                height: 48,
                thickness: 2.0,
              ),
              InkWell(
                onTap: ()=>joinmeeting(),
                child: Container(
                  width: double.maxFinite,
                  height: 64,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: GradientColors.lightBrown)
                  ),
                  child: Center(
                    child: Text("Acessar sala do Cafézinho", style: mystyle(18, Colors.white),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}