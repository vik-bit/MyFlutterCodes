import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brewcrew/models/brew.dart';

class DatabaseService {
  final String uid1;
  DatabaseService(this.uid1);

  //Collection reference
  // the below line of code has helped us to create a collection in the cloud firestore
  final CollectionReference brewCollection = FirebaseFirestore.instance.collection('brews');

  Future updateuserData(String sugars,String name,int Strength) async{
    return await brewCollection.doc(uid1).set(
      {
        'sugars': sugars,
        'name': name,
        'strength': Strength,
      }
    );


  }
  //brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot){

    return snapshot.docs.map((doc){

      return Brew(name: doc.get('name') , sugars:doc.get('sugar') , strength: doc.get('strength'));
    }
    ).toList();
  }
  //get brews stream
  Stream<List<Brew>> get brews {

    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}