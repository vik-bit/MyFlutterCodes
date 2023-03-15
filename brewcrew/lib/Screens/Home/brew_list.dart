import 'package:brewcrew/models/brew.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:brewcrew/Screens/Home/brew_tile.dart';

class Brewlist extends StatefulWidget {


  @override
  State<Brewlist> createState() => _BrewlistState();
}

class _BrewlistState extends State<Brewlist> {

  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);

    return ListView.builder(
      itemCount: brews.length,

      itemBuilder: (context , index){
        return Brewtile(brew : brews[index]);

      },

    );
  }
}
