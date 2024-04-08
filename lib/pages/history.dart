import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
body: Column(
  // crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    SizedBox(height: 30,
   ),

    Padding(
      padding: EdgeInsets.only(left: 150),
      child: Text('History',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
    )
  ],
),
    );
  }
}