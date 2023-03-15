import 'package:brewcrew/Screens/authenticate/register.dart';
import 'package:brewcrew/Screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';


class authencation extends StatefulWidget {


  @override
  State<authencation> createState() => _authencationState();
}

class _authencationState extends State<authencation> {
  bool showsignin = true;

  toggleview() {
    setState(() => showsignin = !showsignin);

  }

  @override
  Widget build(BuildContext context) {
    if (showsignin == true) {
      return Signin(toggleview: toggleview);
    } else {
      return Register(toggleview: toggleview);
    }
  }
}
