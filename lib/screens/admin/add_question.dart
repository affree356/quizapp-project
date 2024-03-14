

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:quiz_app/functions/database_functions.dart';
import 'package:quiz_app/model/question_model.dart';

class addQuestionPage extends StatefulWidget {
  const addQuestionPage({super.key});

  @override
  State<addQuestionPage> createState() => _addQuestionPageState();
}

class _addQuestionPageState extends State<addQuestionPage> {
   final CollectionReference quiz = FirebaseFirestore.instance.collection('quiz');
 String ? value;
  final List<String> _levels = ["Easy", 'Medium', 'Hard'];
 String ?level;

  final TextEditingController qController = TextEditingController();
  final TextEditingController op1Controller = TextEditingController();
  final TextEditingController op2Controller = TextEditingController();
  final TextEditingController op3Controller = TextEditingController();
   String category = '2goDHAQTayoOIqMVCjfM';
   
  final TextEditingController op4Controller = TextEditingController();

  final TextEditingController ansController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: Colors.white,),
        backgroundColor: const Color.fromARGB(255, 25, 24, 24),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Add Quiz',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(0xFFececF8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: qController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "   Enter a Question",
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      )),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Option 1',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(0xFFececF8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: op1Controller,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "   Enter Option 1",
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      )),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Option 2',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(0xFFececF8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: op2Controller,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "   Enter Option 2",
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      )),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Option 3',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(0xFFececF8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: op3Controller,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "   Enter Option 3",
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      )),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Option 4',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(0xFFececF8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: op4Controller,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "   Enter Option 4",
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      )),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Correct answer',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(0xFFececF8),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: ansController,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "   Enter correct answer",
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20 ),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFececF8),
                    borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonFormField(
                  
                    hint: const Text('   Choose level',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                    onChanged: (value) {
                      setState(() {
                       level=value;
                      });
                    },
                    icon: const Icon(Icons.arrow_drop_down,color: Colors.black,),
                    items: _levels.map((e) {
                      return DropdownMenuItem(
                        value: e, child: Text(e));
                    }).toList()),
              ),
            ),
            const SizedBox(height: 20),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20 ),
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFececF8),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                  
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('quiz').snapshots(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData){
                      return const CupertinoActivityIndicator();
                    }else{
                      return DropdownButton(
                        hint: StreamBuilder(
                          stream: FirebaseFirestore.instance.collection('quiz').doc(category).snapshots(),
                          builder: (context, snapshot) {
                            if(!snapshot.hasData){
                              return const Text('Category');
                            }else{
                              return Text(snapshot.data!['category']);
                            }
                          }
                        ),
                      items: List.generate(snapshot.data!.docs.length, (index){
                        return DropdownMenuItem(value: snapshot.data!.docs[index].id,child: Text(snapshot.data!.docs[index]['category']),);
                      }),
                    onChanged: (value){
                      setState(() {
                        category=value!;
                      });
                    });
                    }
                  }
                ),
              ),
            ),
             
            const SizedBox(height: 10,),
             Padding(
               padding: const EdgeInsets.only(left: 270),
               child: Container(
                width: 100,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), 
               ),
                child: ElevatedButton(onPressed: (){
                  uploaditem();
                 },
                 child: const Text('Upload',style: TextStyle(color: Colors.white,fontSize: 16 ,fontWeight: FontWeight.bold ),),
                 style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                 
                   ),),
               ),
             ),
          ],
      
             
             ),
      
          
        ),
    );
    
  }
  uploaditem()async{
    if(qController.text.isNotEmpty&&  op1Controller.text.isNotEmpty && op2Controller.text.isNotEmpty&&
    op3Controller.text.isNotEmpty&&  op4Controller.text.isNotEmpty){
     List<String>opt=[];
    
    
     opt.addAll([op1Controller.text,op2Controller.text,op3Controller.text,op4Controller.text]);
    final data = QuestionModel(question: qController.text, options: opt, correctanswerIndex:int.parse(ansController.text),
      category: category, levels: level!);
     addQuiz(data);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.greenAccent, 
       content: Text('Added successfully',style: TextStyle(fontSize: 18),)));
     
  }
}
} 