import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:talkcoffee/authentication/navigateauthscreen.dart';

import '../variables.dart';

class IntroAuthScreen extends StatefulWidget {
  @override
  _IntroAuthScreenState createState() => _IntroAuthScreenState();
}

class _IntroAuthScreenState extends State<IntroAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Bem-vindo",
          body: "Bem-vindo ao Fala Café o primeiro aplicativo Brasileiro de videoconferência.",
          image: Center(
            child: Image.asset('images/welcome.png', height: 175)
          ),
          decoration: PageDecoration(
            bodyTextStyle: mystyle(20, Colors.black),
            titleTextStyle: mystyle(20, Colors.black),
          )
        ),
        PageViewModel(
          title: "Focamos em você",
          body: "Nossa plataforma foi construída pensando em realizar calls de maneira simples, evitando dificuldades de criar uma conta para que você convide outros participantes.",
          image: Center(
            child: Image.asset('images/conference.png', height: 175)
          ),
          decoration: PageDecoration(
            bodyTextStyle: mystyle(20, Colors.black),
            titleTextStyle: mystyle(20, Colors.black),
          )
        ),
        PageViewModel(
          title: "Segurança",
          body: "Para manter a segurança de nossa plataforma utilizamos tecnologia de ponta, servidores em cloud e um sistema de segurança ativa.",
          image: Center(
            child: Image.asset('images/secure.png', height: 175)
          ),
          decoration: PageDecoration(
            bodyTextStyle: mystyle(20, Colors.black),
            titleTextStyle: mystyle(20, Colors.black),
          )
        )
      ],
      onDone: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigateAuthScreen()));
      },
      onSkip: (){

      },
      showSkipButton: false,
      skip: const Icon(Icons.skip_next,size:45),
      next: const Icon(Icons.arrow_forward_ios),
      done: Text("Done", style: mystyle(20, Colors.black),)
    );
  }
}