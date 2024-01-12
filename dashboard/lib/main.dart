import 'package:flutter/material.dart';
import 'pastisipasi_komu.dart';

void main(){
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context){

    return MaterialApp(
      title: 'Flutter Dashboard demo',

        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    useMaterial3: true,
      ),
      home: PatisipasiPage(),
    );
  }
}