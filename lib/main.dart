import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Pages/splash_screen.dart';
import 'Pages/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  final Future<FirebaseApp> _initialization=Firebase.initializeApp();
  @override
  Widget build(BuildContext context){
    return FutureBuilder(future: _initialization, builder: (context,snapshot){
      //Check errors
       if(snapshot.hasError){
         print("something went wrong");
       }
       if(snapshot.connectionState==ConnectionState.waiting){
         return(Center(child: CircularProgressIndicator()));
       }
       return MaterialApp(
         title: 'AnotherONE',
         theme: ThemeData.dark().copyWith(
           scaffoldBackgroundColor: Colors.grey[900],
           bottomNavigationBarTheme: const BottomNavigationBarThemeData(
             selectedItemColor: Colors.white,
             backgroundColor: Color(0XFF212121),
           ),
         ),
         debugShowCheckedModeBanner: false,
         home: SplashScreen(),);

    });
  }
}