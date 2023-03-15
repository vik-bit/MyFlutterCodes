import 'package:brewcrew/models/brew.dart';
import 'package:brewcrew/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:brewcrew/services/database.dart';
import 'package:provider/provider.dart';
import 'package:brewcrew/Screens/Home/brew_list.dart';
import 'package:brewcrew/models/brew.dart';

class home extends StatelessWidget {

  final authservice _auth =  authservice();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(

      initialData: [],
      value: DatabaseService('').brews,

      child: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            TextButton.icon(
            icon : Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.SignOut();

            }
            )
          ],
        ),
    body:

    Center(

        child: ListView(),

      ),
      ),
    );

  }
}
