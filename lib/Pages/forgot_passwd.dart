import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';
class ForgotPassword extends StatefulWidget{
  ForgotPassword({Key? key}): super(key:key);

@override
  _ForgotPasswordState createState()=>_ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey=GlobalKey<FormState>();
  var email='';
  final emailController= TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    super.dispose();
  }
  sendmail()async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              backgroundColor: Colors.deepOrangeAccent,
              content: Text("Email Sent",style: TextStyle(fontSize: 20.0),))
      );
    }
    on FirebaseAuthException catch(e){
      if(e.code=='user-not-found')
        {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  backgroundColor: Colors.deepOrangeAccent,
                  content: Text("Email not registered",style: TextStyle(fontSize: 20.0),))
          );
        }
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Text("Reset link will be sent to Email ID",style: TextStyle(fontSize: 20.0),)
          ),
          Expanded(child: Form(
            key:_formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 30.0),
              child: ListView(
                children: [
                  Container(
                    child: TextFormField(
                      autofocus: false,
                      decoration:  InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontSize: 20.0
                        ),
                        border: OutlineInputBorder(),
                      ),
                      controller: emailController,
                      validator: (value){
                        if(value==null||value.isEmpty){
                          return'Please Enter Email';
                        }
                        else if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                          return"Enter Valid Email";
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
                        ElevatedButton(onPressed: (){
                          if(_formKey.currentState!.validate()){
                            setState(() {
                              email=emailController.text;
                            });
                          }
                          sendmail();
                        }, child: Text('Submit',style: TextStyle(fontSize: 14.0),)),
                        TextButton(onPressed: (){
                          Navigator.pushAndRemoveUntil(context,
                          PageRouteBuilder(pageBuilder: (context,a,b)=>Login(),
                            transitionDuration: Duration(seconds: 0),
                          ), (route)=>false);},
                            child: Text('Login',
                                style: TextStyle(fontSize: 10.0)))
                      ],
                    )
                  )
                ],
              ),
            ),
          ))
        ],
      )
    );
  }
}