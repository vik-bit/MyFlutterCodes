import 'package:flutter/material.dart';
import 'package:brewcrew/services/auth.dart';

import '../../shared/loading.dart';
class Register extends StatefulWidget {
  final toggleview;
  Register({required this.toggleview});

  // Text field State

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final authservice _auth = authservice();
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() :Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign up for Hostel Eats'),
        actions: <Widget>[
          TextButton.icon(
              icon: Icon(Icons.person),
              onPressed:() => widget.toggleview(),
              label: Text('Sign in')
          )
        ],

      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),

          child: Form(
            key: _formkey,
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
                  validator: (val) => val!.length < 6?"Enter a password of 6+ characters" : null,
                  obscureText: true ,
                  onChanged: (val){
                    password = val;
                  },
                ),

                SizedBox(height: 20.0),
                TextButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.pink[400])),
                  child: Text(
                    'Sign Up!',
                    style: TextStyle(color: Colors.white),

                  ),
                  onPressed: () async {

                  if(_formkey.currentState!.validate()){
                    setState(() => loading = true );
                        dynamic result = await _auth.Register(email.trim(), password);


                        if(result == null){
                          setState((){
                            error = 'please do valid things';
                            loading = false;
                          });
                        }
                  }
                  },
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
