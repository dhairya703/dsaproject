import 'package:firebase_core/firebase_core.dart';
import 'package:firestore/firebase_options.dart';
import 'package:firestore/routes/initial/frame_244_screen.dart';
import 'package:firestore/upload.dart';
import 'package:firestore/user/phone.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'displaying data.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Frame244Screen(),
        'verify': (context) {
          // Retrieve the verificationId from the previous page or wherever it's stored.
          String verificationId = '123456'; // Replace with the actual verificationId
          return OtpVerificationPage(verificationId: verificationId);
        },
      },
      title: 'Nyay Bandhu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: Frame244Screen(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:AppBar(title: Text("AAYIYe"),),
    body: Container(
      child: Column(
        children: [
          ElevatedButton(onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  Upload()),
            );
          } ,child: Text("upload"),),

      ElevatedButton(onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  DataFetch()),
        );
      } ,child: Text("show"),),
        ],
      ),
    ),);
  }
}
