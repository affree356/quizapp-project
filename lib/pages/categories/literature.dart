import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/functions/database_functions.dart';

class literaturePage extends StatefulWidget {
  const literaturePage({super.key});

  @override
  State<literaturePage> createState() => _literaturePageState();
}

class _literaturePageState extends State<literaturePage> {
  @override
  void initState() {
   
    super.initState();
  }

  Future<void>fetchQuestions()async{
   final literatureCategory = await getQuestionsByCategory('Literature');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(stream:FirebaseFirestore.instance.collection('question_db').snapshots(),
      builder:(context,snapshot){
        return Text('');
        
      }  ,)
    );
  }
}