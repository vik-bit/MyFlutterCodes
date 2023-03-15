import 'package:brewcrew/Screens/wrapper.dart';
import 'package:brewcrew/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brewcrew/models/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return StreamProvider<userr?>.value(
      catchError: (_, __) => null,
      value: authservice().user,
      initialData: null,
      child: MaterialApp(

        home: wrapper(),
      ),
    );

  }
}


