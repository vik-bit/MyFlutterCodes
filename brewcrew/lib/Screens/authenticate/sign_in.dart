import 'package:brewcrew/services/auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/loading.dart';

 class Signin extends StatefulWidget {
   final toggleview;


   Signin({required this.toggleview});
   @override

   State<Signin> createState() => _SigninState();
 }

 class _SigninState extends State<Signin> {

   final authservice _auth = authservice();
  // Text field State
   String email = '';
   String password = '';
   String error = '';
   bool loading = false;




   @override
   Widget build(BuildContext context) {
     return loading ? Loading() :Scaffold(
       backgroundColor: Colors.brown[100],
       appBar: AppBar(
         backgroundColor: Colors.brown[400],
         elevation: 0.0,
         title: Text('Sign in'),
         actions: <Widget>[
           TextButton.icon(
               icon: Icon(Icons.person),
               onPressed:() => widget.toggleview(),
               label: Text('Register')
           )
         ],

       ),
   body: Container(
     padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),

       child: Form(
       child: Column(
         children: <Widget>[
           SizedBox(height: 20.0),
           TextFormField(

             validator: (val) => val!.isEmpty ? 'Enter an email' : null,
             onChanged: (val){
                email = val;
             },
           ),
           SizedBox(height: 20.0),
           TextFormField(

             obscureText: true ,
               validator: (val) => val!.length < 6?"Enter a password of 6+ characters" : null,
             onChanged: (val){
               password = val;
             },
           ),

          SizedBox(height: 20.0),
           TextButton(
             style: ButtonStyle(
                 backgroundColor: MaterialStateProperty.all(Colors.pink[400])),
               child: Text(
                 'Sign in',
                 style: TextStyle(color: Colors.white),

               ),
             onPressed: () async {
               setState(() => loading = true );
               dynamic result = await _auth.Sign(email,password);

                  if(result == null){
                    setState((){
                      error = 'please do valid things';
                      loading = false;
                    });
                  }
               }

           ),
           SizedBox(height: 12.0),
           Text(
             error,
             style: TextStyle(color: Colors.red,fontSize: 14.0),
           )
         ],
       ),
     )
   ),
     );
   }
 }
