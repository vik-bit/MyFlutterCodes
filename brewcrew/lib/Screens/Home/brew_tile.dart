import 'package:flutter/material.dart';
import 'package:brewcrew/models/brew.dart';

class Brewtile extends StatelessWidget {
   final Brew brew;
   Brewtile({ required this.brew});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.green,


          ),
        title: Text(brew.name),
        subtitle: Text('Takes ${brew.sugars} sugar'),

        ),
      ),

    );

  }

}
