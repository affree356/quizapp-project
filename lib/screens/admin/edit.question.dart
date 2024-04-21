import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:quiz_app/functions/database_functions.dart';
import 'package:quiz_app/model/question_model.dart';
import 'package:quiz_app/screens/admin/question_list.dart';
import 'package:quiz_app/widgets/snackbar.dart';


class questionedit extends StatefulWidget {
  final String id;
  questionedit({super.key, required this.id});

  @override
  State<questionedit> createState() => _questioneditState();
}

class _questioneditState extends State<questionedit> {
  final CollectionReference quiz =
      FirebaseFirestore.instance.collection('category_db');
  String? value;
  final List<String> _levels = ["Easy", 'Medium', 'Hard'];
  String? level;

  final TextEditingController qController = TextEditingController();
  final TextEditingController op1Controller = TextEditingController();
  final TextEditingController op2Controller = TextEditingController();
  final TextEditingController op3Controller = TextEditingController();
  String category = '';

  final TextEditingController op4Controller = TextEditingController();

  final TextEditingController ansController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const QuestionList()));
            },
            child:const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 25, 24, 24),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('question_db')
                .doc(widget.id)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CupertinoActivityIndicator();
              } else {
                qController.text = snapshot.data!['question'];
                op1Controller.text = snapshot.data!['options'][0];
                op2Controller.text = snapshot.data!['options'][1];
                op3Controller.text = snapshot.data!['options'][2];
                op4Controller.text = snapshot.data!['options'][3];
                ansController.text = snapshot.data!['correctanswer'].toString();
                level = snapshot.data!['levels'];
                category = snapshot.data!['category'];
                return SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Edit Quiz',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
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
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFececF8),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonFormField(
                            value: level,
                            hint: const Text(
                              '   Choose level',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            onChanged: (value) {
                              setState(() {
                                level = value;
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ),
                            items: _levels.map((e) {
                              return DropdownMenuItem(value: e, child: Text(e));
                            }).toList()),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xFFececF8),
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('category_db')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const CupertinoActivityIndicator();
                              } else {
                                return DropdownButton(
                                    hint: StreamBuilder(
                                        stream: FirebaseFirestore.instance
                                            .collection('category_db')
                                            .doc(category)
                                            .snapshots(),
                                        builder: (context, snapshot) {
                                          if (!snapshot.hasData) {
                                            return const Text('Category');
                                          } else {
                                            return Text(
                                                snapshot.data!['name']);
                                          }
                                        }),
                                    items: List.generate(
                                        snapshot.data!.docs.length, (index) {
                                      // final docId = snapshot.data!.docs[index].id;
                                      return DropdownMenuItem(
                                        value: snapshot.data!.docs[index].id,
                                        child: Text(snapshot.data!.docs[index]
                                            ['name']),
                                      );
                                    }),
                                    onChanged: (value) {
                                      setState(() {
                                        category = value!;
                                      });
                                    });
                              }
                            }),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 270),
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            updateQuestions(widget.id);
                             
                          },
                          child: const Text(
                            'Update',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ));
              }
            }));
  }

  void updateQuestions(String id) async {
    final question = qController.text;
    final option1 = op1Controller.text;
    final option2 = op2Controller.text;
    final option3 = op3Controller.text;
    final option4 = op4Controller.text;
    final correctanswer = ansController.text;

    if (question.isEmpty &&
        option1.isEmpty &&
        option2.isEmpty &&
        option3.isEmpty &&
        option4.isEmpty &&
        correctanswer.isEmpty) {
      return;
    } else {
      List<String> _options = [];
      _options.addAll([
        op1Controller.text,
        op2Controller.text,
        op3Controller.text,
        op4Controller.text
      ]);

      final questions = QuestionModel(
          question: question,
          options: _options,
          correctanswerIndex: int.parse(correctanswer),
          category: category,
          levels: level!);
      await updateQuiz(questions, id);
      customSnackBar(context,
       'update successfully',
        Colors.green);
        Navigator.of(context).pop();
    }
  }
}
