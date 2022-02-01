import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginprac/Pages/HomePage.dart';
import 'package:loginprac/Pages/forgot_passwd.dart';
import 'package:loginprac/Pages/register.dart';
class Login extends StatefulWidget {
  Login({Key? key}): super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>{
  final _formKey= GlobalKey<FormState>();
  var email='';
  var passwd='';
  final regex = RegExp(r'^[a-zA-Z0-9]+$');

  final emailcontroller= TextEditingController();
  final passwdcontroller= TextEditingController();
  @override
  void dispose(){
    //clean up the controller when the widget is disposed
    emailcontroller.dispose();
    passwdcontroller.dispose();
    super.dispose();
  }
//Login is verified and User is directed to respective page from this method
loggingin() async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: passwd);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
        backgroundColor: Colors.lightBlueAccent,
            content: Text("Succesfully logged in",style: TextStyle(fontSize: 20.0),))
      );
      Navigator.pushAndRemoveUntil(context,
          PageRouteBuilder(pageBuilder: (context,a,b)=>HomePage(),
            transitionDuration: Duration(seconds: 0),
          ),
              (route)=>false);

    }
    on FirebaseAuthException catch(e){
       if(e.code=="wrong-password"){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: Colors.lightBlueAccent,
                content: Text("Wrong Password",style: TextStyle(fontSize: 20.0),)));
      }
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Login")),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child: ListView(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Container(
                  child: Image(image: AssetImage('assest/yt_logo_dark.png')),
                ),
              ),
              SizedBox(height: 100,),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'email',
                    labelStyle: TextStyle(fontSize: 20.0),
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(
                        color: Colors.lightBlueAccent, fontSize: 15.0),
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
                        color: Colors.lightBlueAccent, fontSize: 15.0),
                  ),
                  controller: passwdcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Password";
                    }
                    else if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)) {
                      return "Please enter valid Password";
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 60.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {
                      //Validate returns true if the form is valid else false
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          email = emailcontroller.text; //user inputs are in controller so we store them in seperate vars
                          passwd = passwdcontroller.text;
                        });
                      }
                      loggingin();
                    }, child: Text('Login', style: TextStyle(fontSize: 18.0))
                    ),
                    TextButton(onPressed: () {
                      Navigator.pushAndRemoveUntil(context,
                          PageRouteBuilder(pageBuilder: (context,a,b)=>ForgotPassword(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                              (route)=>false);
                    },
                        child: Text('Forgot Password',
                            style: TextStyle(fontSize: 14.0))),
                    TextButton(onPressed: () {
                      Navigator.pushAndRemoveUntil(context,
                          PageRouteBuilder(pageBuilder: (context,a,b)=>Signup(),
                      transitionDuration: Duration(seconds: 0),
                      ),
                      (route)=>false);
                    },
                        child: Text('Sign up',
                            style: TextStyle(fontSize: 14.0))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}