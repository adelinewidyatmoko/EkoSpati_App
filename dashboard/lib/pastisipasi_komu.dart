import 'package:flutter/material.dart';

class PatisipasiPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Dashboard'),
        ),
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 16.0),
        padding: EdgeInsets.fromLTRB(16.0, 16.0, 90.0, 16.0),
        color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reboisasi Surabaya",
              style: TextStyle(fontSize: 18.0),
            ),
            Expanded(
              child: Container(
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),

    );//widget
  }
}