import 'package:brewcrew/Screens/Home/home.dart';
import 'package:brewcrew/Screens/authenticate/authenticate.dart';
import 'package:brewcrew/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

 class wrapper extends StatelessWidget {
   const wrapper({Key? key}) : super(key: key);
 
   @override
   Widget build(BuildContext context) {
     final user = Provider.of<userr?>(context);

     print(user);
     // return either home or authenticate screen
     if(user == null) {
       return authencation();
     }
     else{
        return home();
     }

   }
 }
 