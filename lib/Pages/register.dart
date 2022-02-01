import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';
class Signup extends StatefulWidget {
  Signup({Key? key}): super(key: key);
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup>{
  final _formKey= GlobalKey<FormState>();
  var email='';
  var passwd='';
  var confpwd='';

  final emailcontroller= TextEditingController();
  final passwdcontroller= TextEditingController();
  final confirmcontroller=TextEditingController();
  @override
  void dispose(){
    //clean up the controller when the widget is disposed
    emailcontroller.dispose();
    passwdcontroller.dispose();
    confirmcontroller.dispose();
    super.dispose();
  }
  //Sending name and password to Firebase
   registration()async{
    if(passwd==confpwd){
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: passwd);
        SnackBar(
            backgroundColor: Colors.lightBlueAccent,
            content: Text("Succesfully Registered. Logged in",style: TextStyle(fontSize: 20.0),));
       /* Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Home()));*/
      }
      on FirebaseAuthException catch(e){
        if(e.code=='weak-password')
        {
          print("Password is too weak");
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: Colors.lightBlueAccent,
                  content: Text("Weak Password",style: TextStyle(fontSize: 20.0),)));
        }
        else if(e.code=="email-already-in-use"){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: Colors.lightBlueAccent,
                  content: Text("Email Already in Use",style: TextStyle(fontSize: 20.0),)));
        }
      }
    }else{
      print("Not matching");
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.lightBlueAccent,
              content: Text("Password does not match",style: TextStyle(fontSize: 20.0),)));
    }
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Register")),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'email',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(
                        color: Colors.redAccent, fontSize: 15.0),
                  ),
                  controller: emailcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Email";
                    }
                    else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
                      return "Please enter valid Email";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'password',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(
                        color: Colors.redAccent, fontSize: 15.0),
                  ),
                  controller: passwdcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Password";
                    }
                    else if (value.length < 8) {
                      return "Please enter valid Password";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Confirm password',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(
                        color: Colors.redAccent, fontSize: 15.0),
                  ),
                  controller: confirmcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Password";
                    }
                    else if (value.length < 8) {
                      return "Please enter valid Password";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 60.0),
                child:
                    ElevatedButton(onPressed: () {
                      //Validate returns true if the form is valid else false
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          email = emailcontroller.text; //user inputs are in controller so we store them in seperate vars
                          passwd = passwdcontroller.text;
                          confpwd=confirmcontroller.text;
                        });
                        registration();
                      }
                    }, child: Text('Signup', style: TextStyle(fontSize: 18.0))
                    )),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?'
                        ),
                        TextButton(onPressed: () {
                          Navigator.pushAndRemoveUntil(context,
                              PageRouteBuilder(pageBuilder: (context,a,b)=>Login(),
                                transitionDuration: Duration(seconds: 0),
                              ),
                                  (route)=>false);
                        },
                            child: Text('Login',
                                style: TextStyle(fontSize: 14.0)))
                      ],
                    ),
                  ],
                ),
              )
          ));
  }
}